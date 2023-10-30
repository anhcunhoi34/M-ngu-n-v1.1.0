@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Popular Tag')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Popular Tag')}}</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{__('admin.Dashboard')}}</a></div>
              <div class="breadcrumb-item">{{__('admin.Popular Tag')}}</div>
            </div>
          </div>


        <div class="section-body">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('admin.popular-tags.store') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="">{{__('admin.Tag')}}</label>
                                <input type="text" class="form-control" name="tag_name">
                            </div>
                            <button class="btn btn-primary">{{__('admin.Save')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

          <div class="section-body">
                <div class="col">
                  <div class="card">
                    <div class="card-body">
                      <div class="table-responsive table-invoice">
                        <table class="table table-striped" id="dataTable">
                            <thead>
                                <tr>
                                    <th width="5%">{{__('admin.SN')}}</th>
                                    <th width="30%">{{__('admin.Tag Name')}}</th>
                                    <th width="15%">{{__('admin.Action')}}</th>
                                  </tr>
                            </thead>
                            <tbody>
                                @foreach ($popularTags as $index => $popularTag)
                                    <tr>
                                        <td>{{ ++$index }}</td>
                                        <td>{{ $popularTag->tag_name }}</td>
                                        <td>
                                        <a href="javascript:;" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-sm" onclick="deleteData({{ $popularTag->id }})"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
        $("#deleteForm").attr("action",'{{ url("admin/popular-tags/") }}'+"/"+id)
    }
    function changePopularBlogStatus(id){
        var isDemo = "{{ env('APP_MODE') }}"
        if(isDemo == 'DEMO'){
            toastr.error('This Is Demo Version. You Can Not Change Anything');
            return;
        }
        $.ajax({
            type:"put",
            data: { _token : '{{ csrf_token() }}' },
            url:"{{url('/admin/popular-blog-status/')}}"+"/"+id,
            success:function(response){
                toastr.success(response)
            },
            error:function(err){


            }
        })
    }
</script>
@endsection
