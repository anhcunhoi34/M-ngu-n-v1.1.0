<?php

namespace App\Http\Controllers\Admin;

use File;
use Image;
use App\Models\Language;
use App\Models\CustomPage;
use Illuminate\Http\Request;
use App\Models\CustomPageLanguage;
use App\Http\Controllers\Controller;

class CustomPageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        $customPages = CustomPage::with('customlangadmin')->get();
        return view('admin.custom_page',compact('customPages'));
    }

    public function create()
    {
        return view('admin.create_custom_page');
    }


    public function store(Request $request)
    {
        $rules = [
            'description' => 'required',
            'page_name' => 'required|unique:custom_page_languages',
            'slug' => 'required|unique:custom_pages',
            'status' => 'required'
        ];
        $customMessages = [
            'page_name.required' => trans('admin_validation.Page name is required'),
            'page_name.unique' => trans('admin_validation.Page name already exists'),
            'slug.required' => trans('admin_validation.Slug is required'),
            'slug.unique' => trans('admin_validation.Slug already exist'),
            'description.required' => trans('admin_validation.Description is required'),
            'banner_image.required' => trans('admin_validation.Banner image is required'),
        ];
        $this->validate($request, $rules,$customMessages);

        $customPage = new CustomPage();
        $customPage->slug = $request->slug;
        $customPage->status = $request->status;
        $customPage->save();

        $languages = Language::get();
        foreach($languages as $language){
            $custom_page_language = new CustomPageLanguage();
            $custom_page_language->custom_id = $customPage->id;
            $custom_page_language->lang_code = $language->lang_code;
            $custom_page_language->page_name = $request->page_name;
            $custom_page_language->description = $request->description;
            $custom_page_language->save();
        }

        $notification = trans('admin_validation.Created Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.custom-page.index')->with($notification);
    }


    public function edit(Request $request, $id)
    {
        $customPage = CustomPage::find($id);
        $languages = Language::get();
        $custom_page_language = CustomPageLanguage::where(['custom_id' => $customPage->id, 'lang_code' => $request->lang_code])->first();
        
        return view('admin.edit_custom_page',compact('customPage', 'languages', 'custom_page_language'));
    }

    public function update(Request $request, $id)
    {
        $customPage = CustomPage::find($id);
        $custom_page_language = CustomPageLanguage::where(['custom_id' => $customPage->id, 'lang_code' => $request->lang_code])->first();
        
        $rules = [
            'description' => 'required',
            'page_name' => 'required|unique:custom_page_languages,page_name,'.$custom_page_language->id,
            'status' => session()->get('admin_lang') == $request->lang_code ? 'required':'',
        ];
        $customMessages = [
            'page_name.required' => trans('admin_validation.Page name is required'),
            'page_name.unique' => trans('admin_validation.Page name already exists'),
            'slug.required' => trans('admin_validation.Slug is required'),
            'slug.unique' => trans('admin_validation.Slug already exist'),
            'description.required' => trans('admin_validation.Description is required'),

        ];
        $this->validate($request, $rules,$customMessages);


        if(session()->get('admin_lang') == $request->lang_code){
            $customPage->status = $request->status;
            $customPage->save();
        }

        $custom_page_language->page_name = $request->page_name;
        $custom_page_language->description = $request->description;
        $custom_page_language->save();

        $notification = trans('admin_validation.Updated Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->back()->with($notification);
    }

    public function destroy($id)
    {
        $customPage = CustomPage::find($id);
        $customPage->delete();

        $custom_page_language = CustomPageLanguage::where('custom_id', $id)->delete();

        $notification = trans('admin_validation.Delete Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.custom-page.index')->with($notification);
    }


    public function changeStatus($id){
        $customPage = CustomPage::find($id);
        if($customPage->status == 1){
            $customPage->status = 0;
            $customPage->save();
            $message = trans('admin_validation.Inactive Successfully');
        }else{
            $customPage->status = 1;
            $customPage->save();
            $message = trans('admin_validation.Active Successfully');
        }
        return response()->json($message);
    }

}
