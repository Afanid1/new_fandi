@extends('layout.master_user')
@section('title')
Dashboard
@endsection
@section('css')
@endsection
@section('content')


<style>
    .info-box {
        min-height: 100px;

    }

    .btn-light {
        color: #28a745;
    }

    .info-box .info-box-icon {
        width: 88px;
        font-size: 3rem;
    }
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard v1</li>
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
                    <h3 class="card-title">Data Chart</h3>
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
                    <div class="row">
                        <div class="col-12 col-sm-5 col-md-4">
                            <div class="info-box bg-success">
                                <span class="info-box-icon btn-light elevation-1"><i class="fa fa-dollar-sign"></i></span>
                                <div class="info-box-content">
                                    <h5 class="info-box-text">Poin Anda</h5>
                                    <h3 class="info-box-number ml-2s">
                                        {{ $tb_poin_fandi }}
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-5 col-md-4">
                            <div class="info-box bg-success">
                                <span class="info-box-icon btn-light elevation-1"><i class="fa fa-dollar-sign"></i></span>
                                <div class="info-box-content">
                                    <h5 class="info-box-text">Total Simpanan Anda</h5>
                                    <h3 class="info-box-number ml-2s">
                                        {{ $wallets }}
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3>{{$main_payments}}</h3>
                                    <p>Total Simpan Pokok</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3>{{$monthly_payments}}</h3>

                                    <p>Total Simpan Wajib</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3>{{$other_payments}}</h3>
                                    <p>Total Simpan Sukarela</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
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
    $(document).ready(function() {

    })
</script>
@endsection