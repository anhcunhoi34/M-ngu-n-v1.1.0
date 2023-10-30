@extends($active_theme)

@section('title')
    <title>{{__('user.Change password')}}</title>
    <meta name="description" content="{{__('user.Change password')}}">
@endsection

@section('frontend-content')
    <!--=============================
        AUTHOR EDIT PROFILE START
    ==============================-->
    <div class="wsus__author_edit_profile mt_180 pb_120 xs_pb_80">
        <div class="container">
            <div class="wsus__author_edit_profile_bg">
                <h2 class="edit_heading">{{__('user.Change password')}}</h2>
                <form action="{{ route('update-password') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="wsus__author_edit_form">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="wsus__comment_single_input">
                                            <fieldset>
                                                <legend>{{__('user.Current password')}}*</legend>
                                                <input type="password" name="current_password" placeholder="{{__('user.Current password')}}">
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="wsus__comment_single_input">
                                            <fieldset>
                                                <legend>{{__('user.Password')}}*</legend>
                                                <input type="password" name="password" placeholder="{{__('user.Password')}}">
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="wsus__comment_single_input">
                                            <fieldset>
                                                <legend>{{__('user.Confirm Password')}}*</legend>
                                                <input type="password" name="c_password" placeholder="{{__('user.Confirm Password')}}">
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <ul class="button_area d-flex flex-wrap align-items-center">
                                            <li><a href="{{ url()->previous() }}" class="cancel">{{__('user.cancel')}}</a></li>
                                            <li><button type="submit" class="common_btn">{{__('user.Save and change')}} </button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--=============================
        AUTHOR EDIT PROFILE END
    ==============================-->
@endsection
