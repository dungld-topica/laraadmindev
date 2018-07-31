@extends("la.layouts.app")

@section("contentheader_title", "Users")
@section("contentheader_description", "Users listing")
@section("section", "Users")
@section("sub_section", "Listing")
@section("htmlheader_title", "Users Listing")

@section("headerElems")
    @la_access("Users", "create")
    <!--<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add User</button>-->
    <button class="btn btn-success btn-sm pull-right"><a style="color:#FFF;"
                                                         href="{{ url(config('laraadmin.adminRoute') . '/users/create') }}">Add
            User</a></button>
    @endla_access
@endsection

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

    <div class="search-form">
        <form id="form1" name="form1" method="GET" action="">
            <div class="form-group">
                <input class="form-control" placeholder="Search" id="search" name="search" type="text" value="">
            </div>
        </form>
    </div>

    <!-- DungLD - Start -->
    @foreach( $list as $item )
        <div class="box box-solid">
            <div class="box-header with-border">
                <h3 class="box-title"><a
                            href="{{ url(config('laraadmin.adminRoute') . '/users/' . $item->id )}}">{{ $item->$view_col }}</a>
                </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <blockquote>
                    @foreach( $listing_cols as $col )
                        @if ($col != 'id' && $col != $view_col)
                            <p>{{ $module->fields[$col]['label'] or ucfirst($col) }}: {{ $item->$col }}</p>
                        @endif
                    @endforeach
                </blockquote>
            </div>
            <!-- /.box-body -->
        </div>
    @endforeach
    {{ $list->links() }}
    <!-- DungLD - End -->

    <div class="box box-success">
        <!--<div class="box-header"></div>-->
        <div class="box-body">
            <table id="example1" class="table table-bordered">
                <thead>
                <tr class="success">
                    @foreach( $listing_cols as $col )
                        <th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
                    @endforeach
                    @if($show_actions)
                        <th>Actions</th>
                    @endif
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    @la_access("Users", "create")
    <div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add User</h4>
                </div>
                {!! Form::open(['action' => 'LA\UsersController@store', 'id' => 'user-add-form']) !!}
                <div class="modal-body">
                    <div class="box-body">
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
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    {!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
    @endla_access

@endsection

@push('styles')
    <link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/pagination/pagination.css') }}"/>
@endpush

@push('scripts')
    <script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
    <script src="{{ asset('la-assets/plugins/pagination/pagination.js') }}"></script>
    <script>
        $(function () {
            $("#example1").DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ url(config('laraadmin.adminRoute') . '/user_dt_ajax') }}",
                language: {
                    lengthMenu: "_MENU_",
                    search: "_INPUT_",
                    searchPlaceholder: "Search"
                },
                @if($show_actions)
                columnDefs: [{orderable: false, targets: [-1]}],
                @endif
            });
            $("#user-add-form").validate({});
        });
    </script>
@endpush
