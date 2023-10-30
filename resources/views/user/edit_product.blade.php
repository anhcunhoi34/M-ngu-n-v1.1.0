@extends($active_theme)

@section('title')
    <title>{{__('user.Edit product')}}</title>
    <meta name="description" content="{{__('user.Edit product')}}">
@endsection

@section('frontend-content')
    <!--=============================
        UPLOAD PRODUCT INFO START
    ==============================-->
    <section class="upload_product_info pt_190 pb_100 xs_pb_70">
        <div class="container wow fadeInUp" data-wow-duration="1s">
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="card">
                      <div class="card-body">
                        <h4 class="h3 mb-3 text-gray-800">{{__('user.Language')}}</h4>
                        <hr>
                        <div class="lang_list_top">
                            <ul class="lang_list">
                                @foreach ($languages as $language)
                                <li><a href="{{ route('product-edit',['id' => $product->id, 'lang_code' => $language->lang_code]) }}"><i class="fas fa-edit"></i> {{ $language->lang_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>

                        <div class="alert alert-danger" role="alert">
                            @php
                                $current_language = App\Models\Language::where('lang_code', request()->get('lang_code'))->first();
                            @endphp
                            <p>{{__('user.Your editing mode')}} : <b>{{ $current_language->lang_name }}</b></p> 
                        </div> 
                      </div>
                    </div>
                </div>
            </div>
            <h3>{{__('user.Upload your Product')}} </h3>
            <form class="upload_product_form" action="{{ route('product-update', $product->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="lang_code" value="{{ request()->get('lang_code') }}">
                <div class="row">
                    @if (Session::get('front_lang') == request()->get('lang_code'))
                    <div class="col-xl-6 col-md-6">
                        <div class="upload_form_input">
                            <label>{{__('user.Thumbnail Image')}}*</label>
                            <div class="upload_box">
                                <div class="img">
                                    <img src="{{ asset('frontend/images/upload_1.png') }}" alt="upload icon" class="img-fluid w-100">
                                </div>
                                <label for="upload_11">{{__('user.Please')}} <span>{{__('user.Choose File')}}</span> {{__('user.to upload')}} </label>
                                <input id="upload_11" name="thumb_image" type="file" hidden>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <div class="upload_form_input">
                            <label>{{__('user.Upload File')}}* <span> (<b>{{__('user.Only ZIP file allowed')}}</b>)</span></label>
                            <div class="upload_box">
                                <div class="img">
                                    <img src="{{ asset('frontend/images/upload_2.png') }}" alt="upload icon" class="img-fluid w-100">
                                </div>
                                <label for="upload_1">{{__('user.Please')}} <span>{{__('user.Choose File')}}</span> {{__('user.to upload')}} </label>
                                @if ($product->download_file)
                                    <label for=""><a class="text-danger text-bold" href="{{ route('download-existing-file', $product->download_file) }}">{{__('user.Download existing file')}}</a></label>
                                @endif
                                <input id="upload_1" name="upload_file" accept=".zip" type="file" hidden>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <label>{{__('user.Existing icon')}}</label>
                            <div class="product_icon">
                                <img src="{{ asset($product->product_icon) }}" width="20" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Product icon')}}*</legend>
                                <input type="file" name="product_icon">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Category')}}*</legend>
                                <select class="select2" name="category">
                                    <option value="">{{__('user.Select Category')}}</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}" {{ $product->category_id == $category->id ? 'selected':'' }}>{{ $category->catlangfrontend->name }}</option>
                                    @endforeach
                                </select>
                            </fieldset>
                        </div>
                    </div>
                    @endif
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Product Name')}}*</legend>
                                <input type="text" id="name" name="name" value="{{ html_decode($product_language->name) }}">
                                <input type="hidden" name="product_type" value="{{ $product_type }}">
                            </fieldset>
                        </div>
                    </div>
                    @if (session()->get('front_lang') == request()->get('lang_code'))
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Preview link')}}*</legend>
                                <input type="text" name="preview_link" value="{{ html_decode($product->preview_link) }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Regular price')}}* ({{__('USD Price')}})</legend>
                                <input type="text" name="regular_price" value="{{ html_decode($product->regular_price) }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Extend price')}}* ({{__('USD Price')}})</legend>
                                <input type="text" name="extend_price" value="{{ html_decode($product->extend_price) }}">
                            </fieldset>
                        </div>
                    </div>
                    @endif
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <legend>{{__('user.Description')}}*</legend>
                            <textarea id="editor" name="description" rows="8">{{ html_decode($product_language->description) }}</textarea>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Tags')}}*   {{__('user.Press the comma for new tag')}}</legend>
                                <input type="text" data-role="tagsinput" name="tags" value="{{ html_decode($product_language->tags) }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.SEO title')}}*</legend>
                                <input type="text" name="seo_title" value="{{ html_decode($product_language->seo_title) }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.SEO description')}}*</legend>
                                <textarea rows="4" name="seo_description">{{ html_decode($product_language->seo_description) }}</textarea>
                            </fieldset>
                        </div>
                    </div>

                    @if (session()->get('front_lang') == request()->get('lang_code'))
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <div class="row">
                                <div class="col-12">
                                    <h4>{{__('user.Others feature')}}</h4>
                                </div>
                                <div class="col-12">
                                    <input type="checkbox" name="high_resolution" id="high_resolution" {{ $product->high_resolution == 1 ? 'checked' : '' }}> 
                                    <label for="high_resolution" class="mr-3" >{{__('user.High Resolution')}}</label>
                                </div>
                                <div class="col-12">
                                    <input type="checkbox" name="cross_browser" id="cross_browser" {{ $product->cross_browser == 1 ? 'checked' : '' }}> 
                                    <label for="cross_browser" class="mr-3" >{{__('user.Cross Browser')}}</label>
                                </div>
                                <div class="col-12">
                                    <input type="checkbox" name="documentation" id="documentation" {{ $product->documentation == 1 ? 'checked' : '' }}> 
                                    <label for="documentation" class="mr-3">{{__('user.Documentation')}}</label>
                                </div>
                                <div class="col-12">
                                    <input type="checkbox" name="layout" id="layout" {{ $product->layout == 1 ? 'checked' : '' }}> <label for="layout" class="mr-3">{{__('user.Responsive')}}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endif
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <button class="common_btn upload" type="submit">{{__('user.upload Product')}}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!--=============================
        UPLOAD PRODUCT INFO END
    ==============================-->
@endsection
@push('frontend_js')
    
<script>
    (function($) {
        "use strict";
        var specification = true;
        $(document).ready(function () {
            $("#name").on("focusout",function(e){
                $("#slug").val(convertToSlug($(this).val()));
            })

            $("#download_file_type").on("change", function(){
                let currentVal = $(this).val();
                if(currentVal == 'direct_upload'){
                    $(".upload_file_box").removeClass('d-none')
                    $(".download_link_box").addClass('d-none')
                }else{
                    $(".upload_file_box").addClass('d-none')
                    $(".download_link_box").removeClass('d-none')
                }
            })
        });
    })(jQuery);

    function convertToSlug(Text){
            return Text
                .toLowerCase()
                .replace(/[^\w ]+/g,'')
                .replace(/ +/g,'-');
    }
</script>
@endpush
