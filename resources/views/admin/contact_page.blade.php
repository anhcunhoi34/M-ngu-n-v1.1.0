@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Conact Us')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Conact Us')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Conact Us')}}</div>
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
                            <li><a href="{{ route('admin.contact-us.index', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                        <form action="{{ route('admin.contact-us.update',$contact->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                            <div class="row">
                              @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label for="">{{__('admin.Existing image')}}</label>
                                    <div>
                                        <img class="w_220"  src="{{ asset($contact->image) }}" alt="">
                                    </div>
                                </div>

                                <div class="form-group col-12">
                                    <label for="">{{__('admin.New image')}}</label>
                                    <input type="file" name="image" class="form-control-file">
                                </div>
                                @endif

                                <div class="form-group col-12">
                                    <label>{{__('admin.Title')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="title1" class="form-control" value="{{ $contact_language->title1 }}">
                                </div>

                                <div class="form-group col-12">
                                  <label>{{__('admin.Support title')}} <span class="text-danger">*</span></label>
                                  <input type="text" name="title2" class="form-control" value="{{ $contact_language->title2 }}">
                                </div>

                                <div class="form-group col-12">
                                  <label>{{__('admin.Support time')}} <span class="text-danger">*</span></label>
                                  <input type="text" name="time" class="form-control" value="{{ $contact_language->time }}">
                                </div>

                                <div class="form-group col-12">
                                  <label>{{__('admin.Off Day')}} <span class="text-danger">*</span></label>
                                  <input type="text" name="off_day" class="form-control" value="{{ $contact_language->off_day }}">
                                </div>

                                @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label>{{__('admin.Email')}} <span class="text-danger">*</span></label>
                                    <textarea name="email" cols="30" rows="10" class="form-control text-area-5">{{ $contact->email }}</textarea>
                                </div>
                                @endif

                                <div class="form-group col-12">
                                  <label>{{__('admin.Address')}} <span class="text-danger">*</span></label>
                                  <textarea name="address" cols="30" rows="10" class="form-control text-area-5">{{ $contact_language->address }}</textarea>
                              </div>

                                <div class="form-group col-12">
                                    <label>{{__('admin.Phone')}} <span class="text-danger">*</span></label>
                                    <textarea name="phone" cols="30" rows="10" class="form-control text-area-5">{{ $contact_language->phone }}</textarea>
                                </div>

                                @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label>{{__('admin.Google Map')}} <span class="text-danger">*</span></label>
                                    <textarea name="google_map" cols="30" rows="10" class="form-control text-area-5">{{ $contact->map }}</textarea>
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
