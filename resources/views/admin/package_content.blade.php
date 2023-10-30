@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Package content')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Package content')}}</h1>
          </div>

          <div class="section-body">
            <a href="{{ route('admin.product.index') }}" class="btn btn-primary"><i class="fas fa-list"></i> {{__('admin.Products')}}</a>
            <div class="row mt-4">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <h3 class="h3 mb-3 text-gray-800">{{__('admin.Language')}}</h3>
                      <hr>
                      <div class="lang_list_top">
                          <ul class="lang_list">
                              @foreach ($languages as $language)
                              <li><a href="{{ route('admin.package.content', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                        <form action="{{ route('admin.update.package.content') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">

                            <div class="row">
                                <div class="form-group col-12">
                                    <label>{{__('admin.Regular Content')}} <span class="text-danger">*</span></label>
                                    <textarea name="regular_content" id="" cols="30" rows="10" class="summernote">{{ $package_content_language->regular_content }}</textarea>
                                </div>

                                <div class="form-group col-12">
                                  <label>{{__('admin.Extend Content')}} <span class="text-danger">*</span></label>
                                  <textarea name="extend_content" id="" cols="30" rows="10" class="summernote">{{ $package_content_language->extend_content }}</textarea>
                                </div>
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
