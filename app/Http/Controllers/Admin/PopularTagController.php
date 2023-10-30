<?php

namespace App\Http\Controllers\Admin;

use App\Models\PopularTag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PopularTagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $popularTags=PopularTag::latest()->get();
        return view('admin.popular_tag', compact('popularTags'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'tag_name'=>'required|unique:popular_tags',
        ];
        $customMessages = [
            'tag_name.required' => trans('admin_validation.Tag name is required'),
            'tag_name.unique' => trans('admin_validation.Tag name already exist'),
        ];
        $this->validate($request, $rules,$customMessages);

        $popularTag = new PopularTag();
        $popularTag->tag_name = $request->tag_name;
        $popularTag->save();


        $notification = trans('admin_validation.Added Successfully');
        $notification = array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.popular-tags.index')->with($notification);
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
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tag = PopularTag::find($id);
        $tag->delete();

        $notification= trans('admin_validation.Delete Successfully');
        $notification=array('messege'=>$notification,'alert-type'=>'success');
        return redirect()->route('admin.popular-tags.index')->with($notification);
    }
}
