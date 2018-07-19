<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Firebase;

class FirebasesController extends Controller
{
    public $show_action = true;
    public $view_col = 'name';
    public $listing_cols = ['id', 'name'];

    public function __construct()
    {
        // Field Access of Listing Columns
        if (\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
            $this->middleware(function ($request, $next) {
                $this->listing_cols = ModuleFields::listingColumnAccessScan('Firebases', $this->listing_cols);
                return $next($request);
            });
        } else {
            $this->listing_cols = ModuleFields::listingColumnAccessScan('Firebases', $this->listing_cols);
        }
    }

    /**
     * Display a listing of the Firebases.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $module = Module::get('Firebases');

        if (Module::hasAccess($module->id)) {
            return View('la.firebases.index', [
                'show_actions' => $this->show_action,
                'listing_cols' => $this->listing_cols,
                'module' => $module
            ]);
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Show the form for creating a new firebase.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created firebase in database.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (Module::hasAccess("Firebases", "create")) {

            $rules = Module::validateRules("Firebases", $request);

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }

            $insert_id = Module::insert("Firebases", $request);

            return redirect()->route(config('laraadmin.adminRoute') . '.firebases.index');

        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Display the specified firebase.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (Module::hasAccess("Firebases", "view")) {

            $firebase = Firebase::find($id);
            if (isset($firebase->id)) {
                $module = Module::get('Firebases');
                $module->row = $firebase;

                return view('la.firebases.show', [
                    'module' => $module,
                    'view_col' => $this->view_col,
                    'no_header' => true,
                    'no_padding' => "no-padding"
                ])->with('firebase', $firebase);
            } else {
                return view('errors.404', [
                    'record_id' => $id,
                    'record_name' => ucfirst("firebase"),
                ]);
            }
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Show the form for editing the specified firebase.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $fb = \Firebase\Firebase::initialize(env('YOUR_FIREBASE_URL') . '', env('YOUR_FIREBASE_SECRET'));
        //    $nodeDeleteContent = $fb->get('/b');
//            print_r($nodeDeleteContent);die();
        //  $nodeSetContent = $fb->set('/', array('0' => '4','1'=>'a','2'=>'b'));
        // $nodeUpdateContent = $fb->update('/a', array('0' => 'aa'));
        // $nodePushContent = $fb->push('/a', array('5' => '5'));

        $requests = $fb->batch(function ($fb) {
            /** @var Firebase $fb */
            for ($i = 0; $i < 100; $i++) {
                $fb->push('a', array($i => $i + 1));
            }
        });
//pooling the requests and executing async
        $pool = new \GuzzleHttp\Pool($fb->getClient(), $requests);
        $pool->wait();


        if (Module::hasAccess("Firebases", "edit")) {
            $firebase = Firebase::find($id);
            if (isset($firebase->id)) {
                $module = Module::get('Firebases');

                $module->row = $firebase;

                return view('la.firebases.edit', [
                    'module' => $module,
                    'view_col' => $this->view_col,
                ])->with('firebase', $firebase);
            } else {
                return view('errors.404', [
                    'record_id' => $id,
                    'record_name' => ucfirst("firebase"),
                ]);
            }
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Update the specified firebase in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (Module::hasAccess("Firebases", "edit")) {

            $rules = Module::validateRules("Firebases", $request, true);

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();;
            }

            $insert_id = Module::updateRow("Firebases", $request, $id);

            return redirect()->route(config('laraadmin.adminRoute') . '.firebases.index');

        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Remove the specified firebase from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (Module::hasAccess("Firebases", "delete")) {
            Firebase::find($id)->delete();

            // Redirecting to index() method
            return redirect()->route(config('laraadmin.adminRoute') . '.firebases.index');
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Datatable Ajax fetch
     *
     * @return
     */
    public function dtajax()
    {
        $values = DB::table('firebases')->select($this->listing_cols)->whereNull('deleted_at');
        $out = Datatables::of($values)->make();
        $data = $out->getData();

        $fields_popup = ModuleFields::getModuleFields('Firebases');

        for ($i = 0; $i < count($data->data); $i++) {
            for ($j = 0; $j < count($this->listing_cols); $j++) {
                $col = $this->listing_cols[$j];
                if ($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
                    $data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
                }
                if ($col == $this->view_col) {
                    $data->data[$i][$j] = '<a href="' . url(config('laraadmin.adminRoute') . '/firebases/' . $data->data[$i][0]) . '">' . $data->data[$i][$j] . '</a>';
                }
                // else if($col == "author") {
                //    $data->data[$i][$j];
                // }
            }

            if ($this->show_action) {
                $output = '';
                if (Module::hasAccess("Firebases", "edit")) {
                    $output .= '<a href="' . url(config('laraadmin.adminRoute') . '/firebases/' . $data->data[$i][0] . '/edit') . '" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
                }

                if (Module::hasAccess("Firebases", "delete")) {
                    $output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.firebases.destroy', $data->data[$i][0]], 'method' => 'delete', 'style' => 'display:inline']);
                    $output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
                    $output .= Form::close();
                }
                $data->data[$i][] = (string)$output;
            }
        }
        $out->setData($data);
        return $out;
    }
}
