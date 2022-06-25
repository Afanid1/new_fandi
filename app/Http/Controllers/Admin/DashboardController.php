<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
	public function index()
	{
		return view('admin.dashboard');
	}
	public function loginmember(Request $request)
	{
		Auth::loginUsingId($request->input('id_login'));
		print json_encode(array('error' => false));
	}
}
