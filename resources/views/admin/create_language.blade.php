@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Language create')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Create Language')}}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Create language')}}</div>
            </div>
          </div>

          <div class="section-body">
            <a href="{{ route('admin.languages') }}" class="btn btn-primary"><i class="fas fa-list"></i> {{__('admin.Languages')}}</a>
            <div class="row mt-4">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                        <form action="{{ route('admin.language.store') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="form-group col-12">
                                    <label>{{__('admin.Language Name')}} <span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="lang_name" value="{{ old('lang_name') }}">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{__('admin.Language Code')}} <span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="lang_code" value="{{ old('lang_code') }}">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{__('admin.Default')}} <span class="text-danger">*</span></label>
                                    <select name="is_default" class="form-control">
                                        <option value="No">{{__('admin.No')}}</option>
                                        <option value="Yes">{{__('admin.Yes')}}</option>
                                    </select>
                                </div>

                                <div class="form-group col-12">
                                    <label>{{__('admin.Language Direction')}} <span class="text-danger">*</span></label>
                                    <select name="lang_direction" class="form-control">
                                        <option value="left_to_right">{{__('admin.Left to Right')}}</option>
                                        <option value="right_to_left">{{__('admin.Right to left')}}</option>
                                    </select>
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
