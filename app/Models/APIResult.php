<?php

/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

class APIResult
{

    public $status = 200;
    //201:không tồn tại function truyền lên
    //202:giá trị thuộc tính không trùng  
    //203 : bị exception
    public $data;
    public $result;
    public $count;
    public $message = "";

    public function toJson()
    {
        $data1 = new \stdClass();
        $data1->count = $this->count;
        $data1->result = $this->result;
        $this->data = $data1;
        return json_encode([
            'status' => $this->status,
            'data' => $this->data,
            'message' => $this->message
        ]);
    }

}
