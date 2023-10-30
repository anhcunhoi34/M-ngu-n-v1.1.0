@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Language')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Language')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Language')}}</div>
            </div>
          </div>

          <div class="section-body">
            <a href="{{ route('admin.language.create') }}" class="btn btn-primary"><i class="fas fa-plus"></i> {{__('admin.Add New')}}</a>
            <div class="row mt-4">
                <div class="col">
                  <div class="card">
                    <div class="card-body">
                      <div class="table-responsive table-invoice">
                        <table class="table table-striped" id="dataTable">
                            <thead>
                                <tr>
                                    <th>{{__('admin.SN')}}</th>
                                    <th>{{__('admin.Name')}}</th>

                                    <th>{{__('admin.Language Code')}}</th>
                                    <th>{{__('admin.Language Direction')}}</th>
                                    <th>{{__('admin.Default')}}</th>
                                    <th>{{__('admin.Status')}}</th>
                                    <th>{{__('admin.Action')}}</th>
                                  </tr>
                            </thead>
                            <tbody>
                                @foreach ($languages as $index => $language)
                                    <tr>
                                        <td>{{ ++$index }}</td>
                                        <td>{{ $language->lang_name }}</td>

                                        <td>{{ $language->lang_code }}</td>

                                        <td>
                                            @if ($language->lang_direction == 'left_to_right')
                                                <span>{{__('admin.Left to Right')}}</span>
                                            @else
                                                <span>{{__('admin.Right to Left')}}</span>
                                            @endif
                                        </td>

                                        <td>
                                            @if ($language->is_default == 'Yes')
                                                <span class="badge badge-success">{{__('admin.Yes')}}</span>
                                            @else
                                            <span class="badge badge-danger">{{__('admin.No')}}</span>
                                            @endif
                                        </td>
                                        
                                        <td>
                                            @if ($language->status == 1)
                                                <span class="badge badge-success">{{__('admin.Active')}}</span>
                                            @else
                                            <span class="badge badge-danger">{{__('admin.In-active')}}</span>
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ route('admin.language.edit',$language->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                            @if ($language->id != 1)
                                                @if ($language->is_default == 'Yes')
                                                <a href="javascript:;" data-toggle="modal" data-target="#canNotDeleteModal" class="btn btn-danger btn-sm" onclick="deleteData({{ $language->id }})"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                @else
                                                <a href="javascript:;" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-sm" onclick="deleteData({{ $language->id }})" disabled><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                @endif
                                            @endif
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
                          {{__('admin.You can not delete default language')}}
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
        $("#deleteForm").attr("action",'{{ url("admin/language-delete/") }}'+"/"+id)
    }
    function changeProductCategoryStatus(id){
        var isDemo = "{{ env('APP_MODE') }}"
        if(isDemo == 'DEMO'){
            toastr.error('This Is Demo Version. You Can Not Change Anything');
            return;
        }
        $.ajax({
            type:"put",
            data: { _token : '{{ csrf_token() }}' },
            url:"{{url('/admin/category-status/')}}"+"/"+id,
            success:function(response){
                toastr.success(response)
            },
            error:function(err){


            }
        })
    }
</script>
@endsection
