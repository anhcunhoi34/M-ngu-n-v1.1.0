<div class="card mb-3" id="method_des">
    <div class="card-body">
            <h6>{{__('user.Withdraw Limit')}} : {{ $setting->currency_icon }}{{ $method->min_amount }} - {{ $setting->currency_icon }}{{ $method->max_amount }}</h6>
            <h6 class="mt-2">{{__('user.Withdraw charge')}} : {{ $method->withdraw_charge }}%</h6>
            <p class="mt-2">{!! clean($method->description) !!}</p>
    </div>
</div>
