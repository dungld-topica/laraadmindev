@extends('la.layouts.auth')

@section('htmlheader_title')
    Register
@endsection

@section('content')

    <body class="hold-transition register-page">
    <!-- 20180302 - DungLD - Start - Change Language-->

    <form action="{{ url('/language') }}" method="post">
        <select name="locale">
            <option value="en" {{ App::getLocale() == 'en' ? ' selected' : '' }}>English</option>
            <option value="vi" {{ App::getLocale() == 'vi' ? ' selected' : '' }}>Tiếng Việt</option>
        </select>
        {{ csrf_field() }}
        <input type="submit" value="Submit">
    </form>
    {{--{{ trans('label.lbl_name') }} | {{ trans('label.lbl_username') }} | {{ trans('label.lbl_pass') }} | @lang('validation.register.name')--}}

    <!-- 20180302 - DungLD - End - Change Language -->
    <div class="register-box">
        <div class="register-logo">
            <a href="{{ url('/home') }}"><b>{{ LAConfigs::getByKey('sitename_part1') }} </b>{{ LAConfigs::getByKey('sitename_part2') }}
            </a>
        </div>

        @if (count($errors) > 0)
            <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <div class="register-box-body">
            <!--<p class="login-box-msg">Register Super Admin</p>-->
            <p class="login-box-msg">{{ trans('label.title.register user') }}</p>
            <form action="{{ url('/register') }}" method="post">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="form-group has-feedback">
                <!--<input type="text" class="form-control" placeholder="Full name" name="name" value="{{ old('name') }}"/>-->
                    <input type="text" class="form-control" placeholder="{{ trans('validation.attributes.user.name') }}"
                           name="name" value="{{ old('name') }}"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                <!--<input type="email" class="form-control" placeholder="Email" name="email" value="{{ old('email') }}"/>-->
                    <input type="email" class="form-control"
                           placeholder="{{ trans('validation.attributes.user.email') }}" name="email"
                           value="{{ old('email') }}"/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <!-- 20180301 - DungLD - Start - Captcha Register User -->
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password" value="123456"
                           style="display: none"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback" style="display: none"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Retype password"
                           name="password_confirmation" value="123456" style="display: none"/>
                    <span class="glyphicon glyphicon-log-in form-control-feedback" style="display: none"></span>
                </div>
                <div class="form-group has-feedback g-recaptcha"
                     data-sitekey="6Lf8u0kUAAAAAGuzuGeFnSFdIcfaif6-qkHUZqd7"></div>
                <!-- 20180301 - DungLD - End - Captcha Register User -->
                <!--
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Password" name="password"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Retype password" name="password_confirmation"/>
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                -->
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <!--<input type="checkbox"> I agree to the terms-->
                                <input type="checkbox"> {{ trans('label.title.agree terms') }}
                            </label>
                        </div>
                    </div><!-- /.col -->
                    <div class="col-xs-4">
                        <!--<button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>-->
                        <button type="submit"
                                class="btn btn-primary btn-block btn-flat">{{ trans('label.button.register') }}</button>
                    </div><!-- /.col -->
                </div>
            </form>

            @include('auth.partials.social_login')
            <hr>
        <!--<center><a href="{{ url('/login') }}" class="text-center">Login</a></center>-->
            <center><a href="{{ url('/login') }}" class="text-center">{{ trans('label.button.login') }}</a></center>
        </div><!-- /.form-box -->
    </div><!-- /.register-box -->

    @include('la.layouts.partials.scripts_auth')

    <script>
        $(function () {
            $("button[type=submit]").attr("disabled", "disabled"); // 20180301 - DungLD - Register User

            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });

            // 20180301 - DungLD - Start - Register User
            $('input').on('ifChecked', function (event) {
                //alert(event.type + ' callback');
                $("button[type=submit]").removeAttr("disabled");
            });

            $('input').on('ifUnchecked', function (event) {
                //alert(event.type + ' callback');
                $("button[type=submit]").attr("disabled", "disabled");
            });
            // 20180301 - DungLD - End - Register User
        });
    </script>
    </body>

@endsection
