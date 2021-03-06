<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Zizaco\Entrust\Traits\EntrustUserTrait;

use App\Entity\UsersEntity;

class User extends Model implements AuthenticatableContract, AuthorizableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;
    use SoftDeletes {
        restore as private restoreA;
    }
    use EntrustUserTrait {
        restore as private restoreB;
    }

    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', "role", "context_id", "type"
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    // protected $dates = ['deleted_at'];

    /**
     * @return mixed
     */
    public function uploads()
    {
        return $this->hasMany('App\Upload');
    }

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

    public function restore()
    {
        $this->restoreA();
        $this->restoreB();
    }
}
