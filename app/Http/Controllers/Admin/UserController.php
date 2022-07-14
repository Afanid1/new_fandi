<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Roles;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{
    private $isSuccess;
    private $exception;

    public function __construct()
    {
        $this->isSuccess = false;
        $this->exception = null;
    }

    public function index()
    {
        return view('admin.user.index');
    }

    public function datatables()
    {
        $user = User::where('role_id', '!=', Roles::where('name', 'admin')->first()->id)->orderBy('id','DESC')->get();
        return DataTables::of($user)->make();
    }

    public function show($id)
    {
        $data['user'] = User::find($id);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        try {

            $data['role_id']=Roles::where('name', 'user')->first()->id;
            $data['email']=$request->email;
            $data['username']=$request->username;
            if($request->id)
            {
               if($request->password)
               {

                $data['password']= Hash::make($request->password);
            } 
        }
        else
        {
            $data['password']= Hash::make($request->password);
        }
        $data['registered_at']=$request->registered_at;
        $data['status']=$request->status;
        $data['member_id']=$request->member_id;
        $data['name']=$request->name;
        $data['phone_number']=$request->phone_number;
        $data['address']=$request->address;
        $data['tmt']=$request->tmt;





        DB::beginTransaction();
        $data = User::updateOrCreate(
            ['id' => $request->id],
            $data
        );
        if ($request->file("file")) {
            $file_video = $request->file("file");
            $nameVideo = time() . "_" . $file_video->getClientOriginalName();
            $pathVideo = 'memento/' . $nameVideo;
            $aws =  AwsClient::upload($request->file("file"), $pathVideo);
        }
        DB::commit();
        $this->isSuccess = true;
    } catch (\Exception $e) {
        DB::rollBack();

        $this->exception = App::environment('local') ? $e->getMessage() : "Terjadi kesalahan!";
    }

    return response()->json([
        "status"    => $this->isSuccess ?? false,
        "code"      => $this->isSuccess ? 200 : 600,
        "message"   => $this->isSuccess ? "Success!" : ($this->exception ?? "Unknown error(?)"),
        "data"      => $this->isSuccess ? $data : [],
    ], 201);
}

public function destroy($id)
{
    DB::beginTransaction();
    try {
        $data = User::findOrFail($id);
        $data->delete();

        DB::commit();
        $this->isSuccess = true;
    } catch (Exception $e) {
        DB::rollBack();
        $this->exception = $e->getMessage();
    }

    return response()->json([
        "status"    => $this->isSuccess ?? false,
        "code"      => $this->isSuccess ? 200 : 600,
        "message"   => $this->isSuccess ? "Success!" : ($this->exception ?? "Unknown error(?)"),
        "data"      => $this->isSuccess ? $data : [],
    ], 201);
}
}
