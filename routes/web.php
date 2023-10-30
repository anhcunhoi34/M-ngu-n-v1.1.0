<?php



use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Admin\AdController;
use App\Http\Controllers\Admin\FaqController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\TeamController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\User\PaypalController;
use App\Http\Controllers\Admin\CouponController;
use App\Http\Controllers\Admin\FooterController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\TicketController;
use App\Http\Controllers\User\MessageController;
use App\Http\Controllers\User\PaymentController;
use App\Http\Controllers\Admin\AboutUsController;
use App\Http\Controllers\Admin\ContentController;
use App\Http\Controllers\Admin\CounterController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\PartnerController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\User\CheckoutController;
use App\Http\Controllers\User\WishlistController;
use App\Http\Controllers\User\WithdrawController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CurrencyController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\HomepageController;
use App\Http\Controllers\Admin\LanguageController;
use App\Http\Controllers\Admin\ProviderController;
use App\Http\Controllers\Admin\TemplateController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ErrorPageController;
use App\Http\Controllers\Admin\BreadcrumbController;
use App\Http\Controllers\Admin\CustomPageController;
use App\Http\Controllers\Admin\FooterLinkController;
use App\Http\Controllers\Admin\PopularTagController;


use App\Http\Controllers\Admin\SubscriberController;
use App\Http\Controllers\Provider\ServiceController;
use App\Http\Controllers\User\UserProfileController;

use App\Http\Controllers\Admin\BlogCommentController;

use App\Http\Controllers\Admin\ContactPageController;

use App\Http\Controllers\Admin\PopularBlogController;
use App\Http\Controllers\Admin\ProductItemController;
use App\Http\Controllers\Admin\TestimonialController;
use App\Http\Controllers\SslCommerzPaymentController;
use App\Http\Controllers\Admin\AdminProfileController;
use App\Http\Controllers\Admin\AdminServiceController;
use App\Http\Controllers\Admin\BlogCategoryController;

// frontend start

use App\Http\Controllers\Admin\CountryStateController;

use App\Http\Controllers\User\AuthorProfileController;
use App\Http\Controllers\Admin\EmailTemplateController;
use App\Http\Controllers\Admin\PaymentMethodController;
use App\Http\Controllers\Admin\PrivacyPolicyController;
use App\Http\Controllers\Admin\ProductReviewController;
use App\Http\Controllers\Admin\ContactMessageController;

use App\Http\Controllers\Admin\MenuVisibilityController;
use App\Http\Controllers\Admin\ProductCommentController;
use App\Http\Controllers\Admin\WithdrawMethodController;
use App\Http\Controllers\Admin\Auth\AdminLoginController;
use App\Http\Controllers\Admin\ProductTypePageController;
use App\Http\Controllers\Admin\FooterSocialLinkController;
use App\Http\Controllers\Admin\ProviderWithdrawController;
use App\Http\Controllers\Provider\ProviderOrderController;
use App\Http\Controllers\User\ContactWithAuthorController;
use App\Http\Controllers\Admin\TermsAndConditionController;
use App\Http\Controllers\Provider\ProviderTicketController;
use App\Http\Controllers\Admin\EmailConfigurationController;
use App\Http\Controllers\Provider\ProviderProfileController;
use App\Http\Controllers\Provider\ProviderDashboardController;
use App\Http\Controllers\Provider\AppointmentScheduleController;
use App\Http\Controllers\Admin\Auth\AdminForgotPasswordController;

use App\Models\MultiCurrency;
use App\Models\Setting;

