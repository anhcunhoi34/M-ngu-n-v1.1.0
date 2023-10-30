@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Product Type')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Product Type')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Product Type')}}</div>
            </div>
          </div>

          <div class="section-body">
            <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <h3 class="h3 mb-3 text-gray-800">{{__('admin.Language')}}</h3>
                    <hr>
                    <div class="lang_list_top">
                        <ul class="lang_list">
                            @foreach ($languages as $language)
                            <li><a href="{{ route('admin.product-type.index', ['lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
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
                        <div class="row">
                            <div class="col-12">
                                <form action="{{ route('admin.product-type.update',$productItem->id) }}" method="POST" enctype="multipart/form-data">
                                    @method('PATCH')
                                    @csrf

                                    <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                                    <div class="row">
                                        @if (session()->get('admin_lang') == request()->get('lang_code'))
                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.Script Product Image')}}</label>
                                            <div>
                                                <img class="error_404"  src="{{ asset($productItem->script_image) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.New Image')}}</label>
                                            <input type="file" name="script_image" class="form-control-file">
                                        </div>
                                        @endif

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Script Product Title')}}</label>
                                                <input type="text" name="script_title" class="form-control" value="{{ $product_item_language->script_title }}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Script Product Description')}}</label>
                                                <textarea class="form-control" name="script_description" id="" cols="30" rows="10">{{ $product_item_language->script_description }}</textarea>
                                            </div>
                                        </div>

                                        @if (session()->get('admin_lang') == request()->get('lang_code'))
                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.Image Product')}}</label>
                                            <div>
                                                <img class="error_404"  src="{{ asset($productItem->image_image) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.New Image')}}</label>
                                            <input type="file" name="image_image" class="form-control-file">
                                        </div>
                                        @endif

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Image Product Title')}}</label>
                                                <input type="text" name="image_title" class="form-control" value="{{ $product_item_language->image_title }}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Image Product Description')}}</label>
                                                <textarea class="form-control" name="image_description" id="" cols="30" rows="10">{{ $product_item_language->image_description }}</textarea>
                                            </div>
                                        </div>

                                        @if (session()->get('admin_lang') == request()->get('lang_code'))
                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.Video Product Image')}}</label>
                                            <div>
                                                <img class="error_404"  src="{{ asset($productItem->video_image) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.New Image')}}</label>
                                            <input type="file" name="video_image" class="form-control-file">
                                        </div>
                                        @endif

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Video Product Title')}}</label>
                                                <input type="text" name="video_title" class="form-control" value="{{ $product_item_language->video_title }}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Video Product Description')}}</label>
                                                <textarea class="form-control" name="video_description" id="" cols="30" rows="10">{{ $product_item_language->video_description }}</textarea>
                                            </div>
                                        </div>

                                        @if (session()->get('admin_lang') == request()->get('lang_code'))
                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.Audio Product Image')}}</label>
                                            <div>
                                                <img class="error_404"  src="{{ asset($productItem->audio_image) }}" alt="">
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label for="">{{__('admin.New Image')}}</label>
                                            <input type="file" name="audio_image" class="form-control-file">
                                        </div>
                                        @endif

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Audio Product Title')}}</label>
                                                <input type="text" name="audio_title" class="form-control" value="{{ $product_item_language->audio_title }}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="">{{__('admin.Audio Product Description')}}</label>
                                                <textarea class="form-control" name="audio_description" id="" cols="30" rows="10">{{ $product_item_language->audio_description }}</textarea>
                                            </div>
                                        </div>

                                    </div>
                                    <button type="submit" class="btn btn-primary">{{__('admin.Update')}}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
          </div>
        </section>
      </div>
@endsection
