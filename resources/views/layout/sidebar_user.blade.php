<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <img src="{{asset('dist/img/logopolindra.png')}}" alt="Polindra Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Kopkar Polindra</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{asset('dist/img/member.png')}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">{{Auth::user()->name}}</a>
            </div>
        </div>
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="{{route('user.dashboard')}}" class="nav-link {{Route::currentRouteName() == 'user.dashboard' ? 'active' : ''}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.poinuser') }}" class="nav-link {{Route::currentRouteName() == 'user.poin' ? 'active' : ''}}">
                        <i class="fa fa-dollar-sign nav-icon"></i>
                        <p>Manage Poin</p>
                    </a>
                </li>
                <li class="nav-item {{(strpos(Route::currentRouteName(), 'user.payment') === 0) ? 'menu-is-opening menu-open' : ''}}">
                    <a href="#" class="nav-link {{(strpos(Route::currentRouteName(), 'user.payment') === 0) ? 'active' : ''}}">
                        <i class="fa fa-comment-dollar nav-icon"></i>
                        <p>
                            Pembayaran
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('user.payment.main.index')}}" class="nav-link {{Route::currentRouteName() == 'user.payment.main.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon ml-4"></i>
                                <p>Simpanan Pokok</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('user.payment.monthly.index')}}" class="nav-link {{Route::currentRouteName() == 'user.payment.monthly.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon ml-4"></i>
                                <p>Simpanan Wajib</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('user.payment.other.index')}}" class="nav-link {{Route::currentRouteName() == 'user.payment.other.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon ml-4"></i>
                                <p>Simpanan Sukarela</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.keuangan') }}" class="nav-link {{Route::currentRouteName() == 'user.keuangan' ? 'active' : ''}}">
                        <i class="fa fa-chart-line nav-icon"></i>
                        <p>Keuangan anggota</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>