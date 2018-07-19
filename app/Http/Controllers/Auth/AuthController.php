<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Models\Employee;
use App\Role;
use Validator;
use Eloquent;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

use DB;
use Mail;
use Log;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware($this->guestMiddleware(), ['except' => 'logout']);
    }

    public function showRegistrationForm()
    {
        $roleCount = Role::count();
        if ($roleCount != 0) {
            // 20180301 - DungLD - Start - Add Register User
            return view('auth.register');
            // 20180301 - DungLD - End - Add Register User

            /*$userCount = User::count();
            if($userCount == 0) {
                return view('auth.register');
            } else {
                return redirect('login');
            }*/
        } else {
            return view('errors.error', [
                'title' => 'Migration not completed',
                'message' => 'Please run command <code>php artisan db:seed</code> to generate required table data.',
            ]);
        }
    }

    public function showLoginForm()
    {
        $roleCount = Role::count();
        if ($roleCount != 0) {
            $userCount = User::count();
            if ($userCount == 0) {
                return redirect('register');
            } else {
                return view('auth.login');
            }
        } else {
            return view('errors.error', [
                'title' => 'Migration not completed',
                'message' => 'Please run command <code>php artisan db:seed</code> to generate required table data.',
            ]);
        }
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'user.name' => 'required|max:255',
            'user.email' => 'required|email|max:255|unique:users',
            'user.password' => 'required|min:6|confirmed',
            'g-recaptcha-response' => 'required' // 20180302 - DungLD - Captcha
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array $data
     * @return User
     */
    protected function create(array $data)
    {
        // TODO: This is Not Standard. Need to find alternative
        Eloquent::unguard();

        // 20180301 - DungLD - Start - Add Register User
        DB::beginTransaction();
        $employee = Employee::create([
            'name' => $data['name'],
            'designation' => $data['name'],
            'mobile' => "",
            'email' => $data['email'],
            'gender' => 'Male',
            'dept' => "2",
            'address' => "Hanoi",
            'about' => "About user / biography",
            'date_birth' => date("Y-m-d"),
        ]);

        $password = $this->generateStrongPassword();

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($password),
            'context_id' => $employee->id,
            'type' => "Employee",
        ]);
        $role = Role::where('name', 'USER_REGISTER')->first();
        $user->attachRole($role);

        // Send mail to User his Password
        Mail::send('emails.send_login_cred', ['user' => $user, 'password' => $password], function ($m) use ($user) {
            $m->from('dungld@navigo-tech.com', 'Ly Dinh Dung');
            $m->to($user->email, $user->name)->subject('Core Project - Your Login Credentials');
        });

        Log::info("User created: username: " . $user->email . " Password: " . $password);
        DB::commit();
        // 20180301 - DungLD - End - Add Register User

        /*$employee = Employee::create([
            'name' => $data['name'],
            'designation' => "Super Admin",
            'mobile' => "8888888888",
            'mobile2' => "",
            'email' => $data['email'],
            'gender' => 'Male',
            'dept' => "1",
            'city' => "Pune",
            'address' => "Karve nagar, Pune 411030",
            'about' => "About user / biography",
            'date_birth' => date("Y-m-d"),
            'date_hire' => date("Y-m-d"),
            'date_left' => date("Y-m-d"),
            'salary_cur' => 0,
        ]);
        
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'context_id' => $employee->id,
            'type' => "Employee",
        ]);
        $role = Role::where('name', 'SUPER_ADMIN')->first();
        $user->attachRole($role);*/

        return $user;
    }

    private function generateStrongPassword($length = 8, $add_dashes = false, $available_sets = 'luds')
    {
        $sets = array();
        if (strpos($available_sets, 'l') !== false)
            $sets[] = 'abcdefghjkmnpqrstuvwxyz';
        if (strpos($available_sets, 'u') !== false)
            $sets[] = 'ABCDEFGHJKMNPQRSTUVWXYZ';
        if (strpos($available_sets, 'd') !== false)
            $sets[] = '23456789';
        if (strpos($available_sets, 's') !== false)
            $sets[] = '!@#$%&*?';
        $all = '';
        $password = '';
        foreach ($sets as $set) {
            $password .= $set[array_rand(str_split($set))];
            $all .= $set;
        }
        $all = str_split($all);
        for ($i = 0; $i < $length - count($sets); $i++)
            $password .= $all[array_rand($all)];
        $password = str_shuffle($password);
        if (!$add_dashes)
            return $password;
        $dash_len = floor(sqrt($length));
        $dash_str = '';
        while (strlen($password) > $dash_len) {
            $dash_str .= substr($password, 0, $dash_len) . '-';
            $password = substr($password, $dash_len);
        }
        $dash_str .= $password;
        return $dash_str;
    }
}
