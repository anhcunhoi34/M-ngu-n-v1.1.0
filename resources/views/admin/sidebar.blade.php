@php
    $setting = App\Models\Setting::first();
@endphp


<div class="main-sidebar">
    <aside id="sidebar-wrapper">
      <div class="sidebar-brand">
        <a href="{{ route('admin.dashboard') }}">{{ $setting->sidebar_lg_header }}</a>
      </div>
      <div class="sidebar-brand sidebar-brand-sm">
        <a href="{{ route('admin.dashboard') }}">{{ $setting->sidebar_sm_header }}</a>
      </div>
      <ul class="sidebar-menu">
          <li class="{{ Route::is('admin.dashboard') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.dashboard') }}"><i class="fas fa-home"></i> <span>{{__('admin.Dashboard')}}</span></a></li>

          <li class="nav-item dropdown {{ Route::is('admin.all-booking') || Route::is('admin.order-show') || Route::is('admin.pending-order') || Route::is('admin.complete-order') || Route::is('admin.complete-request') || Route::is('admin.completed-booking') || Route::is('admin.declined-booking')  ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-shopping-cart"></i><span>{{__('admin.All Orders')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.all-booking') || Route::is('admin.order-show') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.all-booking') }}">{{__('admin.All Orders')}}</a></li>

                <li class="{{ Route::is('admin.pending-order') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.pending-order') }}">{{__('admin.Pending Orders')}}</a></li>

                <li class="{{ Route::is('admin.complete-order') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.complete-order') }}">{{__('admin.Complete Orders')}}</a></li>

              </ul>
            </li>
          </li>

          <li class="nav-item dropdown {{ Route::is('admin.product.*') || Route::is('admin.active.product') || Route::is('admin.pending.product') || Route::is('admin.package.content') || Route::is('admin.product-type.*') || Route::is('admin.product-variant') || Route::is('admin.select-product-type') || Route::is('admin.product-comment.*') || Route::is('admin.product-review.*') || Route::is('admin.product-type-page.*') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i><span>{{__('admin.Manage Product')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.select-product-type') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.select-product-type') }}">{{__('admin.Create Product')}}</a></li>

                <li class="{{ Route::is('admin.product.*') || Route::is('admin.product-variant') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.product.index') }}">{{__('admin.All Product')}}</a></li>

                <li class="{{ Route::is('admin.active.product') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.active.product') }}">{{__('admin.Active Product')}}</a></li>

                <li class="{{ Route::is('admin.pending.product') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.pending.product') }}">{{__('admin.Pending Product')}}</a></li>

                <li class="{{ Route::is('admin.package.content') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.package.content', ['lang_code' => 'en']) }}">{{__('admin.Package Content')}}</a></li>

                <li class="{{ Route::is('admin.product-type.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.product-type.index', ['lang_code' => 'en']) }}">{{__('admin.Product Type')}}</a></li>

                <li class="{{ Route::is('admin.product-type-page.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.product-type-page.index', ['lang_code' => 'en']) }}">{{__('admin.Product Type Page')}}</a></li>

                <li class="{{ Route::is('admin.product-comment.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.product-comment.index') }}">{{__('admin.Comment')}}</a></li>

                <li class="{{ Route::is('admin.product-review.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.product-review.index') }}">{{__('admin.Review')}}</a></li>

            </ul>
          </li>

          <li class="{{ Route::is('admin.category.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.category.index') }}"><i class="fas fa-th-large"></i> <span>{{__('admin.Categories')}}</span></a></li>

          <li class="{{ Route::is('admin.coupon.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.coupon.index') }}"><i class="fas fa-th-large"></i> <span>{{__('admin.Coupon')}}</span></a></li>

          <li class="{{  Route::is('admin.provider') || Route::is('admin.send-email-to-all-provider') || Route::is('admin.send-email-to-provider') || Route::is('admin.pending-provider') || Route::is('admin.provider-show') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.provider') }}"><i class="fas fa-users"></i> <span>{{__('admin.Sellers')}}</span></a></li>

          <li class="nav-item dropdown {{  Route::is('admin.customer-list') || Route::is('admin.customer-show') || Route::is('admin.pending-customer-list') || Route::is('admin.send-email-to-all-customer') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-users"></i><span>{{__('admin.Users')}}</span></a>
            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.customer-list') || Route::is('admin.customer-show') || Route::is('admin.send-email-to-all-customer') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.customer-list') }}">{{__('admin.User List')}}</a></li>

                <li class="{{ Route::is('admin.pending-customer-list') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.pending-customer-list') }}">{{__('admin.Pending User')}}</a></li>
            </ul>
          </li>


          <li class="nav-item dropdown {{ Route::is('admin.withdraw-method.*') || Route::is('admin.provider-withdraw') || Route::is('admin.pending-provider-withdraw') || Route::is('admin.show-provider-withdraw')  ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="far fa-newspaper"></i><span>{{__('admin.Withdraw Payment')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.withdraw-method.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.withdraw-method.index') }}">{{__('admin.Withdraw Method')}}</a></li>

                <li class="{{ Route::is('admin.provider-withdraw') || Route::is('admin.show-provider-withdraw') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.provider-withdraw') }}">{{__('admin.Seller Withdraw')}}</a></li>

                <li class="{{ Route::is('admin.pending-provider-withdraw') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.pending-provider-withdraw') }}">{{__('admin.Withdraw Request')}}</a></li>

            </ul>
          </li>

          <li class="nav-item dropdown {{ Route::is('admin.maintainance-mode') ||  Route::is('admin.mega-menu-category.*') || Route::is('admin.mega-menu-sub-category') || Route::is('admin.create-mega-menu-sub-category') || Route::is('admin.edit-mega-menu-sub-category') || Route::is('admin.mega-menu-banner') || Route::is('admin.banner-image.index') || Route::is('admin.cart-bottom-banner') || Route::is('admin.shop-page') || Route::is('admin.seo-setup') || Route::is('admin.menu-visibility') || Route::is('admin.product-detail-page') || Route::is('admin.default-avatar') || Route::is('admin.login-page') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-globe"></i><span>{{__('admin.Manage Website')}}</span></a>

            <ul class="dropdown-menu">

                <li class="{{ Route::is('admin.seo-setup') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.seo-setup') }}">{{__('admin.SEO Setup')}}</a></li>

                <li class="{{ Route::is('admin.maintainance-mode') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.maintainance-mode') }}">{{__('admin.Maintainance Mode')}}</a></li>

                <li class="{{ Route::is('admin.default-avatar') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.default-avatar') }}">{{__('admin.Default Avatar')}}</a></li>

            </ul>
          </li>

          <li class="nav-item dropdown {{ Route::is('admin.slider.*') || Route::is('admin.counter') || Route::is('admin.testimonial.*') || Route::is('admin.template.*') || Route::is('admin.mobile-app') || Route::is('admin.subscriber-section') || Route::is('admin.partner.*') || Route::is('admin.section-content') || Route::is('admin.section-control') || Route::is('admin.why-choose-us') || Route::is('admin.topbar.offer') || Route::is('admin.offer') || Route::is('admin.trending-offer') || Route::is('admin.our-team.*') || Route::is('admin.ad') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i><span>{{__('admin.All Section')}}</span></a>
            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.section-content') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.section-content', ['lang_code' => 'en']) }}">{{__('admin.Section Content')}}</a></li>

                <li class="{{ Route::is('admin.section-control') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.section-control') }}">{{__('admin.Section Control')}}</a></li>

                <li class="{{ Route::is('admin.slider.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.slider.index', ['lang_code' => 'en']) }}">{{__('admin.Intro section')}}</a></li>

                <li class="{{ Route::is('admin.why-choose-us') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.why-choose-us', ['lang_code' => 'en']) }}">{{__('admin.Why Choose Us')}}</a></li>

                <li class="{{ Route::is('admin.counter') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.counter', ['lang_code' => 'en']) }}">{{__('admin.Counter')}}</a></li>

                <li class="{{ Route::is('admin.topbar.offer') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.topbar.offer', ['lang_code' => 'en']) }}">{{__('admin.Topbar Offer')}}</a></li>

                <li class="{{ Route::is('admin.offer') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.offer', ['lang_code' => 'en']) }}">{{__('admin.Special Offer')}}</a></li>

                <li class="{{ Route::is('admin.trending-offer') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.trending-offer', ['lang_code' => 'en']) }}">{{__('admin.Trending Offer')}}</a></li>

                <li class="{{ Route::is('admin.testimonial.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.testimonial.index') }}">{{__('admin.Testimonial')}}</a></li>

                <li class="{{ Route::is('admin.template.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.template.index') }}">{{__('admin.Template')}}</a></li>

                <li class="{{ Route::is('admin.mobile-app') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.mobile-app', ['lang_code' => 'en']) }}">{{__('admin.Mobile App')}}</a></li>

                <li class="{{ Route::is('admin.subscriber-section') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.subscriber-section', ['lang_code' => 'en']) }}">{{__('admin.Subscription Box')}}</a></li>

                <li class="{{ Route::is('admin.partner.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.partner.index') }}">{{__('admin.Partner')}}</a></li>

                <li class="{{ Route::is('admin.our-team.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.our-team.index') }}">{{__('admin.Our Team')}}</a></li>

                <li class="{{ Route::is('admin.ad') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.ad') }}">{{__('admin.Ad')}}</a></li>

            </ul>
          </li>


          <li class="nav-item dropdown {{ Route::is('admin.footer.*') || Route::is('admin.social-link.*') || Route::is('admin.footer-link.*') || Route::is('admin.second-col-footer-link') || Route::is('admin.third-col-footer-link') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i><span>{{__('admin.Footer')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.footer.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.footer.index', ['lang_code' => 'en']) }}">{{__('admin.Footer')}}</a></li>

                <li class="{{ Route::is('admin.social-link.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.social-link.index') }}">{{__('admin.Social Link')}}</a></li>

                <li class="{{ Route::is('admin.footer-link.*') ? 'active' : '' }} d-none"><a class="nav-link" href="{{ route('admin.footer-link.index') }}">{{__('admin.Footer First Column')}}</a></li>

                <li class="{{ Route::is('admin.second-col-footer-link') ? 'active' : '' }} d-none"><a class="nav-link" href="{{ route('admin.second-col-footer-link') }}">{{__('admin.Footer Second Column')}}</a></li>

            </ul>
          </li>



          <li class="{{ Route::is('admin.reports') ? 'active' : '' }}"><a class="nav-link d-none" href="{{ route('admin.reports') }}"><i class="fas fa-file"></i> <span>{{__('admin.Provider/Client Reports')}}</span></a></li>




          <li class="{{ Route::is('admin.payment-method') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.payment-method') }}"><i class="fas fa-dollar-sign"></i> <span>{{__('admin.Payment Method')}}</span></a></li>



          <li class="nav-item dropdown {{ Route::is('admin.about-us.*') || Route::is('admin.custom-page.*') || Route::is('admin.terms-and-condition.*') || Route::is('admin.privacy-policy.*') || Route::is('admin.faq.*') || Route::is('admin.error-page.*') || Route::is('admin.contact-us.*') || Route::is('admin.become-author') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-columns"></i><span>{{__('admin.Pages')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.about-us.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.about-us.index', ['lang_code' => 'en']) }}">{{__('admin.About Us')}}</a></li>

                <li class="{{ Route::is('admin.become-author') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.become-author', ['lang_code' => 'en']) }}">{{__('admin.Become author')}}</a></li>

                <li class="{{ Route::is('admin.contact-us.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.contact-us.index', ['lang_code' => 'en']) }}">{{__('admin.Contact Us')}}</a></li>

                <li class="{{ Route::is('admin.custom-page.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.custom-page.index') }}">{{__('admin.Custom Page')}}</a></li>

                <li class="{{ Route::is('admin.terms-and-condition.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.terms-and-condition.index', ['lang_code' => 'en']) }}">{{__('admin.Terms And Conditions')}}</a></li>

                <li class="{{ Route::is('admin.privacy-policy.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.privacy-policy.index', ['lang_code' => 'en']) }}">{{__('admin.Privacy Policy')}}</a></li>

                <li class="{{ Route::is('admin.faq.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.faq.index') }}">{{__('admin.FAQ')}}</a></li>

                <li class="{{ Route::is('admin.error-page.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.error-page.index') }}">{{__('admin.Error Page')}}</a></li>

            </ul>
          </li>

          <li class="nav-item dropdown {{ Route::is('admin.blog-category.*') || Route::is('admin.edit.blog.category') || Route::is('admin.blog.*') || Route::is('admin.popular-blog.*') || Route::is('admin.popular-tags.*') || Route::is('admin.blog-comment.*') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i><span>{{__('admin.Blogs')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.blog-category.*') || Route::is('admin.edit.blog.category') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.blog-category.index') }}">{{__('admin.Categories')}}</a></li>

                <li class="{{ Route::is('admin.blog.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.blog.index') }}">{{__('admin.Blogs')}}</a></li>

                <li class="{{ Route::is('admin.popular-blog.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.popular-blog.index') }}">{{__('admin.Popular Blogs')}}</a></li>

                <li class="{{ Route::is('admin.popular-tags.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.popular-tags.index') }}">{{__('admin.Popular Tags')}}</a></li>

                <li class="{{ Route::is('admin.blog-comment.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.blog-comment.index') }}">{{__('admin.Comments')}}</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown {{ Route::is('admin.email-configuration') || Route::is('admin.email-template') || Route::is('admin.edit-email-template') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-envelope"></i><span>{{__('admin.Email Configuration')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.email-configuration') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.email-configuration') }}">{{__('admin.Setting')}}</a></li>

                <li class="{{ Route::is('admin.email-template') || Route::is('admin.edit-email-template') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.email-template') }}">{{__('admin.Email Template')}}</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown {{ Route::is('admin.admin-language') || Route::is('admin.admin-validation-language') || Route::is('admin.website-language') || Route::is('admin.website-validation-language') || Route::is('admin.languages') ? 'active' : '' }}">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i><span>{{__('admin.Language')}}</span></a>

            <ul class="dropdown-menu">
                <li class="{{ Route::is('admin.admin-language') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.admin-language', ['lang_code' => 'en']) }}">{{__('admin.Admin Language')}}</a></li>

                <li class="{{ Route::is('admin.admin-validation-language') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.admin-validation-language', ['lang_code' => 'en']) }}">{{__('admin.Admin Validation')}}</a></li>

                <li class="{{ Route::is('admin.website-language') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.website-language', ['lang_code' => 'en']) }}">{{__('admin.Frontend Language')}}</a></li>

                <li class="{{ Route::is('admin.website-validation-language') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.website-validation-language', ['lang_code' => 'en']) }}">{{__('admin.Frontend Validation')}}</a></li>

                <li class="{{ Route::is('admin.languages') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.languages') }}">{{__('admin.Languages')}}</a></li>
            </ul>
          </li>

          <li class="{{ Route::is('admin.currency.*') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.currency.index') }}"><i class="fas fa-dollar-sign"></i> <span>{{__('admin.Currencies')}}</span></a></li>

          <li class="{{ Route::is('admin.general-setting') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.general-setting') }}"><i class="fas fa-cog"></i> <span>{{__('admin.Setting')}}</span></a></li>

          @php
              $logedInAdmin = Auth::guard('admin')->user();
          @endphp
          @if ($logedInAdmin->admin_type == 1)
          <li  class="{{ Route::is('admin.clear-database') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.clear-database') }}"><i class="fas fa-trash"></i> <span>{{__('admin.Clear Database')}}</span></a></li>
          @endif

          <li class="{{ Route::is('admin.subscriber') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.subscriber') }}"><i class="fas fa-fire"></i> <span>{{__('admin.Subscribers')}}</span></a></li>

          <li class="{{ Route::is('admin.contact-message') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.contact-message') }}"><i class="fas fa-fa fa-envelope"></i> <span>{{__('admin.Contact Message')}}</span></a></li>

          @if ($logedInAdmin->admin_type == 1)
            <li class="{{ Route::is('admin.admin.index') ? 'active' : '' }}"><a class="nav-link" href="{{ route('admin.admin.index') }}"><i class="fas fa-user"></i> <span>{{__('admin.Admin list')}}</span></a></li>
          @endif

        </ul>

    </aside>
  </div>