Route::group(['middleware' => ['demo','XSS']], function () {

Route::group(['middleware' => ['maintainance']], function () {

    Route::group(['middleware' => ['HtmlSpecialchars']], function () {

    Route::get('/download-file/{file}', [HomeController::class, 'downloadListingFile'])->name('download-file');

    Route::get('/', [HomeController::class, 'index'])->name('home');
    Route::get('/about-us', [HomeController::class, 'aboutUs'])->name('about-us');
    Route::get('/contact-us', [HomeController::class, 'contactUs'])->name('contact-us');
    Route::post('/send-contact-message', [HomeController::class, 'sendContactMessage'])->name('send-contact-message');
    Route::get('/blogs', [HomeController::class, 'blogs'])->name('blogs');
    Route::get('/blog/{slug}', [HomeController::class, 'single_blog'])->name('blog');
    Route::post('/blog-comment', [HomeController::class, 'blogComment'])->name('blog-comment');
    Route::post('/product-comment', [HomeController::class, 'productComment'])->name('product-comment');
    Route::post('/product-review', [HomeController::class, 'productReview'])->name('product-review');
    Route::get('/faq', [HomeController::class, 'faq'])->name('faq');
    Route::get('/terms-and-conditions', [HomeController::class, 'termsAndCondition'])->name('terms-and-conditions');
    Route::get('/privacy-policy', [HomeController::class, 'privacyPolicy'])->name('privacy-policy');
    Route::get('/page/{slug}', [HomeController::class, 'customPage'])->name('custom-page');
    Route::get('/products', [HomeController::class, 'product'])->name('products');
    Route::get('/product/{slug}', [HomeController::class, 'product_detail'])->name('product-detail');
    Route::get('/variant-price/{variant_id}', [HomeController::class, 'variant_price'])->name('variant-price');
    Route::get('/become-author', [HomeController::class, 'become_author'])->name('become-author-page');

    Route::post('/subscribe-request', [HomeController::class, 'subscribeRequest'])->name('subscribe-request');
    Route::get('/subscriber-verification/{token}', [HomeController::class, 'subscriberVerifcation'])->name('subscriber-verification');

    Route::get('language-change',[HomeController::class,'language_change'])->name('language.change');
    Route::get('currency-change',[HomeController::class,'currency_change'])->name('currency.change');

    Route::get('/payment/{slug}', [PaymentController::class, 'payment'])->name('payment');
    Route::post('/bank-payment', [PaymentController::class, 'bankPayment'])->name('bank-payment');
    Route::post('/pay-with-stripe', [PaymentController::class, 'payWithStripe'])->name('pay-with-stripe');
    Route::post('/pay-with-razorpay', [PaymentController::class, 'payWithRazorpay'])->name('pay-with-razorpay');
    Route::post('/pay-with-flutterwave', [PaymentController::class, 'payWithFlutterwave'])->name('pay-with-flutterwave');
    Route::get('/pay-with-mollie', [PaymentController::class, 'payWithMollie'])->name('pay-with-mollie');
    Route::get('/mollie-payment-success', [PaymentController::class, 'molliePaymentSuccess'])->name('mollie-payment-success');
    Route::post('/pay-with-paystack', [PaymentController::class, 'payWithPayStack'])->name('pay-with-paystack');
    Route::get('/response-paystack', [PaymentController::class, 'paystackResponse'])->name('response-paystack');
    Route::get('/pay-with-instamojo', [PaymentController::class, 'payWithInstamojo'])->name('pay-with-instamojo');
    Route::get('/response-instamojo', [PaymentController::class, 'instamojoResponse'])->name('response-instamojo');

    Route::get('/pay-with-paypal', [PaypalController::class, 'payWithPaypal'])->name('pay-with-paypal');
    Route::get('/paypal-payment-success', [PaypalController::class, 'paypalPaymentSuccess'])->name('paypal-payment-success');
    Route::get('/paypal-payment-cancled', [PaypalController::class, 'paypalPaymentCancled'])->name('paypal-payment-cancled');

    // SSLCOMMERZ Start
    Route::get('/example1', [SslCommerzPaymentController::class, 'exampleEasyCheckout']);
    Route::get('/example2', [SslCommerzPaymentController::class, 'exampleHostedCheckout']);

    Route::post('/pay', [SslCommerzPaymentController::class, 'index']);
    Route::post('/pay-via-ajax', [SslCommerzPaymentController::class, 'payViaAjax']);

    Route::post('/success', [SslCommerzPaymentController::class, 'success']);
    Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
    Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);

    Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);
    //SSLCOMMERZ END
    Route::get('/login', [LoginController::class, 'loginPage'])->name('login');
    Route::post('/store-login', [LoginController::class, 'storeLogin'])->name('store-login');
    Route::get('/register', [RegisterController::class, 'registerPage'])->name('register');
    Route::post('/store-register', [RegisterController::class, 'storeRegister'])->name('store-register');
    Route::get('/user-verification/{token}', [RegisterController::class, 'userVerification'])->name('user-verification');
    Route::get('/forget-password', [LoginController::class, 'forgetPage'])->name('forget-password');
    Route::post('/send-forget-password', [LoginController::class, 'sendForgetPassword'])->name('send-forget-password');
    Route::get('/reset-password/{token}', [LoginController::class, 'resetPasswordPage'])->name('reset-password');
    Route::post('/store-reset-password/{token}', [LoginController::class, 'storeResetPasswordPage'])->name('store-reset-password');

    Route::get('login/google',[LoginController::class, 'redirectToGoogle'])->name('login-google');
    Route::get('/callback/google',[LoginController::class,'googleCallBack'])->name('callback-google');


    Route::get('dashboard', [UserProfileController::class, 'dashboard'])->name('dashboard');
    Route::get('portfolio', [UserProfileController::class, 'portfolio'])->name('portfolio');
    Route::get('download', [UserProfileController::class, 'download'])->name('download');
    Route::get('collection', [UserProfileController::class, 'collection'])->name('collection');

    Route::post('/user-product-review', [UserProfileController::class, 'productReview'])->name('user-product-review');

    Route::get('seller-profile/{slug}', [AuthorProfileController::class, 'profile'])->name('author-profile');
    Route::get('seller-portfolio/{slug}', [AuthorProfileController::class, 'portfolio'])->name('author-portfolio');

    Route::get('/user/logout', [LoginController::class, 'userLogout'])->name('user.logout');
    Route::get('edit-profile', [UserProfileController::class, 'profileEdit'])->name('edit-profile');
    Route::post('profile-update', [UserProfileController::class, 'updateProfile'])->name('update-profile');
    Route::post('user-photo-update', [UserProfileController::class, 'updateUserPhoto'])->name('update-user-photo');
    Route::get('change-password', [UserProfileController::class, 'changePassword'])->name('change-password');
    Route::post('password-update', [UserProfileController::class, 'updatePassword'])->name('update-password');
    Route::get('download-script/{id}', [UserProfileController::class, 'download_script'])->name('download-script');
    Route::get('download-variant/{id}', [UserProfileController::class, 'download_variant'])->name('download-variant');

    Route::post('contact-with-author', [ContactWithAuthorController::class, 'contactWithAuthor'])->name('contact-with-author');

    Route::get('select-product-type', [UserProfileController::class, 'select_product_type'])->name('select-product-type');
    Route::get('product-create', [UserProfileController::class, 'product_create'])->name('product-create');
    Route::post('product-store', [UserProfileController::class, 'store'])->name('product-store');
    Route::post('store-image-type-product', [UserProfileController::class, 'store_image_type_product'])->name('store-image-type-product');
    Route::get('product-edit/{id}', [UserProfileController::class, 'edit'])->name('product-edit');
    Route::put('product-update/{id}', [UserProfileController::class, 'update'])->name('product-update');
    Route::put('image-product-update/{id}', [UserProfileController::class, 'image_product_update'])->name('image-product-update');
    Route::get('product-variant/{id}', [UserProfileController::class, 'product_variant'])->name('product-variant');

    Route::get('payment-success', [UserProfileController::class, 'payment_success'])->name('payment-success');

    Route::post('store-product-variant/{product_id}', [UserProfileController::class, 'store_product_variant'])->name('store-product-variant');
    Route::put('product-variant-update/{variant_id}', [UserProfileController::class, 'update_product_variant'])->name('update-product-variant');
    Route::delete('delete-product-variant/{variant_id}', [UserProfileController::class, 'delete_product_variant'])->name('delete-product-variant');

    Route::get('delete-product/{id}', [UserProfileController::class, 'delete_product'])->name('delete-product');

    Route::get('download-existing-file/{file_name}', [UserProfileController::class, 'download_existing_file'])->name('download-existing-file');
    Route::get('download-existing-variant-file/{file_name}', [UserProfileController::class, 'download_existing_variant_file'])->name('download-existing-variant-file');

    Route::post('/add/wishlist/{product_id}', [WishlistController::class, 'add_wishlist'])->name('add-wishlist');
    Route::get('/delete/wishlist/{id}', [UserProfileController::class, 'delete_wishlist'])->name('delete-wishlist');

    Route::post('add-to-cart/{product_id}', [CartController::class, 'addToCart'])->name('add-to-cart');
    Route::get('/mini-cart', [CartController::class, 'miniCart'])->name('mini-cart');
    Route::get('/cart-view', [CartController::class, 'cartView'])->name('cart-view');
    Route::get('/cart-item', [CartController::class, 'cartItem'])->name('cart-item');
    Route::get('/cart-remove/{rowId}', [CartController::class, 'cartRemove'])->name('cart-remove');
    Route::post('/coupon-apply', [CartController::class, 'couponApply'])->name('coupon-apply');
    Route::get('/coupon-calculation', [CartController::class, 'couponCalculation'])->name('coupon-calculation');
    Route::get('/coupon-remove', [CartController::class, 'couponRemove'])->name('coupon-remove');
    Route::get('/checkout', [CartController::class, 'checkout'])->name('checkout');


    Route::get('/withdraw', [WithdrawController::class, 'index'])->name('withdraw');
    Route::get('/get-withdraw-account-info/{id}', [WithdrawController::class, 'getWithDrawAccountInfo']);
    Route::post('/withdraw-store', [WithdrawController::class, 'store'])->name('withdraw.store');

    });
});

