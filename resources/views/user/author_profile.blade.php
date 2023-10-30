@extends($active_theme)

@section('title')
    <title>{{__('user.Seller Profile')}}</title>
    <meta name="description" content="{{__('user.Seller Profile')}}">
@endsection

@section('frontend-content')
    <!--=============================
        PROFILE OVERVIEW START
    ==============================-->
    <section class="wsus__profile pt_130 xs_pt_100 pb_120 xs_pb_80">

        @include('user.inc.author_profile_header')

            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="wsus__profile_overview">
                        @if ($user->about_me!=null)
                            <h2>{{__('user.About Me')}}</h2>
                            {!! clean(html_decode($user->about_me)) !!}
                        @endif
                        @if ($user->my_skill!=null)
                            <h2>{{__('user.My Skills')}} :</h2>
                            {!! clean(html_decode($user->my_skill)) !!}
                        @endif
                    </div>
                </div>
                
                <div class="col-xl-4 col-lg-4">
                    @include('user.inc.author_information')
                </div>
            </div>
        </div>
    </section>
    <!--=============================
        PROFILE OVERVIEW END
    ==============================-->
@endsection
@push('frontend_js')
<script>
    
    (function($) {
        "use strict";
        $(document).ready(function () {
            $("#contactWithAuthor").on("submit", function(e){
                e.preventDefault();

                var isDemo = "{{ env('APP_MODE') }}"
                if(isDemo == 'DEMO'){
                    toastr.error('This Is Demo Version. You Can Not Change Anything');
                    return;
                }
                 $('#submitBtn').addClass('d-none');
                 $('#showSpain').removeClass('d-none');
                $.ajax({
                    url: "{{ route('contact-with-author') }}",
                    type:"post",
                    data:$('#contactWithAuthor').serialize(),
                    success:function(response){
                        if(response.status == 1){
                            toastr.success(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }
                        if(response.status == 0){
                            toastr.error(response.message)
                            $("#contactWithAuthor").trigger("reset");
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }
                    },
                    error:function(response){
                        if(response.status == 403){
                            toastr.error(response.responseJSON.message);
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }else{
                            if(response.responseJSON.errors.email)toastr.error(response.responseJSON.errors.email[0])
                            if(response.responseJSON.errors.message)toastr.error(response.responseJSON.errors.message[0])
                            if(!response.responseJSON.errors.message){
                                toastr.error("{{__('user.Please complete the recaptcha to submit the form')}}")
                            }
                            $('#submitBtn').removeClass('d-none');
                            $('#showSpain').addClass('d-none');
                        }
                    }
                });
            });
        });
    })(jQuery);



</script>
@endpush
