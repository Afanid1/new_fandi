@extends('layout.master_user') 
@section('title') 
Dashboard
@endsection 
@section('css') 
@endsection 
@section('content')
<?php

?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Data Poin</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Data Poin</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Data Poin</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>

                </div>
                <div class="card-body">
                    <table>
                        <tr><td id="jumlahpoin"></td></tr>
                        <tr><td id="digunakan"></td></tr>
                        <tr><td id="sisa"></td></tr></table>                    
                        <table class="table center">
                            <tr>
                                <th>id_transaksi</th>
                                <th>tanggal_poin</th>
                                <th>id_user</th>
                                <th>nominal</th>
                                <th>jumlah_poin</th> 
                                <th>Aksi</th>
                            </tr>
                            <tbody id="listPoin">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <!-- /.content-wrapper -->
    @endsection

    @section('script')
    <script>
        $(document).ready(function () {
            gettable();
            function gettable() {
                fetch("{{url('user/get-table-poin')}}", {
                    method: 'GET'
                }).then(res => res.json()).then(data => {
                    var let_='';
                    for (let key of data.getpoin.data) {
                        let_ += `<tr>
                        <th>` + key.id_transaksi + `</th>
                        <th>` + key.tanggal_poin + `</th>
                        <th>` + key.id_user + `</th>
                        <th>` + key.nominal + `</th>
                        <th>` + key.jumlah_poin + `</th> 
                        <th data-id_poin="` + key.id_poin + `" 
                        ><a class="btn btn-warning Detail">Detail</a></th>  
                        </tr>`
                    }
                    $('#jumlahpoin').html('total poin:'+data.jumlah_poin);
                    $('#digunakan').html('total poin yg dinakan:'+data.digunakan);
                    $('#sisa').html('total sisa :'+parseInt(data.jumlah_poin)-parseInt(data.digunakan));


                    $('#listPoin').html(let_);
                });
            }
            $('body').delegate('.Detail','click',function(e)
            {
                e.preventDefault();
                window.location.href="{{url('user/get-table-poin')}}/"+$(this).closest('th').data('id_poin');
            });
        })
    </script>
    @endsection
