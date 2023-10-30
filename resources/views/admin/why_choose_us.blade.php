@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Why choose us')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Why choose us')}}</h1>
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
                                <li><a href="{{ route('admin.why-choose-us', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                        <form action="{{ route('admin.why-choose-us-update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                            <div class="row">
                                <div class="form-group col-12">
                                    <label> <span class="font-weight-bold">{{__('admin.Title one')}}</span> <span class="text-danger">*</span></label>
                                    <input type="text" name="title1" value="{{ $why_choose_us->title1 }}" class="form-control">
                                </div>

                                <div class="form-group col-12">
                                    <label> <span class="font-weight-bold">{{__('admin.Title two')}}</span> <span class="text-danger">*</span></label>
                                    <input type="text" name="title2" value="{{ $why_choose_us->title2 }}" class="form-control">
                                </div>
                            </div>

                            @php
                                $home2= false;
                                if($setting->selected_theme == 0 || $setting->selected_theme == 2){
                                    $home2 = true;
                                }
                            @endphp


                            @if ($home2)
                            <div class="row">

                                <div class="col-12">
                                    <h6 class="home_border">{{__('admin.Home Two')}}</h6>
                                    <hr>
                                </div>
                                @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label>{{__('admin.Existing Background')}}</label>
                                    <div>
                                        <img class="w_300_h_150" src="{{ asset($why_choose_us->home2_background) }}" alt="">
                                    </div>
                                </div>

                                <div class="form-group col-12">
                                    <label>{{__('admin.New Background')}}</label>
                                    <input type="file" name="home2_background" class="form-control-file">
                                </div>
                                @endif
                            </div>


                            <div class="row">
                                <div class="col-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group col-12">
                                        <label>{{__('admin.Item one icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->item1_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group col-12">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="item1_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item one title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="item1_title" value="{{ $why_choose_us->item1_title }}" class="form-control">
                                    </div>
                                    
                                </div>

                                <div class="col-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label>{{__('admin.Item two icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->item2_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="item2_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item two title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="item2_title" value="{{ $why_choose_us->item2_title }}" class="form-control">
                                    </div>
                                    
                                </div>

                                <div class="com-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label>{{__('admin.Item three icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->item3_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="item3_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item three title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="item3_title" value="{{ $why_choose_us->item3_title }}" class="form-control">
                                    </div>
                                    
                                </div>
                            </div>
                            @endif

                            @php
                                $home3= false;
                                if($setting->selected_theme == 0 || $setting->selected_theme == 3){
                                    $home3 = true;
                                }
                            @endphp
                            @if ($home3)
                            <div class="row">
                                <div class="col-12">
                                    @if ($home3)
                                    <h6 class="home_border">{{__('admin.Home Three')}} & {{__('admin.About Us')}}</h6>
                                    <hr>
                                    @else
                                    <h6 class="home_border">{{__('admin.About Us')}}</h6>
                                    <hr>
                                    @endif
                                </div>
                            </div>
                            @endif

                            <div class="row">
                                <div class="col-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label>{{__('admin.Item one icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->home3_item1_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="home3_item1_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item one title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="home3_item1_title" value="{{ $why_choose_us->home3_item1_title }}" class="form-control">
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.Item one description')}} <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name="home3_item1_desc" id="" cols="30" rows="10">{{ $why_choose_us->home3_item1_desc }}</textarea>
                                    </div>
                                </div>
                                <div class="col-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label>{{__('admin.Item two icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->home3_item2_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="home3_item2_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item two title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="home3_item2_title" value="{{ $why_choose_us->home3_item2_title }}" class="form-control">
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.Item two description')}} <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name="home3_item2_desc" id="" cols="30" rows="10">{{ $why_choose_us->home3_item2_desc }}</textarea>
                                    </div>
                                </div>
                                <div class="col-4">
                                    @if (session()->get('admin_lang') == request()->get('lang_code'))
                                    <div class="form-group">
                                        <label>{{__('admin.Item three icon')}}</label>
                                        <div>
                                            <img class="icon_w100" src="{{ asset($why_choose_us->home3_item3_icon) }}" alt="">
                                        </div>
                                    </div>
    
                                    <div class="form-group">
                                        <label>{{__('admin.New icon')}}</label>
                                        <input type="file" name="home3_item3_icon" class="form-control-file">
                                    </div>
                                    @endif
                                    <div class="form-group">
                                        <label>{{__('admin.Item three title')}} <span class="text-danger">*</span></label>
                                        <input type="text" name="home3_item3_title" value="{{ $why_choose_us->home3_item3_title }}" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>{{__('admin.Item three description')}} <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name="home3_item3_desc" id="" cols="30" rows="10">{{ $why_choose_us->home3_item3_desc }}</textarea>
                                    </div>
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
