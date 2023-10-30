@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Coupon')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Create Coupon')}}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Create coupon')}}</div>
            </div>
          </div>

          <div class="section-body">
            <a href="{{ route('admin.coupon.index') }}" class="btn btn-primary"><i class="fas fa-list"></i> {{__('admin.Coupon')}}</a>
            <div class="row mt-4">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                        <form action="{{ route('admin.coupon.store') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="form-group col-12">
                                    <label>{{__('admin.Coupon name')}} <span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="coupon_name" value="{{ old('coupon_name') }}">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{__('admin.Coupon discount')}}(%) <span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="coupon_discount" value="{{ old('coupon_discount') }}">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{__('admin.Coupon validity')}} <span class="text-danger">*</span></label>
                                    <input class="form-control" type="date" name="coupon_validity" min="{{ Carbon\Carbon::now()->format('Y-m-d') }}">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{__('admin.Status')}} <span class="text-danger">*</span></label>
                                    <select name="status" class="form-control">
                                        <option value="1">{{__('admin.Active')}}</option>
                                        <option value="0">{{__('admin.Inactive')}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <button class="btn btn-primary">{{__('admin.Save')}}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>
          </div>
        </section>
      </div>
@endsection
