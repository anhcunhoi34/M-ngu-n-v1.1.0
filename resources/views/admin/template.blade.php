@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Template')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Template')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Template')}}</div>
            </div>
          </div>

          <div class="section-body">
            <div class="row mt-4">
                <div class="col">
                  <div class="card">
                    <div class="card-body">
                      <div class="table-responsive table-invoice">
                        <table class="table table-striped" id="dataTable">
                            <thead>
                                <tr>
                                    <th>{{__('admin.SN')}}</th>
                                    <th>{{__('admin.Title')}}</th>
                                    <th>{{__('admin.Icon')}}</th>
                                    <th>{{__('admin.Action')}}</th>
                                  </tr>
                            </thead>
                            <tbody>
                                @foreach ($templates as $index => $template)
                                    <tr>
                                        <td>{{ ++$index }}</td>
                                        <td>{{ $template->templatelangadmin->title }}</td>
                                        <td><img src="{{ asset($template->image) }}" alt="" class="rounded-circle"></td>
                                        <td>
                                            <a href="{{ route('admin.template.edit', ['template' => $template->id, 'lang_code' => 'en']) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit" aria-hidden="true"></i></a>
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

<script>
  "use strict";
    function deleteData(id){
        $("#deleteForm").attr("action",'{{ url("admin/template/") }}'+"/"+id)
    }
    function changeFeatureStatus(id){
        var isDemo = "{{ env('APP_MODE') }}"
        if(isDemo == 'DEMO'){
            toastr.error('This Is Demo Version. You Can Not Change Anything');
            return;
        }
        $.ajax({
            type:"put",
            data: { _token : '{{ csrf_token() }}' },
            url:"{{url('/admin/template-status/')}}"+"/"+id,
            success:function(response){
                toastr.success(response)
            },
            error:function(err){

            }
        })
    }
</script>
@endsection
