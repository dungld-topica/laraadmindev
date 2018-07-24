<?php

/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Models\APIResult;
use DB;
/**
 * Class HomeController
 * @package App\Http\Controllers
 */
class APIController extends Controller {

    protected $data;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->data = new APIResult();
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function index() {
        
    }

    public function GetAPI(Request $request) {
        $this->data->result = 1;
        return $this->data->toJson();
    }

    public function PostAPI(Request $request) {
        $func = $request->input('func');
        if(isset($func)&& $func!=null){
            try{
                $this->$func();
            }catch(\Exception $ex){
                $this->data->status = 201; 
                $this->data->message ="Có lỗi về func";
            }
        }else{
           $this->data->status = 202; 
           $this->data->message ="Không có tham số func";
        }
        return $this->data->toJson();
    }
    public function abc(){
        try{
          $this->data->status = 200; 
        }catch(\Exception $ex){
             $this->data->status = 205; 
             $this->data->message ="có lỗi trong hàm function";
        }
    }
    public function abcd($request){
        try{
          $table = DB::table('xxxxx')->get();
        }catch(\Exception $ex){
            
             $this->data->status = 2051; 
             $this->data->message = "";
        }
    }
}
