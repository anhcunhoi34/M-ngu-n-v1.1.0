<?php

namespace App\Http\Controllers\Admin;

use Str;
use File;
use App\Models\Language;
use App\Models\Template;
use Illuminate\Http\Request;
use App\Models\TemplateLanguage;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class TemplateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $templates = Template::with('templatelangadmin')->latest()->get();
        return view('admin.template', compact('templates'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.create_template');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    
        $rules = [
            'title' => 'required',
            'description' => 'required',
            'image' => 'required',
            'link' => 'required',
        ];

        $customMessages = [
            'title.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
            'image.required' => trans('admin_validation.Image is required'),
            'link.required' => trans('admin_validation.Link is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $template = new Template();

        if($request->image){
            $extention = $request->image->getClientOriginalExtension();
            $image_name = 'template-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->image)
                ->save(public_path().'/'.$image_name);
        }

        
        $template->image = $image_name;
        $template->link = $request->link;
        $template->status = $request->status;
        $template->save();

        $languages = Language::get();
        foreach($languages as $language){
            $template_language = new TemplateLanguage();
            $template_language->template_id = $template->id;
            $template_language->lang_code = $language->lang_code;
            $template_language->title = $request->title;
            $template_language->description = $request->description;
            $template_language->save();
        }

        $notification = trans('admin_validation.Created Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.template.index')->with($notification);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        $template =  Template::findOrFail($id);
        $languages = Language::get();
        $template_language = TemplateLanguage::where(['template_id' => $template->id, 'lang_code' => $request->lang_code])->first();
        return view('admin.edit_template', compact('template', 'languages', 'template_language'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    
        $rules = [
            'title' => 'required',
            'description' => 'required',
            'link' => session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];

        $customMessages = [
            'title.required' => trans('admin_validation.Title is required'),
            'description.required' => trans('admin_validation.Description is required'),
            'link.required' => trans('admin_validation.Link is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $template = Template::findOrFail($id);
        $template_language = TemplateLanguage::where(['template_id' => $template->id, 'lang_code' => $request->lang_code])->first();

        if($request->image){
            $existing_image = $template->image;
            $extention = $request->image->getClientOriginalExtension();
            $image_name = 'template-'.date('-Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_name = 'uploads/custom-images/'.$image_name;
            Image::make($request->image)
                    ->save(public_path().'/'.$image_name);
                $template->image= $image_name;
                $template->save();
                if($existing_image){
                    if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
                }
        }

        
        if($request->link){
            $template->link = $request->link;
        }

        $template->save();


        $template_language->title = $request->title;
        $template_language->description = $request->description;

        $template_language->save();

        $notification = trans('admin_validation.Created Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $template = Template::find($id);
        $existing_image = $template->image;
        $template->delete();

        if($existing_image){
            if(File::exists(public_path().'/'.$existing_image))unlink(public_path().'/'.$existing_image);
        }

        $template_language = TemplateLanguage::where('template_id', $id)->delete();

        $notification = trans('admin_validation.Delete Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.template.index')->with($notification);
    }

    public function changeStatus($id){
        $template = Template::find($id);
        if($template->status == 1){
            $template->status = 0;
            $template->save();
            $message = trans('admin_validation.Inactive Successfully');
        }else{
            $template->status = 1;
            $template->save();
            $message = trans('admin_validation.Active Successfully');
        }

        return response()->json($message);
    }
}