// start admin routes
Route::group(['as'=> 'admin.', 'prefix' => 'admin'],function (){

    // start auth route
    Route::get('login', [AdminLoginController::class,'adminLoginPage'])->name('login');
    Route::post('login', [AdminLoginController::class,'storeLogin'])->name('store-login');
    Route::post('logout', [AdminLoginController::class,'adminLogout'])->name('logout');
    Route::get('forget-password', [AdminForgotPasswordController::class,'forgetPassword'])->name('forget-password');
    Route::post('send-forget-password', [AdminForgotPasswordController::class,'sendForgetEmail'])->name('send.forget.password');
    Route::get('reset-password/{token}', [AdminForgotPasswordController::class,'resetPassword'])->name('reset.password');
    Route::post('password-store/{token}', [AdminForgotPasswordController::class,'storeResetData'])->name('store.reset.password');
    // end auth route

    Route::resource('admin', AdminController::class);
    Route::put('admin-status/{id}', [AdminController::class,'changeStatus'])->name('admin-status');
    Route::get('profile', [AdminProfileController::class,'index'])->name('profile');
    Route::put('profile-update', [AdminProfileController::class,'update'])->name('profile.update');

    Route::get('subscriber',[SubscriberController::class,'index'])->name('subscriber');
    Route::delete('delete-subscriber/{id}',[SubscriberController::class,'destroy'])->name('delete-subscriber');
    Route::post('specification-subscriber-email/{id}',[SubscriberController::class,'specificationSubscriberEmail'])->name('specification-subscriber-email');
    Route::post('each-subscriber-email',[SubscriberController::class,'eachSubscriberEmail'])->name('each-subscriber-email');

    Route::get('contact-message',[ContactMessageController::class,'index'])->name('contact-message');
    Route::delete('delete-contact-message/{id}',[ContactMessageController::class,'destroy'])->name('delete-contact-message');
    Route::put('enable-save-contact-message',[ContactMessageController::class,'handleSaveContactMessage'])->name('enable-save-contact-message');

    Route::get('general-setting',[SettingController::class,'index'])->name('general-setting');
    Route::put('update-general-setting',[SettingController::class,'updateGeneralSetting'])->name('update-general-setting');

    Route::put('update-theme-color',[SettingController::class,'updateThemeColor'])->name('update-theme-color');

    Route::put('update-logo-favicon',[SettingController::class,'updateLogoFavicon'])->name('update-logo-favicon');
    Route::put('update-cookie-consent',[SettingController::class,'updateCookieConset'])->name('update-cookie-consent');
    Route::put('update-tawk-chat',[SettingController::class,'updateTawkChat'])->name('update-tawk-chat');
    Route::put('update-google-recaptcha',[SettingController::class,'updateGoogleRecaptcha'])->name('update-google-recaptcha');

    Route::put('update-google-analytic',[SettingController::class,'updateGoogleAnalytic'])->name('update-google-analytic');
    Route::put('update-custom-pagination',[SettingController::class,'updateCustomPagination'])->name('update-custom-pagination');
    Route::put('update-social-login',[SettingController::class,'updateSocialLogin'])->name('update-social-login');
    Route::put('update-facebook-pixel',[SettingController::class,'updateFacebookPixel'])->name('update-facebook-pixel');
    Route::put('update-pusher',[SettingController::class,'updatePusher'])->name('update-pusher');

    Route::get('admin-language', [LanguageController::class, 'adminLnagugae'])->name('admin-language');
    Route::post('update-admin-language', [LanguageController::class, 'updateAdminLanguage'])->name('update-admin-language');

    Route::get('admin-validation-language', [LanguageController::class, 'adminValidationLnagugae'])->name('admin-validation-language');
    Route::post('update-admin-validation-language', [LanguageController::class, 'updateAdminValidationLnagugae'])->name('update-admin-validation-language');

    Route::get('website-language', [LanguageController::class, 'websiteLanguage'])->name('website-language');
    Route::post('update-language', [LanguageController::class, 'updateLanguage'])->name('update-language');

    Route::get('website-validation-language', [LanguageController::class, 'websiteValidationLanguage'])->name('website-validation-language');
    Route::post('update-validation-language', [LanguageController::class, 'updateValidationLanguage'])->name('update-validation-language');

    Route::get('email-configuration',[EmailConfigurationController::class,'index'])->name('email-configuration');
    Route::put('update-email-configuraion',[EmailConfigurationController::class,'update'])->name('update-email-configuraion');

    Route::get('email-template',[EmailTemplateController::class,'index'])->name('email-template');
    Route::get('edit-email-template/{id}',[EmailTemplateController::class,'edit'])->name('edit-email-template');
    Route::put('update-email-template/{id}',[EmailTemplateController::class,'update'])->name('update-email-template');

    Route::resource('blog-category', BlogCategoryController::class);
    Route::get('blog-category-edit', [BlogCategoryController::class,'blog_category_edit'])->name('edit.blog.category');
    Route::put('blog-category-status/{id}', [BlogCategoryController::class,'changeStatus'])->name('blog.category.status');

    Route::resource('blog', BlogController::class);
    Route::put('blog-status/{id}', [BlogController::class,'changeStatus'])->name('blog.status');

    Route::resource('popular-blog', PopularBlogController::class);
    Route::resource('popular-tags', PopularTagController::class);
    Route::put('popular-blog-status/{id}', [PopularBlogController::class,'changeStatus'])->name('popular-blog.status');

    Route::resource('blog-comment', BlogCommentController::class);
    Route::put('blog-comment-status/{id}', [BlogCommentController::class,'changeStatus'])->name('blog-comment.status');

    Route::resource('about-us', AboutUsController::class);
    Route::put('update-about-us', [AboutUsController::class, 'update_aboutUs'])->name('update-about-us');

    Route::get('become-author', [AboutUsController::class, 'become_author'])->name('become-author');
    Route::put('update-become-author', [AboutUsController::class, 'update_become_author'])->name('update-become-author');

    Route::resource('contact-us', ContactPageController::class);

    Route::resource('custom-page', CustomPageController::class);
    Route::put('custom-page-status/{id}', [CustomPageController::class,'changeStatus'])->name('custom-page.status');

    Route::resource('terms-and-condition', TermsAndConditionController::class);
    Route::resource('privacy-policy', PrivacyPolicyController::class);

    Route::resource('faq', FaqController::class);
    Route::put('faq-status/{id}', [FaqController::class,'changeStatus'])->name('faq-status');

    Route::resource('product-type-page', ProductTypePageController::class);

    Route::resource('error-page', ErrorPageController::class);

    Route::get('footer', [FooterController::class, 'index'])->name('footer.index');
    Route::put('footer-update/{id}', [FooterController::class, 'update'])->name('footer.update');

    Route::resource('social-link', FooterSocialLinkController::class);
    Route::resource('footer-link', FooterLinkController::class);
    Route::get('second-col-footer-link', [FooterLinkController::class, 'secondColFooterLink'])->name('second-col-footer-link');
    Route::get('third-col-footer-link', [FooterLinkController::class, 'thirdColFooterLink'])->name('third-col-footer-link');
    Route::put('update-col-title/{id}', [FooterLinkController::class, 'updateColTitle'])->name('update-col-title');

    Route::resource('slider', SliderController::class);
    Route::put('slider-status/{id}',[SliderController::class,'changeStatus'])->name('slider-status');

    Route::resource('testimonial', TestimonialController::class);
    Route::put('testimonial-status/{id}', [TestimonialController::class,'changeStatus'])->name('template.status');

    Route::resource('template', TemplateController::class);
    Route::put('template-status/{id}', [TemplateController::class,'changeStatus'])->name('.status');

    Route::get('subscriber-section', [ContentController::class, 'subscriberSection'])->name('subscriber-section');
    Route::put('update-subscriber-section', [ContentController::class, 'updateSubscriberSection'])->name('update-subscriber-section');


    Route::get('how-it-work', [ContentController::class, 'howItWork'])->name('how-it-work');
    Route::put('update-how-it-work', [ContentController::class, 'updateHowItWork'])->name('home-update-how-it-work');

    Route::get('section-content', [ContentController::class, 'sectionContent'])->name('section-content');
    Route::put('update-section-content/{id}', [ContentController::class, 'updateSectionContent'])->name('update-section-content');

    Route::get('ad', [AdController::class, 'ad'])->name('ad');
    Route::put('update-ad', [AdController::class, 'updateAd'])->name('update-ad');

    Route::get('section-control', [ContentController::class, 'sectionControl'])->name('section-control');
    Route::put('update-section-control', [ContentController::class, 'updateSectionControl'])->name('update-section-control');

    Route::get('customer-list',[CustomerController::class,'index'])->name('customer-list');
    Route::get('customer-show/{id}',[CustomerController::class,'show'])->name('customer-show');
    Route::put('customer-status/{id}',[CustomerController::class,'changeStatus'])->name('customer-status');
    Route::delete('customer-delete/{id}',[CustomerController::class,'destroy'])->name('customer-delete');
    Route::get('pending-customer-list',[CustomerController::class,'pendingCustomerList'])->name('pending-customer-list');
    Route::get('send-email-to-all-customer',[CustomerController::class,'sendEmailToAllUser'])->name('send-email-to-all-customer');
    Route::post('send-mail-to-all-user',[CustomerController::class,'sendMailToAllUser'])->name('send-mail-to-all-user');
    Route::post('send-mail-to-single-user/{id}',[CustomerController::class,'sendMailToSingleUser'])->name('send-mail-to-single-user');

    Route::resource('withdraw-method', WithdrawMethodController::class);
    Route::put('withdraw-method-status/{id}',[WithdrawMethodController::class,'changeStatus'])->name('withdraw-method-status');

    Route::get('seller-withdraw', [ProviderWithdrawController::class, 'index'])->name('provider-withdraw');
    Route::get('pending-seller-withdraw', [ProviderWithdrawController::class, 'pendingProviderWithdraw'])->name('pending-provider-withdraw');

    Route::get('show-seller-withdraw/{id}', [ProviderWithdrawController::class, 'show'])->name('show-provider-withdraw');
    Route::delete('delete-seller-withdraw/{id}', [ProviderWithdrawController::class, 'destroy'])->name('delete-provider-withdraw');
    Route::put('approved-seller-withdraw/{id}', [ProviderWithdrawController::class, 'approvedWithdraw'])->name('approved-provider-withdraw');

    Route::get('payment-method',[PaymentMethodController::class,'index'])->name('payment-method');
    Route::put('update-paypal',[PaymentMethodController::class,'updatePaypal'])->name('update-paypal');
    Route::put('update-stripe',[PaymentMethodController::class,'updateStripe'])->name('update-stripe');
    Route::put('update-razorpay',[PaymentMethodController::class,'updateRazorpay'])->name('update-razorpay');
    Route::put('update-bank',[PaymentMethodController::class,'updateBank'])->name('update-bank');
    Route::put('update-mollie',[PaymentMethodController::class,'updateMollie'])->name('update-mollie');
    Route::put('update-paystack',[PaymentMethodController::class,'updatePayStack'])->name('update-paystack');
    Route::put('update-flutterwave',[PaymentMethodController::class,'updateflutterwave'])->name('update-flutterwave');
    Route::put('update-instamojo',[PaymentMethodController::class,'updateInstamojo'])->name('update-instamojo');
    Route::put('update-paymongo',[PaymentMethodController::class,'updatePaymongo'])->name('update-paymongo');
    Route::put('update-sslcommerz',[PaymentMethodController::class,'updateSslcommerz'])->name('update-sslcommerz');
    Route::put('update-cash-on-delivery',[PaymentMethodController::class,'updateCashOnDelivery'])->name('update-cash-on-delivery');

    Route::resource('partner', PartnerController::class);
    Route::put('partner-status/{id}', [PartnerController::class,'changeStatus'])->name('partner-status');

    Route::resource('category', CategoryController::class);
    Route::put('category-status/{id}', [CategoryController::class,'changeStatus'])->name('category.status');

    Route::resource('coupon', CouponController::class);
    Route::put('coupon-status/{id}', [CouponController::class,'changeStatus'])->name('coupon.status');

    Route::resource('currency', CurrencyController::class);
    Route::put('currency-status/{id}', [CurrencyController::class,'changeStatus'])->name('coupon.status');

    Route::resource('country', CountryController::class);
    Route::put('country-status/{id}',[CountryController::class,'changeStatus'])->name('country-status');


    Route::get('seller',[ProviderController::class, 'index'])->name('provider');
    Route::get('seller-show/{id}',[ProviderController::class,'show'])->name('provider-show');
    Route::put('provider-update/{id}',[ProviderController::class,'updateProvider'])->name('provider-update');
    Route::delete('provider-delete/{id}',[ProviderController::class,'destroy'])->name('provider-delete');
    Route::put('provider-status/{id}',[ProviderController::class,'changeStatus'])->name('provider-status');


    Route::get('send-email-to-all-provider',[ProviderController::class,'sendEmailToAllProvider'])->name('send-email-to-all-provider');
    Route::post('send-mail-to-all-provider',[ProviderController::class,'sendMailToAllProvider'])->name('send-mail-to-all-provider');
    Route::get('send-email-to-provider/{id}',[ProviderController::class,'sendEmailToProvider'])->name('send-email-to-provider');
    Route::post('send-mail-to-single-provider/{id}',[ProviderController::class,'sendMailtoSingleProvider'])->name('send-mail-to-single-provider');

    Route::get('default-avatar', [ContentController::class, 'defaultAvatar'])->name('default-avatar');
    Route::put('update-default-avatar', [ContentController::class, 'updateDefaultAvatar'])->name('update-default-avatar');


    Route::get('maintainance-mode',[ContentController::class,'maintainanceMode'])->name('maintainance-mode');
    Route::put('maintainance-mode-update',[ContentController::class,'maintainanceModeUpdate'])->name('maintainance-mode-update');

    Route::get('seo-setup',[ContentController::Class, 'seoSetup'])->name('seo-setup');
    Route::put('update-seo-setup/{id}',[ContentController::Class, 'updateSeoSetup'])->name('update-seo-setup');

    Route::get('all-booking', [OrderController::class, 'index'])->name('all-booking');
    Route::get('pending-order', [OrderController::class, 'pendingOrder'])->name('pending-order');
    Route::get('complete-order', [OrderController::class, 'completeOrder'])->name('complete-order');
    Route::get('active-booking', [OrderController::class, 'activeBooking'])->name('active-booking');
    Route::get('awaiting-booking', [OrderController::class, 'awaitingBooking'])->name('awaiting-booking');
    Route::get('completed-booking', [OrderController::class, 'completeBooking'])->name('completed-booking');
    Route::get('declined-booking', [OrderController::class, 'declineBooking'])->name('declined-booking');
    Route::put('booking-declined/{id}', [OrderController::class, 'bookingDecilendRequest'])->name('booking-declined');
    Route::put('booking-approved/{id}', [OrderController::class, 'bookingApprovedRequest'])->name('booking-approved');
    Route::put('payment-approved/{id}', [OrderController::class, 'paymentApproved'])->name('payment-approved');

    Route::put('booking-mark-as-complete/{id}', [OrderController::class, 'bookingCompleteRequest'])->name('booking-mark-as-complete');
    Route::get('complete-request', [OrderController::class, 'completeRequest'])->name('complete-request');

    Route::get('order-show/{id}', [OrderController::class, 'show'])->name('order-show');
    Route::delete('delete-order/{id}', [OrderController::class, 'destroy'])->name('delete-order');
    Route::put('update-order-status/{id}', [OrderController::class, 'updateOrderStatus'])->name('update-order-status');

    Route::get('reports', [OrderController::class, 'providerClientReport'])->name('reports');
    Route::delete('delete-client-provider-report/{id}', [OrderController::class, 'deleteProviderClientReport'])->name('delete-client-provider-report');


    Route::get('/', [DashboardController::class,'dashobard']);
    Route::get('dashboard', [DashboardController::class,'dashobard'])->name('dashboard');

    Route::get('clear-database',[SettingController::class,'showClearDatabasePage'])->name('clear-database');
    Route::delete('delete-clear-database',[SettingController::class,'clearDatabase'])->name('delete-clear-database');



    Route::get('why-choose-us', [HomepageController::class, 'why_choose_us'])->name('why-choose-us');
    Route::put('why-choose-us-update', [HomepageController::class, 'why_choose_us_update'])->name('why-choose-us-update');

    Route::get('mobile-app', [HomepageController::class, 'mobile_app'])->name('mobile-app');
    Route::put('update-mobile-app', [HomepageController::class, 'update_mobile_app'])->name('update-mobile-app');

    Route::get('counter', [HomepageController::class, 'counter'])->name('counter');
    Route::put('update-counter', [HomepageController::class, 'update_counter'])->name('update-counter');

    Route::get('offer', [HomepageController::class, 'offer'])->name('offer');
    Route::put('update-offer', [HomepageController::class, 'update_offer'])->name('update-offer');

    Route::get('trending-offer', [HomepageController::class, 'trending_offer'])->name('trending-offer');
    Route::put('update-trending-offer', [HomepageController::class, 'update_trending_offer'])->name('update-trending-offer');

    Route::resource('our-team', TeamController::class);
    Route::put('our-team-status/{id}',[TeamController::class,'changeStatus'])->name('our-team-status');


    Route::resource('product', ProductController::class);

    Route::resource('product-type', ProductItemController::class);

    Route::get('active-product', [ProductController::class, 'active_product'])->name('active.product');
    Route::get('pending-product', [ProductController::class, 'pending_product'])->name('pending.product');

    Route::get('topbar-offer', [ProductController::class, 'topbar_offer'])->name('topbar.offer');
    Route::post('update-topbar-offer', [ProductController::class, 'update_topbar_offer'])->name('update.topbar.offer');

    Route::get('package-content', [ProductController::class, 'package_content'])->name('package.content');
    Route::post('update-package-content', [ProductController::class, 'update_package_content'])->name('update.package.content');

    Route::resource('product-comment', ProductCommentController::class);
    Route::put('product-comment-status/{id}', [ProductCommentController::class,'changeStatus'])->name('product-comment.status');

    Route::resource('product-review', ProductReviewController::class);
    Route::put('product-review-status/{id}', [ProductReviewController::class,'changeStatus'])->name('product-review.status');

    Route::get('select-product-type', [ProductController::class, 'select_product_type'])->name('select-product-type');
    Route::post('store-image-type-product', [ProductController::class, 'store_image_type_product'])->name('store-image-type-product');
    Route::put('image-product-update/{id}', [ProductController::class, 'image_product_update'])->name('image-product-update');

    Route::get('product-variant/{product_id}', [ProductController::class, 'product_variant'])->name('product-variant');

    Route::post('store-product-variant/{product_id}', [ProductController::class, 'store_product_variant'])->name('store-product-variant');
    Route::put('update-product-variant/{variant_id}', [ProductController::class, 'update_product_variant'])->name('update-product-variant');
    Route::delete('delete-product-variant/{variant_id}', [ProductController::class, 'delete_product_variant'])->name('delete-product-variant');
    Route::get('download-existing-file/{file_name}', [ProductController::class, 'download_existing_file'])->name('download-existing-file');


    Route::get('download-existing-file/{file_name}', [ProductController::class, 'download_existing_file'])->name('download-existing-file');

    Route::get('languages', [LanguageController::class, 'languages'])->name('languages');
    Route::get('language-create', [LanguageController::class, 'create'])->name('language.create');
    Route::post('language-store', [LanguageController::class, 'store'])->name('language.store');
    Route::get('language-edit/{id}', [LanguageController::class, 'edit'])->name('language.edit');
    Route::put('language-update/{id}', [LanguageController::class, 'update'])->name('language.update');

    Route::delete('language-delete/{id}', [LanguageController::class, 'destroy'])->name('language-delete');

});

});


Route::get('/migrate', function(){
    Artisan::call('migrate');

    $setting = Setting::first();
    $setting->app_version = '1.1';
    $setting->save();

    $first_currency = MultiCurrency::first();
    if(!$first_currency){
        $currency = new MultiCurrency();
        $currency->currency_name = '$-USD';
        $currency->country_code = 'USD';
        $currency->currency_code = 'USD';
        $currency->currency_icon = '$';
        $currency->currency_rate = 1;
        $currency->is_default = 'Yes';
        $currency->currency_position = 'left';
        $currency->status = '1';
        $currency->save();
    }

    Artisan::call('optimize:clear');

    $notification = "You version has been updated successfully";
    $notification = array('messege' => $notification, 'alert-type' => 'success');
    return redirect()->route('home')->with($notification);
});
