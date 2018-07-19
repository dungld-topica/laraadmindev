@extends("la.layouts.app")

@section("contentheader_title")
    <a href="{{ url(config('laraadmin.adminRoute') . '/firebases') }}">Firebase</a> :
@endsection
@section("contentheader_description", $firebase->$view_col)
@section("section", "Firebases")
@section("section_url", url(config('laraadmin.adminRoute') . '/firebases'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Firebases Edit : ".$firebase->$view_col)

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
                    {!! Form::model($firebase, ['route' => [config('laraadmin.adminRoute') . '.firebases.update', $firebase->id ], 'method'=>'PUT', 'id' => 'firebase-edit-form']) !!}
                    @la_form($module)

                    {{--
                    @la_input($module, 'name')
                    --}}
                    <br>
                    <div class="form-group">
                        {!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!}
                        <button class="btn btn-default pull-right"><a
                                    href="{{ url(config('laraadmin.adminRoute') . '/firebases') }}">Cancel</a></button>
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
            $("#firebase-edit-form").validate({});
        });
    </script>
@endpush
