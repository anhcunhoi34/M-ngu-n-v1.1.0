@extends($active_theme)

@section('title')
    <title>{{__('user.Seller withdraw')}}</title>
    <meta name="description" content="{{__('user.Seller withdraw')}}">
@endsection

@section('frontend-content')
    <!--=============================
        PROFILE PAYOUT START
    ==============================-->
    <section class="wsus__profile pt_130 xs_pt_100 pb_120 xs_pb_80">

        @include('user.inc.profile_header')

            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__payout_overview_item">
                        <div class="icon">
                            <img src="{{ asset('frontend/images/payout_icon_1.png') }}" alt="payout" class="img-fluid w-100">
                        </div>
                        <p>{{__('user.Current Balance')}}</p>
                        <h2>
                            @if (session()->get('currency_position') == 'right')
                                {{ $current_balance * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                            @else
                                {{ session()->get('currency_icon') }}{{ $current_balance * session()->get('currency_rate') }}
                            @endif
                        </h2>
                        <a href="#" data-bs-toggle="modal" data-bs-target="#payoutModal">{{__('user.Make withdraw')}}</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__payout_overview_item item_2">
                        <div class="icon">
                            <img src="{{ asset('frontend/images/payout_icon_2.png') }}" alt="payout" class="img-fluid w-100">
                        </div>
                        <p>{{__('user.Total Earning')}}</p>
                        <h2>
                            @if (session()->get('currency_position') == 'right')
                                {{ $total_balance * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                            @else
                                {{ session()->get('currency_icon') }}{{ $total_balance * session()->get('currency_rate') }}
                            @endif
                        </h2>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="wsus__payout_overview_item item_3">
                        <div class="icon">
                            <img src="{{ asset('frontend/images/payout_icon_3.png') }}" alt="payout" class="img-fluid w-100">
                        </div>
                        <p>{{__('user.Total Withdraw')}}</p>
                        <h2>
                            @if (session()->get('currency_position') == 'right')
                                {{ $total_withdraw * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                            @else
                                {{ session()->get('currency_icon') }}{{ $total_withdraw * session()->get('currency_rate') }}
                            @endif
                        </h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="wsus__payout_table">
                        <h2>{{__('user.My Withdraw')}}</h2>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr class="header_row">
                                        <th class="number">{{__('user.Number')}}</th>
                                        <th class="method">{{__('user.Method')}}</th>
                                        <th class="method">{{__('user.Total Amount')}}</th>
                                        <th class="charge">{{__('user.Charge')}}</th>
                                        <th class="amount">{{__('user.Withdraw Amount')}}</th>
                                        <th class="status">{{__('user.Status')}}</th>
                                    </tr>

                                    @foreach ($withdraws as $index=>$withdraw)
                                        <tr>
                                            <td class="number">{{ ++$index }}</td>
                                            <td class="method">{{ $withdraw->method }}</td>
                                            <td class="method">
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ $withdraw->total_amount * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ $withdraw->total_amount * session()->get('currency_rate') }}
                                                @endif
                                            </td>
                                            <td class="charge">
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ ($withdraw->total_amount-$withdraw->withdraw_amount) * session()->get('currency_rate') }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ ($withdraw->total_amount-$withdraw->withdraw_amount) * session()->get('currency_rate') }}
                                                @endif
                                            </td>
                                            <td class="amount">
                                                @if (session()->get('currency_position') == 'right')
                                                    {{ html_decode($withdraw->withdraw_amount * session()->get('currency_rate')) }}{{ session()->get('currency_icon') }}
                                                @else
                                                    {{ session()->get('currency_icon') }}{{ html_decode($withdraw->withdraw_amount * session()->get('currency_rate')) }}
                                                @endif
                                            </td>
                                            @if ($withdraw->status==1)
                                            <td class="status"><span class="success">{{__('user.Success')}}</span></td>
                                            @else
                                            <td class="status"><span class="pending">{{__('user.Pending')}}</span></td>
                                            @endif
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- payout modal start -->
    <div class="modal fade variant_modal" id="payoutModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">{{__('user.My Withdraw')}}</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i
                            class="fas fa-times"></i></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('withdraw.store') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Select Withdraw Method')}}*</legend>
                                        <select class="select_js" name="method_id" id="method_id">
                                            <option value="">{{__('user.Select Withdraw Method')}}</option>
                                            @foreach ($withdraw_methods as $withdraw_method)
                                            <option value="{{ $withdraw_method->id }}">{{ $withdraw_method->name }}</option>
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-12" id="method_des_box">
                                                
                            </div>
                            <div class="col-12">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Withdraw Amount')}}* ({{__('user.USD Amount')}})</legend>
                                        <input type="text" name="withdraw_amount">
                                    </fieldset>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="wsus__comment_single_input">
                                    <fieldset>
                                        <legend>{{__('user.Account information')}}*</legend>
                                        <textarea name="account_info" id="" cols="30" rows="5"></textarea>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <button class="common_btn" type="submit">{{__('user.Withdraw Now')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- payout modal end -->
    <!--=============================
        PROFILE PAYOUT END
    ==============================-->
@endsection
@push('frontend_js')
<script>
    (function($) {
    "use strict";
    $(document).ready(function () {
        $("#method_id").on('change', function(){
            var methodId = $(this).val();
            $.ajax({
                type:"get",
                url:"{{url('/get-withdraw-account-info/')}}"+"/"+methodId,
                success:function(response){
                   $("#method_des_box").html(response);
                },
                error:function(err){}
            })

            if(!methodId){
                $("#method_des").addClass('d-none')
            }

        });
    });
})(jQuery);
</script>
@endpush
