<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Entity\UsersEntity;

class User extends Model
{
    use SoftDeletes;

    protected $table = 'users';

    protected $hidden = [

    ];

    protected $guarded = [];

    protected $dates = ['deleted_at'];
    //huanttn
    protected $fillable = ['name', 'context_id', 'email', 'password', 'type', 'designation', 'gender', 'mobile', 'address', 'birth_day'];
    static $redirect_url = null;
    static $rules = array(
        //refer https://laravel.com/docs/5.5/validation#available-validation-rules
        'name' => 'required|min:5|max:250',
        'context_id' => '',
        'email' => 'max:250|unique:users',
        'password' => 'required|min:6|max:250',
        'type' => '',
        'designation' => 'max:50',
        'gender' => '',
        'mobile' => 'min:10|max:20',
        'address' => 'max:1000',
        'birth_day' => '',

    );

    static function InsertEntity($entity)
    {
        $entityArr = (array)$entity;
        return static::insertModule("Users", $entity, $entityArr, self::$redirect_url);
    }

    static function UpdateEntity($entity, $id)
    {
        if ($id == 0) {
            return config('laraadmin.admin') . '/';
        }
        if (isset($entity->id)) {
            unset($entity->id);
        }
        $entityArr = (array)$entity;
        return static::updateModule("Users", $entity, $id, $entityArr, self::$redirect_url);
    }

    static function getByKey($id)
    {
        return new UsersEntity($id);
    }

    static function getAll()
    {
        $lst = User::all();
        $arr = array();
        foreach ($lst as $val) {
            $t = new UsersEntity($val);
            $arr[] = $t;
        }
        return $arr;
    }
    //end huantn
}
