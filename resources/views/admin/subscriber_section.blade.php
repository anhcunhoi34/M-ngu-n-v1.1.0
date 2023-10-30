@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Subscription Box')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Subscription Box')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Subscription Box')}}</div>
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
                                    <li><a href="{{ route('admin.subscriber-section', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                                <form action="{{ route('admin.update-subscriber-section') }}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')

                                    <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">

                                    @if (session()->get('admin_lang') == request()->get('lang_code'))

                                    @if ($selected_theme == 0 || $selected_theme == 1)
                                    <div class="form-group">
                                        <label for="">{{__('admin.Home One Background Image')}}</label>
                                        <div>
                                            <img class="w_200" src="{{ asset($subscriber->background_image) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New Background')}}</label>
                                        <input type="file" name="background_image" class="form-control-file">
                                    </div>
                                    @endif

                                    @if ($selected_theme == 0 || $selected_theme == 2)
                                    <div class="form-group">
                                        <label for="">{{__('admin.Home Two Background Image')}}</label>
                                        <div>
                                            <img class="w_200" src="{{ asset($subscriber->home2_background_image) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New Background')}}</label>
                                        <input type="file" name="home2_background_image" class="form-control-file">
                                    </div>
                                    @endif


                                    @if ($selected_theme == 0 || $selected_theme == 3)

                                    <div class="form-group">
                                        <label for="">{{__('admin.Home Three Background Image')}}</label>
                                        <div>
                                            <img class="w_200" src="{{ asset($subscriber->home3_background_image) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.New Background')}}</label>
                                        <input type="file" name="background_image3" class="form-control-file">
                                    </div>
                                    @endif

                                    <div class="form-group">
                                        <label for="">{{__('admin.Existing blog page Image')}}</label>
                                        <div>
                                            <img class="w_120" src="{{ asset($subscriber->blog_page_subscription_image) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.Blog page subscription box Image')}}</label>
                                        <input type="file" name="blog_page_subscription_image" class="form-control-file">
                                    </div>
                                    @endif

                                    <div class="form-group">
                                        <label for="">{{__('admin.Short Title')}}</label>
                                        <input type="text" name="title" class="form-control" value="{{ $subscriber->title }}">
                                    </div>

                                    <div class="form-group">
                                        <label for="">{{__('admin.Description')}}</label>
                                        <textarea name="description" class="form-control text-area-5" id="" cols="30" rows="10">{{ $subscriber->description }}</textarea>
                                    </div>

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
