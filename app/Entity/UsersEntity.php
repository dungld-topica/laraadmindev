<?php

/**
 * Model genrated using huantn
 * Help: http://navigo-tech.com
 */

namespace App\Entity;

class UsersEntity
{
    public $id;
    public $name;
    public $context_id;
    public $email;
    public $password;
    public $type;
    public $designation;
    public $gender;
    public $mobile;
    public $address;
    public $birth_day;


    public function __construct($var)
    {
        if (is_object($var)) {
            $this->id = $var->id;
            $this->name = $var->name;
            $this->context_id = $var->context_id;
            $this->email = $var->email;
            $this->password = $var->password;
            $this->type = $var->type;
            $this->designation = $var->designation;
            $this->gender = $var->gender;
            $this->mobile = $var->mobile;
            $this->address = $var->address;
            $this->birth_day = $var->birth_day;

        } else if (is_array($var)) {
            if (isset($var["id"])) {
                $this->id = $var["id"];
            }
            if (isset($var["name"])) {
                $this->name = $var["name"];
            }
            if (isset($var["context_id"])) {
                $this->context_id = $var["context_id"];
            }
            if (isset($var["email"])) {
                $this->email = $var["email"];
            }
            if (isset($var["password"])) {
                $this->password = $var["password"];
            }
            if (isset($var["type"])) {
                $this->type = $var["type"];
            }
            if (isset($var["designation"])) {
                $this->designation = $var["designation"];
            }
            if (isset($var["gender"])) {
                $this->gender = $var["gender"];
            }
            if (isset($var["mobile"])) {
                $this->mobile = $var["mobile"];
            }
            if (isset($var["address"])) {
                $this->address = $var["address"];
            }
            if (isset($var["birth_day"])) {
                $this->birth_day = $var["birth_day"];
            }

        } else if ($var > 0) {
            $var = \App\Models\User::find($var);

            $this->id = $var->id;
            $this->name = $var->name;
            $this->context_id = $var->context_id;
            $this->email = $var->email;
            $this->password = $var->password;
            $this->type = $var->type;
            $this->designation = $var->designation;
            $this->gender = $var->gender;
            $this->mobile = $var->mobile;
            $this->address = $var->address;
            $this->birth_day = $var->birth_day;

        }
    }

}
