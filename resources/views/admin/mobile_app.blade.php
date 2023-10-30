@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Mobile App')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Mobile App')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Mobile App')}}</div>
            </div>
          </div>

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
                                    <li><a href="{{ route('admin.mobile-app', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                                <form action="{{ route('admin.update-mobile-app') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')

                                    <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                                    @php

                                        $home1= false;
                                        if($setting->selected_theme == 0 || $setting->selected_theme == 1){
                                            $home1 = true;
                                        }

                                    @endphp

                                    @if ($home1)

                                    <h6 class="home_border">{{__('admin.Home One')}}</h6>
                                        <hr>
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label for="">{{__('admin.Foreground image')}}</label>
                                        <div>
                                            <img class="app_image" src="{{ asset($mobile_app->home1_foreground) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New foreground')}}</label>
                                        <input type="file" name="home1_foreground" class="form-control-file">
                                    </div>
                                    @endif

                                    @php
                                        $notify = trans('For colorfull title, write the title inside "<span>colorfull title here</span>" tag');
                                    @endphp

                                    <div class="form-group">
                                        <label for="">{{__('admin.Title')}} <span class="text-danger">*</span> <span class="text-danger">({{ $notify }}) </span> </label>
                                        <input type="text" name="title1" class="form-control" value="{{ $mobile_app->title1 }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.Description')}} <span class="text-danger">*</span></label>
                                        <textarea name="description" class="form-control text-area-5" id="" cols="30" rows="10">{{ $mobile_app->description }}</textarea>
                                    </div>

                                    @endif

                                    @php
                                        $home2 = false;
                                        if($setting->selected_theme == 0 || $setting->selected_theme == 2){
                                            $home2 = true;
                                        }
                                    @endphp

                                    @if ($home2)

                                    <h6 class="home_border">{{__('admin.Home Two')}}</h6>
                                    <hr>
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label for="">{{__('admin.Background image')}}</label>
                                        <div>
                                            <img class="w_300_h_150" src="{{ asset($mobile_app->home2_background) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New background')}}</label>
                                        <input type="file" name="home2_background" class="form-control-file">
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.Foreground image')}}</label>
                                        <div>
                                            <img class="app_image" src="{{ asset($mobile_app->home2_foreground) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New foreground')}}</label>
                                        <input type="file" name="home2_foreground" class="form-control-file">
                                    </div>
                                    @endif

                                    <div class="form-group">
                                        <label for="">{{__('admin.Title')}} <span class="text-danger">*</span> </label>
                                        <input type="text" name="home2_title" class="form-control" value="{{ $mobile_app->home2_title }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.Description')}} <span class="text-danger">*</span></label>
                                        <textarea name="home2_desc" class="form-control text-area-5" id="" cols="30" rows="10">{{ $mobile_app->home2_desc }}</textarea>
                                    </div>

                                    @endif

                                    @php
                                        $home3 = false;
                                        if($setting->selected_theme == 0 || $setting->selected_theme == 3){
                                            $home3 = true;
                                        }
                                    @endphp

                                    @if ($home3)

                                        <h6 class="home_border">{{__('admin.Home Three')}}</h6>
                                        <hr>
                                        @if (session()->get('admin_lang') == request()->get('lang_code'))
                                        <div class="form-group">
                                            <label for="">{{__('admin.Background image')}}</label>
                                            <div>
                                                <img class="app_image" src="{{ asset($mobile_app->home3_background) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('admin.New background')}}</label>
                                            <input type="file" name="home3_background" class="form-control-file">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('admin.Foreground image')}}</label>
                                            <div>
                                                <img class="app_image" src="{{ asset($mobile_app->home3_foreground) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('admin.New foreground')}}</label>
                                            <input type="file" name="home3_foreground" class="form-control-file">
                                        </div>
                                        @endif

                                        <div class="form-group">
                                            <label for="">{{__('admin.Title')}} <span class="text-danger">*</span> </label>
                                            <input type="text" name="home3_title" class="form-control" value="{{ $mobile_app->home3_title }}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('admin.Description')}} <span class="text-danger">*</span></label>
                                            <textarea name="home3_desc" class="form-control text-area-5" id="" cols="30" rows="10">{{ $mobile_app->home3_desc }}</textarea>
                                        </div>

                                    @endif
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label for="">{{__('admin.Google Play Store Link')}}</label>
                                        <input type="text" name="play_store" class="form-control" value="{{ $mobile_app->play_store }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.App Store Link')}}</label>
                                        <input type="text" name="app_store" class="form-control" value="{{ $mobile_app->app_store }}">
                                    </div>
                                    @endif

                                    <button type="submit" class="btn btn-primary">{{__('admin.Update')}}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
      </div>
@endsection
