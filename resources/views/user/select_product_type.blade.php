@extends($active_theme)

@section('title')
    <title>{{__('user.Select product type')}}</title>
    <meta name="description" content="{{__('user.Select product type')}}">
@endsection

@section('frontend-content')
    <!--=============================
        UPLOAD PRODUCT START
    ==============================-->
    <section class="upload_product pt_210 xs_pt_180 pb_90 xs_pb_60">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-5 col-lg-6 wow fadeInLeft" data-wow-duration="1s">
                    <form class="upload_product_text" action="{{ route('product-create') }}" method="GET">
                        <h3>{{__('user.Prodcut Upload')}}</h3>
                        <h6>{{__('user.Select product type')}}</h6>
                        <select class="select_js" name="product_type">
                            <option value="script">{{__('user.Script')}}</option>
                            <option value="image">{{__('user.Image')}}</option>
                            <option value="video">{{__('user.Video')}}</option>
                            <option value="audio">{{__('user.Audio')}}</option>
                        </select>
                        <h5>{{ $productType->pagelangfrontend->title }}</h5>
                        <p>{{ $productType->pagelangfrontend->description }}</p>
                        <ul class="d-flex flex-wrap align-items-center">
                            <li><a class="cancel" href="{{ url()->previous() }}">{{__('user.cancel')}}</a></li>
                            <li><button class="common_btn" type="submit">{{__('user.Next')}}</button></li>
                        </ul>
                    </form>
                </div>
                <div class="col-xl-5 col-lg-6 wow fadeInRight" data-wow-duration="1s">
                    <div class="upload_product_img">
                        <img src="{{ asset($productType->image) }}" alt="upload" class="img-fluid w-100">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        UPLOAD PRODUCT END
    ==============================-->
@endsection
