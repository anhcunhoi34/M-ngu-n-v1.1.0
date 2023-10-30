@extends($active_theme)

@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}">
    <meta name="description" content="{{ $seo_setting->seo_description }}">
@endsection

@section('frontend-content')
    <!--=============================
        BREADCRUMB START
    ==============================-->
    <section class="wsus__breadcrumb" style="background: url({{ asset('frontend/images/breadcrumb_bg.jpg') }});">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="wsus__breadcrumb_text">
                        <h1>{{__('user.Blog')}}</h1>
                        <ul class="d-flex flex-wrap">
                            <li><a href="{{ route('home') }}">{{__('user.Home')}}</a></li>
                            <li><a href="javascript:;">{{__('user.Blog')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BREADCRUMB END
    ==============================-->

    @if ($blog_left_right == 1)
    <!--=============================
        BLOG LEFTBAR START
    ==============================-->
    <section class="wsus__blog_leftbar mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4">
                    <div class="wsus__sidebar">
                        <div class="wsus__sidebar_item wsus__sidebar_search mt-0">
                            <h3>{{__('user.Search')}}</h3>
                            <form id="search_form">
                                <input type="text" name="keyword" id="keyword" value="{{ request()->get('keyword') }}" placeholder="{{__('user.Search')}}">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_blog">
                            <h3>{{__('user.Popular Post')}}</h3>
                            <ul>
                                @foreach ($popular_blogs as $blog)
                                <li>
                                    <div class="img">
                                        <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                                    </div>
                                    <div class="text">
                                        <a href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                                        <p><i class="fas fa-calendar-alt"></i> {{ Carbon\Carbon::parse($blog->created_at)->format('d-m-Y') }}</p>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_categories">
                            <h3>{{__('user.Categories')}}</h3>
                            <ul>
                                @foreach ($categories as $category)
                                @php
                                    $total_blog = App\Models\Blog::where(['blog_category_id' => $category->id, 'status' => 1])->count();
                                @endphp
                                <li><a href="javascript:;" onclick="getCatSlug('{{ $category->slug }}')">{{ $category->blogcategorylanguagefrontend->category_name }} <span>({{ $total_blog }})</span></a></li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_tags">
                            <h3>{{__('user.Popular Tags')}}</h3>
                            <ul class="d-flex flex-wrap">
                                @foreach ($popular_tags as $popular_tag)
                                <li><a href="javascript:;" onclick="getCatTag('{{strtolower($popular_tag->tag_name)}}')">{{ $popular_tag->tag_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>

                        <div class="wsus__sidebar_item wsus__sidebar_subscribe"
                            style="background: url({{ asset($subscriber->image) }});">
                            <div class="wsus__sidebar_subscribe_overlay">
                                <h3>{{ $subscriber->title }}</h3>
                                <p>{!! clean($subscriber->description) !!}</p>
                                <form id="subscriberForm">
                                    @csrf
                                    <input type="text" name="email" placeholder="{{__('user.Enter Your Email Address')}}">
                                    <button class="common_btn" id="subSubmitBtn" type="submit">{{__('user.Subscribe')}}</button>
                                    <button class="common_btn d-none" id="subShowSpain" type="submit"><i class="fas fa-spinner fa-spin"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-8">
                    <div class="row">
                        @forelse ($blogs as $blog)
                        <div class="col-xl-6 col-md-6">
                            <div class="wsus__blog_3">
                                <div class="wsus__blog_3_img">
                                    <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                                </div>
                                <div class="wsus__blog_3_text">
                                    <a class="categori" href="javascript:;">{{ \Carbon\Carbon::parse($blog->created_at)->format('d M') }}</a>
                                    <a class="title" href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                                    <p class="description">{{ $blog->bloglanguagefrontend->short_description }}</p>
                                    <ul>
                                        <li><a href="{{ route('blog', $blog->slug) }}">{{__('user.Read More')}}</a></li>
                                        <li>
                                            <div class="img">
                                                <img src="{{ asset($blog->admin->image) }}" alt="author"
                                                    class="img-fluid w-100">
                                            </div>
                                            <p><span>{{__('user.By')}}</span> {{ $blog->admin->name }} </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        @empty
                        <div class="col-12 text-center mt-5">
                            <h2 class="text-danger">{{__('user.Blog Not Found')}}</h2>
                       </div>
                        @endforelse
                    </div>
                    <div class="wsus__pagination mt_25">
                        <div class="row">
                            {{ $blogs->links('custom_pagination') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BLOG LEFTBAR END
    ==============================-->
    @endif
    
    @if ($blog_left_right == 0)
    <!--=============================
        BLOG START
    ==============================-->
    <section class="wsus__blog mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                @forelse ($blogs as $blog)
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__blog_3">
                        <div class="wsus__blog_3_img">
                            <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                        </div>
                        <div class="wsus__blog_3_text">
                            <a class="categori" href="javascript:;">{{ \Carbon\Carbon::parse($blog->created_at)->format('d M') }}</a>
                            <a class="title" href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                            <p class="description">{{ $blog->bloglanguagefrontend->short_description }}</p>
                            <ul>
                                <li><a href="{{ route('blog', $blog->slug) }}">{{__('user.Read More')}}</a></li>
                                <li>
                                    <div class="img">
                                        <img src="{{ asset($blog->admin->image) }}" alt="author" class="img-fluid w-100">
                                    </div>
                                    <p><span>{{__('user.By')}}</span> {{ $blog->admin->name }} </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                @empty
                    <div class="col-12 text-center">
                        <h2 class="text-danger">{{__('user.Blog Not Found')}}</h2>
                    </div>
                @endforelse
            </div>
            <div class="wsus__pagination blog_list mt_25">
                <div class="row">
                    {{ $blogs->links('custom_pagination') }}
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BLOG END
    ==============================-->
    @endif

    @if ($blog_left_right == 2)
    <!--=============================
        BLOG RIGHTBAR START
    ==============================-->
    <section class="wsus__blog_rightbar mt_120 xs_mt_80 pb_120 xs_pb_80">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="row">
                        @forelse ($blogs as $blog)
                        <div class="col-xl-6 col-md-6">
                            <div class="wsus__blog_3">
                                <div class="wsus__blog_3_img">
                                    <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                                </div>
                                <div class="wsus__blog_3_text">
                                    <a class="categori" href="javascript:;">{{ \Carbon\Carbon::parse($blog->created_at)->format('d M') }}</a>
                                    <a class="title" href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                                    <p class="description">{{ $blog->bloglanguagefrontend->short_description }}</p>
                                    <ul>
                                        <li><a href="{{ route('blog', $blog->slug) }}">{{__('user.Read More')}}</a></li>
                                        <li>
                                            <div class="img">
                                                <img src="{{ asset($blog->admin->image) }}" alt="author"
                                                    class="img-fluid w-100">
                                            </div>
                                            <p><span>{{__('user.By')}}</span> {{ $blog->admin->name }} </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        @empty
                        <div class="col-12 text-center mt-5">
                            <h2 class="text-danger">{{__('user.Blog Not Found')}}</h2>
                       </div>
                        @endforelse
                    </div>
                    <div class="wsus__pagination mt_25">
                        <div class="row">
                            {{ $blogs->links('custom_pagination') }}
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4">
                    <div class="wsus__sidebar">
                        <div class="wsus__sidebar_item wsus__sidebar_search mt-0">
                            <h3>{{__('user.Search')}}</h3>
                            <form id="search_form">
                                <input type="text" name="keyword" id="keyword" value="{{ request()->get('keyword') }}" placeholder="{{__('user.Search')}}">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_blog">
                            <h3>{{__('user.Popular Post')}}</h3>
                            <ul>
                                @foreach ($popular_blogs as $blog)
                                <li>
                                    <div class="img">
                                        <img src="{{ asset($blog->image) }}" alt="blog" class="img-fluid w-100">
                                    </div>
                                    <div class="text">
                                        <a href="{{ route('blog', $blog->slug) }}">{{ $blog->bloglanguagefrontend->title }}</a>
                                        <p><i class="fas fa-calendar-alt"></i> {{ Carbon\Carbon::parse($blog->created_at)->format('d-m-Y') }}</p>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_categories">
                            <h3>{{__('user.Categories')}}</h3>
                            <ul>
                                @foreach ($categories as $category)
                                @php
                                    $total_blog = App\Models\Blog::where(['blog_category_id' => $category->id, 'status' => 1])->count();
                                @endphp
                                <li><a href="javascript:;" onclick="getCatSlug('{{ $category->slug }}')">{{ $category->blogcategorylanguagefrontend->category_name }} <span>({{ $total_blog }})</span></a></li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="wsus__sidebar_item wsus__sidebar_tags">
                            <h3>{{__('user.Popular Tags')}}</h3>
                            <ul class="d-flex flex-wrap">
                                @foreach ($popular_tags as $popular_tag)
                                <li><a href="javascript:;" onclick="getCatTag('{{strtolower($popular_tag->tag_name)}}')">{{ $popular_tag->tag_name }}</a></li>
                                @endforeach
                            </ul>
                        </div>

                        <div class="wsus__sidebar_item wsus__sidebar_subscribe"
                            style="background: url({{ asset($subscriber->image) }});">
                            <div class="wsus__sidebar_subscribe_overlay">
                                <h3>{{ $subscriber->title }}</h3>
                                <p>{!! clean($subscriber->description) !!}</p>
                                <form id="subscriberForm">
                                    @csrf
                                    <input type="text" name="email" placeholder="{{__('user.Enter Your Email Address')}}">
                                    <button class="common_btn" id="subSubmitBtn" type="submit">{{__('user.Subscribe')}}</button>
                                    <button class="common_btn d-none" id="subShowSpain" type="submit"><i class="fas fa-spinner fa-spin"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        BLOG RIGHTBAR END
    ==============================-->
    @endif


    <form action="{{ route('blogs') }}" id="blogSearchForm">

        @if (request()->has('keyword'))
        <input type="hidden" name="keyword" value="{{ request()->get('keyword') }}" id="keyword_form">
        @else
        <input type="hidden" name="keyword" value="" id="keyword_form">
        @endif

        @if (request()->has('category'))
            <input type="hidden" name="category" value="{{ request()->get('category') }}" id="category_form">
        @else
            <input type="hidden" name="category" value="" id="category_form">
        @endif
    
    </form>

@endsection
@push('frontend_js')
<script>
    (function($) {
        "use strict";
        $(document).ready(function () {
            $("#blogCommentForm").on('submit', function(e){
                e.preventDefault();
                $('#showspin').removeClass('d-none');
                $('#submitBtn').addClass('d-none');
                submitBtn
                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }
                $.ajax({
                    type: 'POST',
                    data: $('#blogCommentForm').serialize(),
                    url: "{{ route('blog-comment') }}",
                    success: function (response) {
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#blogCommentForm").trigger("reset");
                            $('#showspin').addClass('d-none');
                            $('#submitBtn').removeClass('d-none');
                        }
                    },
                    error: function(response) {
                        $('#showspin').addClass('d-none');
                        $('#submitBtn').removeClass('d-none');
                        if(response.responseJSON.errors.name)toastr.error(response.responseJSON.errors.name[0])
                        if(response.responseJSON.errors.email)toastr.error(response.responseJSON.errors.email[0])
                        if(response.responseJSON.errors.comment)toastr.error(response.responseJSON.errors.comment[0])

                        if(!response.responseJSON.errors.name && !response.responseJSON.errors.email && !response.responseJSON.errors.comment){
                            toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                        }
                    }
                });
            });


            $("#subscriberForm").on('submit', function(e){
                e.preventDefault();
                $('#subShowSpain').removeClass('d-none');
                $('#subSubmitBtn').addClass('d-none');
                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }

                let loading = "{{__('user.Processing...')}}"

                $("#subscribe_btn").html(loading);
                $("#subscribe_btn").attr('disabled',true);

                $.ajax({
                    type: 'POST',
                    data: $('#subscriberForm').serialize(),
                    url: "{{ route('subscribe-request') }}",
                    success: function (response) {
                        if(response.status == 1){
                            toastr.success(response.message);
                            let subscribe = "{{__('user.Subscribe')}}"
                            $("#subscribe_btn").html(subscribe);
                            $("#subscribe_btn").attr('disabled',false);
                            $("#subscriberForm").trigger("reset");
                            $('#subShowSpain').addClass('d-none');
                            $('#subSubmitBtn').removeClass('d-none');
                        }

                        if(response.status == 0){
                            toastr.error(response.message);
                            let subscribe = "{{__('user.Subscribe')}}"
                            $("#subscribe_btn").html(subscribe);
                            $("#subscribe_btn").attr('disabled',false);
                            $("#subscriberForm").trigger("reset");
                            $('#subShowSpain').addClass('d-none');
                            $('#subSubmitBtn').removeClass('d-none');
                        }
                    },
                    error: function(err) {
                        $('#subShowSpain').addClass('d-none');
                        $('#subSubmitBtn').removeClass('d-none');
                        toastr.error('Something went wrong');
                        let subscribe = "{{__('user.Subscribe')}}"
                            $("#subscribe_btn").html(subscribe);
                            $("#subscribe_btn").attr('disabled',false);
                            $("#subscriberForm").trigger("reset");
                    }
                });
            });

            $("#search_form").on("submit", function(e){
                e.preventDefault();
                $("#keyword_form").val($("#keyword").val());
                $("#blogSearchForm").submit();
            });

        });
    })(jQuery);

    function getCatSlug(slug){
        $("#category_form").val(slug);
        $("#blogSearchForm").submit();
    }

    function getCatTag(tag){
        $("#keyword_form").val(tag);
        $("#blogSearchForm").submit();
    }

</script>
@endpush
