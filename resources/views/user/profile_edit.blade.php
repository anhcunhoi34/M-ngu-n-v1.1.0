@extends($active_theme)

@section('title')
    <title>{{__('user.Profile edit')}}</title>
    <meta name="description" content="{{__('user.Profile edit')}}">
@endsection

@section('frontend-content')
    <!--=============================
        AUTHOR EDIT PROFILE START
    ==============================-->
    <div class="wsus__author_edit_profile mt_180 pb_120 xs_pb_80">
        <div class="container">
            <div class="wsus__author_edit_profile_bg">
                <h2 class="edit_heading">{{__('user.Edit Your Profile')}}</h2>
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="wsus__author_edit_form">
                                <form action="{{ route('update-profile') }}" method="POST" enctype="multipart/form-data">
                                     @csrf
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Name')}}*</legend>
                                                    <input type="text" name="name" value="{{ html_decode($user->name) }}">
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Designation')}}*</legend>
                                                    <input type="text" name="designation" value="{{ html_decode($user->designation) }}">
                                                </fieldset>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Phone')}}*</legend>
                                                    <input type="text" name="phone" value="{{ html_decode($user->phone) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Country')}}</legend>
                                                    <input type="text" name="country" value="{{ html_decode($user->country) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.State')}}</legend>
                                                    <input type="text" name="state" value="{{ html_decode($user->state) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Town/City')}}</legend>
                                                    <input type="text" name="city" value="{{ html_decode($user->city) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Address')}}*</legend>
                                                    <input type="text" name="address" value="{{ html_decode($user->address) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Facebook')}}</legend>
                                                    <input type="text" name="facebook" value="{{ html_decode($user->facebook )}}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Pinterest')}}</legend>
                                                    <input type="text" name="pinterest" value="{{ html_decode($user->pinterest) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Linkedin')}}</legend>
                                                    <input type="text" name="linkedIn" value="{{ html_decode($user->linkedIn) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Dribbble')}}</legend>
                                                    <input type="text" name="dribbble" value="{{ html_decode($user->dribbble) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.Twitter')}}</legend>
                                                    <input type="text" name="twitter" value="{{ html_decode($user->twitter) }}">
                                                </fieldset>
                                            </div>
                                        </div>

                                        <div class="col-xl-12">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.About Me')}}*</legend>
                                                    <textarea rows="4" name="about_me" id="editor">{{ html_decode($user->about_me) }}</textarea>
                                                </fieldset>
                                            </div>
                                        </div>
                                        
                                        <div class="col-xl-12">
                                            <div class="wsus__comment_single_input">
                                                <fieldset>
                                                    <legend>{{__('user.My Skills')}}*</legend>
                                                    <textarea rows="4" name="my_skill" rows="7" id="editor">{{ html_decode($user->my_skill) }}</textarea>
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
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <form id="imageUploadForm" enctype="multipart/form-data">
                                @csrf
                                <div class="wsus__author_edit_photo">
                                    <div class="img">
                                        @if ($user->image!=null)
                                        <img src="{{ asset($user->image) }}" id="preview-img"  alt="upload" class="img-fluid w-100">
                                        @elseif($user->provider=='google')
                                        <img src="{{ asset($user->provider_avatar) }}" id="preview-img"  alt="upload" class="img-fluid w-100">
                                        @else
                                        <img src="{{ asset($setting->default_avatar) }}" id="preview-img"  alt="upload" class="img-fluid w-100">
                                        @endif
                                    </div>
                                    <input type="file" name="image" hidden id="user_image" onchange="userImageUpload()">
                                    <label for="user_image"><i class="fal fa-upload"></i> {{__('user.Upload a Image')}}</label>
                                    <h4>{{__('user.Upload Your Image')}}</h4>
                                    <p>{{__('user.Choose a image PNG, JPEG, JPG')}}</p>
                                    <p><span>{{__('user.Note')}}:</span> {{__('user.Max File Size 2MB')}}</p>
                                    <input type="submit" id="imageformsubmit" class="btn btn-primary d-none" value="submit">
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!--=============================
        AUTHOR EDIT PROFILE END
    ==============================-->
@endsection

@push('frontend_js')
<script>
    "use strict";
    function userImageUpload() {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('preview-img');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);

        var button = $("#imageformsubmit");
            button.click();
    };

    $(document).ready(function () {
        $('#imageUploadForm').on('submit', function (e) {
            e.preventDefault();
            $.ajax({
                url: "{{ route('update-user-photo') }}",
                type: 'POST',
                data: new FormData(this),
                contentType: false,
                processData: false,
                success: function (response) {
                    if(response.status == 1){
                        toastr.success(response.message)
                    }
                },
                error: function (response) {
                    if(response.responseJSON.errors.image)toastr.error(response.responseJSON.errors.image[0])
                }
            });
        });
    });
</script>
@endpush
