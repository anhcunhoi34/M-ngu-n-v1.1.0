@extends($active_theme)
@section('title')
    <title>{{__('user.Create product')}}</title>
    <meta name="description" content="{{__('user.Create product')}}">
@endsection

@section('frontend-content')
    <!--=============================
        UPLOAD PRODUCT INFO START
    ==============================-->
    <section class="upload_product_info pt_190 pb_100 xs_pb_70">
        <div class="container wow fadeInUp" data-wow-duration="1s">
            <h3>{{__('user.Upload your Product')}} </h3>
            <form class="upload_product_form" action="{{ route('store-image-type-product') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-xl-12 col-md-12">
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
                                        <option value="{{ $category->id }}">{{ $category->catlangfrontend->name }}</option>
                                    @endforeach
                                </select>
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Product Name')}}*</legend>
                                <input type="text" id="name" name="name" value="{{ old('name') }}">
                                <input type="hidden" name="product_type" value="{{ $product_type }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Slug')}}*</legend>
                                <input type="text" id="slug" name="slug" value="{{ old('slug') }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Preview link')}}*</legend>
                                <input type="text" name="preview_link" value="{{ old('preview_link') }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Regular price')}}* ({{__('USD Price')}})</legend>
                                <input type="text" name="regular_price" value="{{ old('regular_price') }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <legend>{{__('user.Description')}}*</legend>
                            <textarea id="editor" name="description" rows="8">{{ old('description') }}</textarea>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.Tags')}}* {{__('user.Press the comma for new tag')}}</legend>
                                <input type="text" data-role="tagsinput" name="tags" value="{{ old('tags') }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.SEO title')}}*</legend>
                                <input type="text" name="seo_title" value="{{ old('seo_title') }}">
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input">
                            <fieldset>
                                <legend>{{__('user.SEO description')}}*</legend>
                                <textarea rows="4" name="seo_description">{{ old('seo_description') }}</textarea>
                            </fieldset>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="wsus__comment_single_input wsus__pro_input_check_area">
                            <div class="row">
                                <div class="col-12">
                                    <h4>{{__('user.Others feature')}}</h4>
                                </div>
                                <div class="col-12 mt_10">
                                    <input type="checkbox" name="high_resolution" id="high_resolution"> 
                                    <label for="high_resolution" class="mr-3" >{{__('user.High Resolution')}}</label>
                                </div>
                                <div class="col-12 mt_10">
                                    <input type="checkbox" name="cross_browser" id="cross_browser"> 
                                    <label for="cross_browser" class="mr-3" >{{__('user.Cross Browser')}}</label>
                                </div>
                                <div class="col-12 mt_10">
                                    <input type="checkbox" name="documentation" id="documentation"> 
                                    <label for="documentation" class="mr-3" >{{__('user.Documentation')}}</label>
                                </div>
                                <div class="col-12 mt_10">
                                    <input type="checkbox" name="layout" id="layout"> <label for="layout" class="mr-3" >{{__('user.Responsive')}}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="wsus__comment_single_input m-0">
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
