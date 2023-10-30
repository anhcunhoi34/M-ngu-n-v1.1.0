@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Custom Page')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Edit Custom Page')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item active"><a href="{{ route('admin.custom-page.index') }}">{{__('admin.Custom Page')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Edit Custom Page')}}</div>
            </div>
          </div>
          <div class="section-body">
            <a href="{{ route('admin.custom-page.index') }}" class="btn btn-primary"><i class="fas fa-list"></i> {{__('admin.Custom Page')}}</a>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                      <div class="card-body">
                        <h3 class="h3 mb-3 text-gray-800">{{__('admin.Language')}}</h3>
                        <hr>
                        <div class="lang_list_top">
                            <ul class="lang_list">
                                @foreach ($languages as $language)
                                <li><a href="{{ route('admin.custom-page.edit', ['custom_page' => $customPage->id, 'lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
  
                        <div class="alert alert-danger mt-2" role="alert">
                            @php
                                $current_language = App\Models\Language::where('lang_code', request()->get('lang_code'))->first();
                            @endphp
                            <p>{{__('admin.Your editing mode')}} : <b>{{ $current_language->lang_name }}</b></p> 
                        </div> 
                      </div>
                    </div>
                </div>
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                        <form action="{{ route('admin.custom-page.update',$customPage->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                            <div class="row">
                                <div class="form-group col-12">
                                    <label>{{__('admin.Page Name')}} <span class="text-danger">*</span></label>
                                    <input type="text" id="page_name" class="form-control"  name="page_name" value="{{ $custom_page_language->page_name }}">
                                </div>

                                <div class="form-group col-12">
                                    <label>{{__('admin.Description')}} <span class="text-danger">*</span></label>
                                    <textarea name="description" cols="30" rows="10" class="summernote">{!! clean($custom_page_language->description) !!}</textarea>
                                </div>
                                @if(session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label>{{__('admin.Status')}} <span class="text-danger">*</span></label>
                                    <select name="status" class="form-control">
                                        <option {{ $customPage->status == 1 ? 'selected' : '' }} value="1">{{__('admin.Active')}}</option>
                                        <option {{ $customPage->status == 0 ? 'selected' : '' }} value="0">{{__('admin.Inactive')}}</option>
                                    </select>
                                </div>
                                @endif

                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <button class="btn btn-primary">{{__('admin.Update')}}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>
          </div>
        </section>
      </div>
@endsection
