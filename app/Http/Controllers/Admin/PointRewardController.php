<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OtherPayment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PointRewardController extends Controller
{
    public function index(Request $request)
    {
        return view('admin.Reward.index');
    }

    public function getpointransaksi(Request $request)
    {

        $error = true;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://apidprod.mudahkan.com/v1/transaction?store_id=8cf3f861bcb15e13f844f605ef95656a',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJhMWY4ZGU3ZWUwNTBmY2UzYjI3ZDFhZDcxOGYyODc0ZCIsImlhdCI6MTY0ODE3Mjg4Mn0.ldreRBPmdUsRdFFrhAbVDIOXuevKhxhZCJUyyO8UHG0'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        $data = json_decode($response);

        // echo '</pre>'; 
        if (@$data) {
            // echo '<pre>';
            $data_trx = @$data->{'data'};
            $nominal_min = 10000;
            foreach ($data_trx as $key) {
                if (@$key->{'customer_detail'}->{'CUSTOMER_PARTNER_NAME'}) {
                    $created_at     = Carbon::parse($key->{'created_at'})->format('Y-m-d');
                    //echo '<pre>';
                    $nominal_awal   = @$key->{'TRANSACTION_TOTAL'};
                    // echo '</pre>';
                    $db_get         = DB::table('tb_poin_fandi')
                        ->where('id_user', strtolower(@$key->{'created_by'}->{'USER_FULLNAME'}))
                        //->whereDate('tanggal_poin', $created_at)
                        ->where('status', 'aktif')
                        ->get();
                    $nom = 0;
                    $totalpoinsebelumnya = 0;
                    foreach ($db_get as $key2) {
                        $nom                    +=    @$key2->nominal;
                        $totalpoinsebelumnya    += @$key2->jumlah_poin;
                    }

                    if ($nominal_awal > $nominal_min) {
                        $ttl_           = (floor(($nom + $nominal_awal) / $nominal_min)) - $totalpoinsebelumnya;
                        $db_get         = DB::table('tb_poin_fandi')->where('id_transaksi', @$key->{'TRANSACTION_ID'})->first();
                        if (!$db_get) {
                            DB::table('tb_poin_fandi')->insert(
                                [
                                    'jumlah_poin'           => abs($ttl_),
                                    'id_transaksi'          => @$key->{'TRANSACTION_ID'},
                                    'tanggal_poin'          => @$created_at,
                                    'id_user'               => strtolower(trim(@$key->{'customer_detail'}->{'CUSTOMER_PARTNER_NAME'})),
                                    'nominal'               => @$key->{'TRANSACTION_TOTAL'},
                                    'status'                => 'aktif',
                                    'custmer_partner_name' => @$key->{'created_by'}->{'USER_FULLNAME'}
                                ]
                            );
                            $detao_belanja = array();
                            $io = 0;
                            foreach (@$key->{'detail'} as $key_1) {
                                $detao_belanja[$io] = array(
                                    'qty'           => @$key_1->{'DETAIL_TRANSACTION_QTY_PRODUCT'},
                                    'harga'         => @$key_1->{'DETAIL_TRANSACTION_PRICE_PRODUCT'},
                                    'sub_total'     => @$key_1->{'PRICE_AFTER_DISCOUNT'},
                                    'nm_barang'     => @$key_1->{'product'}->{'PRODUCT_NAME'}
                                );
                                $io++;
                            }
                            $daftarbelanja = serialize($detao_belanja);
                            DB::table('tb_belanja')->insert(
                                [
                                    'no_trax'  => @$key->{'TRANSACTION_ID'},
                                    'atribut'  => $daftarbelanja
                                ]
                            );

                            $error = false;
                        }
                    }
                }
            }
        }
        print json_encode(array('error' => $error));
    }

    public function gettablepoint(Request $request)
    {
        $db_get         = DB::table('tb_poin_fandi')
            ->select('id_user', DB::raw('sum(jumlah_poin) as total'))
            ->groupBy('id_user')
            ->paginate(20);
        $i = 0;
        foreach ($db_get as $key) {
            $data_pp               = DB::table('tb_poin_fandi')->where('id_user', $key->id_user)->whereNotNull('custmer_partner_name')->first();
            $poin_ygdigunakan         = DB::table('tb_poin_dipakai')->where('id_user', $key->id_user)->first();
            $db_get[$i]->id_user = $data_pp->id_user;
            $db_get[$i]->custmer_partner_name = $data_pp->custmer_partner_name;
            $db_get[$i]->total = @$poin_ygdigunakan->poin ? $key->total - @$poin_ygdigunakan->poin : $key->total;
            $db_get[$i]->yg_dihunakan = @$poin_ygdigunakan->poin ? @$poin_ygdigunakan->poin : 0;

            $i++;
        }
        print json_encode(array('db_get' => $db_get));
    }

    public function editpointransaksi(Request $request)
    {
        $cek = DB::table('tb_poin_dipakai')->where('id_user', $request->input('id_poin'))->first();
        if ($cek) {
            DB::table('tb_poin_dipakai')->where('id_user', $request->input('id_poin'))->increment('poin', $request->input('penguranganpoin'));
        } else {
            DB::table('tb_poin_dipakai')->insert(['poin' => $request->input('penguranganpoin'), 'id_user' => $request->input('id_poin')]);
        }

        print json_encode(array('error' => false));
    }
    public function hapuspointransaksi(Request $request)
    {
        DB::table('tb_poin_fandi')
            ->where('id_poin', $request->input('id_poin'))
            ->update(['status'  => 'hapus']);
        print json_encode(array('error' => false));
        // test
    }
}
