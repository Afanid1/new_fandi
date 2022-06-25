@extends('layout.master')

@section('title')
Manage Point
@endsection

@section('css')
<!-- DataTables -->
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<style>
    .dt-buttons {
        padding-bottom: 20px;
    }

    .input-group-addon {
        padding: .5rem .75rem;
        margin-bottom: 0;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.25;
        color: #495057;
        text-align: center;
        background-color: #e9ecef;
        border: 1px solid rgba(0, 0, 0, .15);
        border-radius: .25rem;
    }
</style>
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <div class="container">
        <table class="table centerW">
            <tr>
                <th>id_user</th> 
                <th>custmer_partner_name</th> 
                <th>Total Poin</th>
                <th>Total Poin yg digunakan</th>

                <th>Aksi</th>
            </tr>
            <tbody id="listPoin">
            </tbody>
        </table>
    </div>
</div>
<div id="statusModal" class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title align-self-center mt-0">EDIT POIN</h5>
            </div>
            <div class="modal-body text-center">
                <div class="msg-Alert"></div>
                <form id="simpaneditpoin" name="simpaneditpoin">
                    <div class="form-group">
                        <label>Gunakan Poin</label>
                        <input type="text" name="penguranganpoin" class="form-control">
                    </div>
                    <button class="btn btn-primary btn-sm" type="sumbit">Junakan</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /.content-wrapper -->
<script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
<script>
    $(document).ready(function() {

        gettable();
        insertPoinrealtime();

        function insertPoinrealtime() {
            // const Form_hps_item  = new FormData();
            // Form_hps_item.append('_token', '{{csrf_token()}}');  
            var url_ = "{{url('point/get-poin-transaksi')}}";
            fetch(url_, {
                method: 'GET'
            }).then(res => res.json()).then(data => {
                if (!data.error) {
                    gettable();
                }
                setTimeout(function() {
                    insertPoinrealtime();
                }, 5500);

            });
        }

        function gettable() {
            fetch("{{url('point/get-table-poin')}}", {
                method: 'GET'
            }).then(res => res.json()).then(data => {
                var let_ = '';
                for (let key of data.db_get.data) {
                    var cs=key.custmer_partner_name?key.custmer_partner_name:'-';
                    let_ += `<tr>
                    
                    <th>` + cs + `</th>  
                    <th>` + key.id_user + `</th> 
                    <th>` + key.total + `</th>
                    <th>` + key.yg_dihunakan + `</th>

                    <th 
                    data-id_poin="`+key.id_user+`"  data-total="`+key.total+`"
                    ><a class="btn btn-warning Editini">gunakan poin</a></th>  
                    </tr>`
                }
                $('#listPoin').html(let_);
            });
        }

        $('body').delegate('.Editini', 'click', function(e) {
            e.preventDefault();
            window.id_poin=$(this).closest('th').data('id_poin');
            window.total_poin=$(this).closest('th').data('total');
            $('input[name="penguranganpoin"]').val(window.total_poin)
            $('.msg-Alert').html('Jumlah Poin :' +$(this).closest('th').data('total'))
            $('#statusModal').modal('show');

        });
        $('body').delegate('#simpaneditpoin', 'submit', function(e) {
            e.preventDefault();
            var total_=parseInt(window.total_poin)-parseInt($('input[name="penguranganpoin"]').val());
            
            if(total_<1)
            {
                alert('poin tidak mencukupi');
                return;
            }
            const simpaneditpoin = document.forms.namedItem('simpaneditpoin');
            const Form_hps_item = new FormData(simpaneditpoin);
            Form_hps_item.append('_token', '{{csrf_token()}}');
            Form_hps_item.append('id_poin', window.id_poin);
            fetch("{{url('point/edit-poin-transaksi')}}", {
                method: 'POST',
                body: Form_hps_item
            }).then(res => res.json()).then(data => {
                gettable();
                $('#statusModal').modal('hide');

            });

        });
        $('body').delegate('.HapusIni', 'click', function(e) {
            e.preventDefault();
            if (!confirm('yakin untuk menghapus data ini?')) {
                return;
            }

            fetch("{{url('point/hapus-poin-transaksi')}}?id_poin=" + $(this).data('id_poin'), {
                method: 'GET'
            }).then(res => res.json()).then(data => {
                gettable();

            });

        });
    });
</script>
@endsection