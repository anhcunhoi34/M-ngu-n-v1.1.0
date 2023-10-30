@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Trending Offer')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Trending Offer')}}</h1>
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
                                <li><a href="{{ route('admin.trending-offer', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                        <form action="{{ route('admin.update-trending-offer') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                            @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="row">

                                    <div class="form-group col-12">
                                        <label for="">{{__('admin.Existing Background')}}</label>
                                        <div>
                                            <img class="w_300_h_150" src="{{ asset($trending_offer->image) }}" alt="">
                                        </div>
                                    </div>

                                    <div class="form-group col-12">
                                        <label for="">{{__('admin.New Background')}}</label>
                                        <input type="file" name="image" class="form-control-file">
                                    </div>
                                </div>
                            @endif

                            <div class="row">
                                <div class="form-group col-12">
                                    <label>{{__('admin.Title one')}} <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control"  name="title1" value="{{ $trending_offer->title1 }}">
                                </div>

                                <div class="form-group col-12">
                                    <label>{{__('admin.Title two')}} <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control"  name="title2" value="{{ $trending_offer->title2 }}">
                                </div>
                                @if (session()->get('admin_lang') == request()->get('lang_code'))
                                <div class="form-group col-12">
                                    <label>{{__('admin.Link')}} <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control"  name="link" value="{{ $trending_offer->link }}">
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
