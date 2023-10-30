@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Section Content')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Section Content')}}</h1>

          </div>

          <div class="row">
            <div class="col-md-12">
              <div class="section-body">
                <div class="row mt-4">
                    <div class="col-12">
                      <div class="card">
                        <div class="card-body">
                          <h3 class="h3 mb-3 text-gray-800">{{__('admin.Language')}}</h3>
                        <hr>
                        <div class="lang_list_top">
                          <ul class="lang_list">
                            @foreach ($languages as $language)
                            <li><a href="{{ route('admin.section-content',['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
                            @endforeach
                          </ul>
                        </div>

                        <div class="alert alert-danger" role="alert">
                            @php
                                $current_language = App\Models\Language::where('lang_code', request()->get('lang_code'))->first();
                            @endphp
                            <p>{{__('admin.Your editing mode')}} : <b>{{ $current_language->lang_name }}</b></p> 
                        </div>
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              @foreach ($section_content_languages as $content)
                  <div class="section-body">
                    <div class="row mt-4">
                        <div class="col-12">
                          <div class="card">
                            <div class="card-body">
                                <h5 class="home_border">{{ $content->section_name }}</h5>
                                <hr>
                                <form action="{{ route('admin.update-section-content', $content->id) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                    <div class="row">
                                           @if (request()->get('lang_code') != 'en')
                                              <div class="form-group col-12">
                                                  <label>{{__('admin.Section Name')}} <span class="text-danger">*</span></label>
                                                  <input type="text" name="section_name" value="{{ $content->section_name }}" class="form-control">
                                              </div>
                                           @endif

                                            <div class="form-group col-12">
                                                <label>{{__('admin.Title')}} <span class="text-danger">*</span></label>
                                                <input type="text" name="title" value="{{ $content->title }}" class="form-control">
                                            </div>
                                            <div class="form-group col-12">
                                                <label>{{__('admin.Description')}} <span class="text-danger">*</span></label>
                                                <textarea name="description" id="" cols="30" rows="3" class="form-control text-area-3">{{ $content->description }}</textarea>
                                            </div>

                                            <div class="col-12">
                                                <button class="btn btn-primary">{{__('admin.Save')}}</button>
                                            </div>
                                    </div>

                                </form>
                            </div>
                          </div>
                        </div>
                    </div>
                  </div>
                @endforeach
            </div>
          </div>
        </section>
      </div>
@endsection
