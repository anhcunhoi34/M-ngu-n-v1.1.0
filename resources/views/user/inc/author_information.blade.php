<div class="wsus__profile_sidebar">
    <div class="wsus__profile_sedebar_item wsus__sidebar_buy_info">
        <h3>{{__('user.Selling Info')}}</h3>
        @php
            $total_sold=App\Models\OrderItem::where('author_id', $user->id)->get()->count();
            $total_product=App\Models\Product::where(['author_id' => $user->id, 'status' => 1])->get()->count();
            $total_review=App\Models\Review::where(['author_id' => $user->id, 'status' => 1])->get()->count();
        @endphp
        <ul class="info">
            <li>
                <p><i class="fal fa-cart-plus"></i> {{__('user.Total Sale')}}</p>
                <span>{{ $total_sold }}</span>
            </li>
            <li>
                <p><i class="far fa-box"></i> {{__('user.item')}}</p>
                <span>{{ $total_product }}</span>
            </li>
            <li>
                <p><i class="fas fa-star"></i> {{__('user.Item Rating')}}</p>
                <span><i class="fas fa-star"></i> ({{ $total_review }})</span>
            </li>
        </ul>
    </div>
    <div class="wsus__profile_sedebar_item wsus__sidebar_pro_info mt_30">
        <h3>{{__('user.Personal Info')}}</h3>
        <ul>
            <li><span>{{__('user.Country')}}</span> {{ $user->country }}</li>
            <li><span>{{__('user.City')}}</span> {{ $user->city }}</li>
            <li><span>{{__('user.Joined')}}</span> {{ Carbon\Carbon::parse($user->created_at)->format('F Y') }}</li>
        </ul>
    </div>

    <div class="wsus__profile_sedebar_item profile_sedebar_contact mt_30">
        <h3>{{__('user.Contact Author')}}</h3>
        <form id="contactWithAuthor">
            @csrf
            <input type="hidden" name="email" value="{{ $user->email }}" readonly>
            <div class="wsus__comment_single_input">
                <fieldset>
                    <legend>{{__('user.Message')}}*</legend>
                    <textarea rows="3" name="message"></textarea>
                </fieldset>
            </div>
            @if($recaptchaSetting->status==1)
                <div class="g-recaptcha mb-3" data-sitekey="{{ $recaptchaSetting->site_key }}"></div>
            @endif
            <button type="submit" class="common_btn" id="submitBtn">{{__('user.send message')}}</button>
            <button type="submit" id="showSpain" class="common_btn d-none"><i class="fas fa-spinner fa-spin"></i></button>
        </form>
    </div>
    <div class="wsus__sidebar_buy_info profile_sedebar_social mt_30">
        <h3>Social Profile</h3>
        <ul class="d-flex flex-wrap">
            <li>
                <a href="{{ $user->facebook }}">
                    <img src="{{ asset('frontend/images/Facebook.png') }}" alt="icon" class="img-fluid w-100">
                </a>
            </li>
            <li>
                <a href="{{ $user->pinterest }}">
                    <img src="{{ asset('frontend/images/Pinterest.png') }}" alt="icon" class="img-fluid w-100">
                </a>
            </li>
            <li>
                <a href="{{ $user->linkedIn }}">
                    <img src="{{ asset('frontend/images/LinkedIn.png') }}" alt="icon" class="img-fluid w-100">
                </a>
            </li>
            <li>
                <a href="{{ $user->dribbble }}">
                    <img src="{{ asset('frontend/images/Dribbble.png') }}" alt="icon" class="img-fluid w-100">
                </a>
            </li>
            <li>
                <a href="{{ $user->twitter }}">
                    <img src="{{ asset('frontend/images/Twitter.png') }}" alt="icon" class="img-fluid w-100">
                </a>
            </li>
        </ul>
    </div>
</div>