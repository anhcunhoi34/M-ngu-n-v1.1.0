@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Coupons')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Coupon')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Coupon')}}</div>
            </div>
          </div>

          <div class="section-body">
            <a href="{{ route('admin.coupon.create') }}" class="btn btn-primary"><i class="fas fa-plus"></i> {{__('admin.Add New')}}</a>
            <div class="row mt-4">
                <div class="col">
                  <div class="card">
                    <div class="card-body">
                      <div class="table-responsive table-invoice">
                        <table class="table table-striped" id="dataTable">
                            <thead>
                                <tr>
                                    <th>{{__('admin.SN')}}</th>
                                    <th>{{__('admin.Coupons name')}}</th>
                                    <th>{{__('admin.Coupon discount')}}</th>
                                    <th>{{__('admin.Coupon validity')}}</th>
                                    <th>{{__('admin.Validity')}}</th>
                                    <th>{{__('admin.Status')}}</th>
                                    <th>{{__('admin.Action')}}</th>
                                  </tr>
                            </thead>
                            <tbody>
                                @foreach ($coupons as $index => $coupon)
                                    <tr>
                                        <td>{{ ++$index }}</td>
                                        <td>{{ $coupon->coupon_name }}</td>
                                        <td>{{ $coupon->coupon_discount }}%</td>
                                        
                                        <td>{{ $coupon->coupon_validity }}</td>
                                        <td>
                                            @if ($coupon->coupon_validity < Carbon\Carbon::now()->format('Y-m-d'))
                                                <span class="badge badge-pill badge-danger">Invalid</span>
                                            @else
                                                <span class="badge badge-pill badge-primary">Valid</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if($coupon->status == 1)
                                            <a href="javascript:;" onclick="changeCouponStatus({{ $coupon->id }})">
                                                <input id="status_toggle" type="checkbox" checked data-toggle="toggle" data-on="{{__('admin.Active')}}" data-off="{{__('admin.Inactive')}}" data-onstyle="success" data-offstyle="danger">
                                            </a>

                                            @else
                                            <a href="javascript:;" onclick="changeCouponStatus({{ $coupon->id }})">
                                                <input id="status_toggle" type="checkbox" data-toggle="toggle" data-on="{{__('admin.Active')}}" data-off="{{__('admin.Inactive')}}" data-onstyle="success" data-offstyle="danger">
                                            </a>

                                            @endif
                                        </td>
                                        <td>
                                        <a href="{{ route('admin.coupon.edit',$coupon->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit" aria-hidden="true"></i></a>

                                        <a href="javascript:;" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-sm" onclick="deleteData({{ $coupon->id }})"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                       
                                    </td>

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
      </div>

      <!-- Modal -->
      <div class="modal fade" id="canNotDeleteModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                      <div class="modal-body">
                          {{__('admin.You can not delete this category. Because there are one or more services has been created in this category.')}}
                      </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">{{__('admin.Close')}}</button>
                </div>
            </div>
        </div>
    </div>

<script>
    "use strict";
    function deleteData(id){
        $("#deleteForm").attr("action",'{{ url("admin/coupon/") }}'+"/"+id)
    }
    function changeCouponStatus(id){
        var isDemo = "{{ env('APP_MODE') }}"
        if(isDemo == 'DEMO'){
            toastr.error('This Is Demo Version. You Can Not Change Anything');
            return;
        }
        $.ajax({
            type:"put",
            data: { _token : '{{ csrf_token() }}' },
            url:"{{url('/admin/coupon-status/')}}"+"/"+id,
            success:function(response){
                toastr.success(response)
            },
            error:function(err){

            }
        })
    }
</script>
@endsection
