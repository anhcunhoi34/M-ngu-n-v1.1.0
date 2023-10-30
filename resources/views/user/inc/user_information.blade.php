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
</div>