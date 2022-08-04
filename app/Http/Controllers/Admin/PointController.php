<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PointController extends Controller
{
    public function index(Request $request)
    {
        return view('admin.Point.index');
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

        //dd($data);  
        // echo '</pre>'; 
        if (count(@$data->{'data'}) != 0) {
            // echo '<pre>';
            $data_trx = @$data->{'data'};
            $nominal_min = 10000;
            $ttl_       =0;
            foreach ($data_trx as $key) 
            {

                if(@$key->{'customer_detail'}->{'CUSTOMER_PARTNER_NAME'})
                {
                    //Carbon::parse untuk merubah format tgl
                    $created_at     = Carbon::parse($key->{'created_at'})->format('Y-m-d');

                    $nominal_awal   = @$key->{'TRANSACTION_TOTAL'};

                    $db_get         = DB::table('tb_poin_fandi')
                    //strtolower untuk merubah string menjadi huruf kecil. 
                    ->where('id_user', strtolower(@$key->{'created_by'}->{'USER_FULLNAME'}))
                    ->whereDate('tanggal_poin', $created_at)
                    ->where('status', 'aktif')
                    ->get();
                    $nom = 0;
                    $totalpoinsebelumnya = 0;
                    foreach ($db_get as $key2) 
                    {
                        $nom                    += @$key2->nominal;
                        $totalpoinsebelumnya    += @$key2->jumlah_poin;
                    }
                    
                    $ttl_           = (floor(($nom + $nominal_awal) / $nominal_min)) - $totalpoinsebelumnya;
                    $ttl_           =$ttl_>0?$ttl_:0;
                    $db_get         = DB::table('tb_poin_fandi')->where('id_transaksi', @$key->{'TRANSACTION_ID'})->first(); 
                    if (!$db_get) 
                    {
                        DB::table('tb_poin_fandi')->insert(
                            [
                                'jumlah_poin'           => $ttl_,
                                'id_transaksi'          => @$key->{'TRANSACTION_ID'},
                                'tanggal_poin'          => @$created_at,
                                'id_user'               => strtolower(trim(@$key->{'customer_detail'}->{'CUSTOMER_PARTNER_NAME'})),
                                'nominal'               => @$key->{'TRANSACTION_TOTAL'},
                                'status'                => 'aktif',
                                'custmer_partner_name'=>@$key->{'created_by'}->{'USER_FULLNAME'}
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
        print json_encode(array('error' => $error));
    }

    public function gettablepoin(Request $request)
    {
        $db_get         = DB::table('tb_poin_fandi') 
        ->select('tb_poin_fandi.*', 'tb_poin_fandi.jumlah_poin as total')  
        ->where('tb_poin_fandi.status','aktif')
        ->paginate(20);
        $i=0;
        foreach ($db_get as $key) 
        {


          $i++;
          

      }
      print json_encode(array('db_get' => $db_get));
  }

  public function editpointransaksi(Request $request)
  {
     $cek=DB::table('tb_poin_dipakai')->where('id_user', 'like',$request->input('id_user'))->first();
     if($cek)
     {
         DB::table('tb_poin_dipakai')->where('id_user','like', $request->input('id_user'))->increment('poin',$request->input('penguranganpoin'));
     }
     else
     {
        DB::table('tb_poin_dipakai')->insert(['poin'=>$request->input('penguranganpoin'),'id_user'=>$request->input('id_user')]);
    }

    print json_encode(array('error' => false));
}
public function hapuspointransaksi(Request $request)
{
    DB::table('tb_poin_fandi')
    ->where('id_poin', $request->input('id_poin'))
    ->update(['status'  => 'hapus']);
    print json_encode(array('error' => false));

}
public function pointdetailbelanja(Request $request)
{
    $dt_poin=DB::table('tb_poin_fandi')
    ->select('tb_belanja.*','tb_poin_fandi.tanggal_poin')
    ->leftJoin('tb_belanja','tb_belanja.no_trax','=','tb_poin_fandi.id_transaksi')
    ->where('tb_poin_fandi.id_poin', $request->input('id_detail'))->first();
    @$dt_poin->atribut=@unserialize($dt_poin->atribut)?unserialize($dt_poin->atribut):array();

    print json_encode(array('dt_poin' =>$dt_poin));
        // test
} 
public function gettotalpoin(Request $request)
{
    $jumlah_poin         = DB::table('tb_poin_fandi') 
    ->where('id_user','like', $request->input('id_user'))  
    ->where('status','=','aktif')  

    ->sum('jumlah_poin');
    $jumlah_dipakai  = DB::table('tb_poin_dipakai') 
    ->where('id_user','like', $request->input('id_user'))  
    ->first();
    $dipakai=@$jumlah_dipakai->poin?$jumlah_dipakai->poin:0;


    print json_encode(array('jumlah_poin' =>$jumlah_poin-$dipakai,'jumlah_dipakai'=>$dipakai));
        // test
}

}
