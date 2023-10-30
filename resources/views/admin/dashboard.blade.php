@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Dashboard')}}</title>
@endsection
@section('admin-content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
      <div class="section-header">
        <h1>{{__('admin.Dashboard')}}</h1>
      </div>

      <div class="section-body">
        <div class="row">
            <div class="col-12">
                <h4 class="dashboard_title">{{__('admin.Today')}}</h4>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Total Order')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $today_total_order }}
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.New product')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $today_total_product }}
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Panding product')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $today_pending_product }}
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Product approved')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $today_approved_product }}
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Total Earnings')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $currency_icon->icon }}{{ $today_total_earning }}
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Withdraw Request')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $currency_icon->icon }}{{ $today_withdraw_request }}
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-undo"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Withdraw approved')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $currency_icon->icon }}{{ $today_withdraw_approved }}
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-users"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.New User')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $today_users }}
                  </div>
                </div>
              </div>
            </div>


            <div class="col-12">
                <h4 class="dashboard_title">{{__('admin.This Month')}}</h4>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                    <h4>{{__('admin.Total Order')}}</h4>
                    </div>
                    <div class="card-body">
                    {{ $monthly_total_order }}
                    </div>
                </div>
                </div>
            </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $monthly_total_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Panding product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $monthly_pending_product }}
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Product approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $monthly_approved_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Total Earnings')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $monthly_total_earning }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw Request')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $monthly_withdraw_request }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-undo"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $monthly_withdraw_approved }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-users"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New User')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $monthly_users }}
                    </div>
                  </div>
                </div>
              </div>

            <div class="col-12">
                <h4 class="dashboard_title">{{__('admin.This Year')}}</h4>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>{{__('admin.Total Order')}}</h4>
                  </div>
                  <div class="card-body">
                    {{ $yearly_total_order }}
                  </div>
                </div>
                </div>
            </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $yearly_total_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Panding product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $yearly_pending_product }}
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Product approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $yearly_approved_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-danger">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Total Earnings')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $yearly_total_earning }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-danger">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw Request')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $yearly_withdraw_request }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-danger">
                    <i class="fas fa-undo"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $yearly_withdraw_approved }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-danger">
                    <i class="fas fa-users"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New User')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $yearly_users }}
                    </div>
                  </div>
                </div>
              </div>

            <div class="col-12">
                <h4 class="dashboard_title">{{__('admin.Total')}}</h4>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                    <h4>{{__('admin.Total Order')}}</h4>
                    </div>
                    <div class="card-body">
                    {{ $total_total_order }}
                    </div>
                </div>
                </div>
            </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_total_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Panding product')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_pending_product }}
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-primary">
                    <i class="fas fa-shopping-cart"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Product approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_approved_product }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-success">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Total Earnings')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $total_total_earning }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-success">
                    <i class="fas fa-dollar-sign"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw Request')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $total_withdraw_request }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-success">
                    <i class="fas fa-undo"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Withdraw approved')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $currency_icon->icon }}{{ $total_withdraw_approved }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-success">
                    <i class="fas fa-users"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.New User/New Seller')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_users }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-users"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Sellers')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_sellers }}
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-users"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Client')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_clients }}
                    </div>
                  </div>
                </div>
              </div>



              <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                  <div class="card-icon bg-warning">
                    <i class="fas fa-th-large"></i>
                  </div>
                  <div class="card-wrap">
                    <div class="card-header">
                      <h4>{{__('admin.Blog')}}</h4>
                    </div>
                    <div class="card-body">
                      {{ $total_blog }}
                    </div>
                  </div>
                </div>
              </div>
          </div>
      </div>

    </section>
  </div>

@endsection
