@extends("la.layouts.app")

@section("contentheader_title")
    <a href="{{ url(config('laraadmin.adminRoute') . '/users') }}">User</a> :
@endsection
@section("contentheader_description",'Add')
@section("section", "Users")
@section("section_url", url(config('laraadmin.adminRoute') . '/users'))
@section("sub_section", "Add")

@section("htmlheader_title", "")

@section("main-content")

    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="box">
        <div class="box-header">

        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    {!! Form::open(['action' => 'LA\UsersController@store', 'id' => 'user-add-form']) !!}
                    @la_form($module)

                    {{--
                    @la_input($module, 'name')
                    @la_input($module, 'context_id')
                    @la_input($module, 'email')
                    @la_input($module, 'password')
                    @la_input($module, 'type')
                    @la_input($module, 'designation')
                    @la_input($module, 'gender')
                    @la_input($module, 'mobile')
                    @la_input($module, 'address')
                    @la_input($module, 'birth_day')
                    --}}
                    <div class="form-group">
                        <label for="role">Role* :</label>
                        <select class="form-control" required="1" data-placeholder="Select Role" rel="select2"
                                name="role">
                            <?php $roles = App\Role::all(); ?>
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}">{{ $role->name }}</option>
                                @if($role->id != 1)

                                @endif
                            @endforeach
                        </select>
                    </div>
                    <br>
                    <div class="form-group">
                        {!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
                        <button class="btn btn-default pull-right"><a
                                    href="{{ url(config('laraadmin.adminRoute') . '/users') }}">Cancel</a></button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script>
        $(function () {

        });
    </script>
@endpush
