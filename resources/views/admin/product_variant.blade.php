@extends('admin.master_layout')
@section('title')
<title>{{__('admin.Edit Product')}}</title>
@endsection
@section('admin-content')
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>{{__('admin.Edit Product')}}</h1>
          </div>

          <div class="section-body">
            <div class="row">
              <div class="col-md-3">
                <div class="card">
                  <div class="card-body">
                    <ul class="nav nav-pills flex-column">
                      <li class="nav-item"><a href="{{ route('admin.product.edit',['product' => $product->id, 'lang_code' => 'en']) }}" class="nav-link">{{__('admin.Basic Information')}}</a></li>

                      <li class="nav-item"><a href="{{ route('admin.product-variant', $product->id) }}" class="nav-link active">{{__('admin.Variant and price')}}</a></li>

                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-9">
                  <div class="card" id="settings-card">
                    <div class="card-header">
                      <h4>{{__('admin.Variant and price')}}</h4>

                      <button class="btn btn-primary variant-btn" data-toggle="modal" data-target="#addNewVariant"><i class="fa fa-plus" aria-hidden="true"></i> {{__('admin.Add new variant')}}</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>{{__('admin.Variant')}}</th>
                                    <th>{{__('admin.Price')}}</th>
                                    <th>{{__('admin.Action')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($product_variants as $product_variant)
                                    <tr>
                                        <td>{{ html_decode($product_variant->variant_name) }}</td>
                                        <td>{{ $setting->currency_icon }}{{ html_decode($product_variant->price) }}</td>
                                        <td>
                                            <a href="{{ route('admin.download-existing-file', $product_variant->file_name) }}" class="btn btn-success btn-sm"> <i class="fas fa-download"></i> </a>
                                            <a href="javascript:;" data-toggle="modal" data-target="#editVariant-{{ $product_variant->id }}" class="btn btn-primary btn-sm"> <i class="fas fa-edit"></i> </a>

                                            <a data-toggle="modal" data-target="#deleteModal" href="javascript:;" class="btn btn-danger btn-sm" onclick="deleteData({{ $product_variant->id }})"> <i class="fas fa-trash"></i> </a>
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
      <div class="modal fade" id="addNewVariant" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title">{{__('admin.Create new variant')}}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form action="{{ route('admin.store-product-variant', $product->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group">
                                <label for="">{{__('admin.Variant name')}} <span class="text-danger">*</span></label>
                                <input type="text" name="variant_name" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="">{{__('admin.Price')}} <span class="text-danger">*</span></label>
                                <input type="text" name="price" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="">{{__('admin.Upload file')}} <span class="text-danger">*</span></label>
                                <input type="file" name="file_name" class="form-control" accept=".zip">
                            </div>

                            <button class="btn btn-primary">{{__('admin.Save')}}</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
      </div>

    @foreach ($product_variants as $product_variant)
    <div class="modal fade" id="editVariant-{{ $product_variant->id }}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title">{{__('admin.Edit variant')}}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form action="{{ route('admin.update-product-variant', $product_variant->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="form-group">
                                <label for="">{{__('admin.Variant name')}} <span class="text-danger">*</span></label>
                                <input type="text" name="variant_name" class="form-control" value="{{ html_decode($product_variant->variant_name) }}">
                            </div>

                            <div class="form-group">
                                <label for="">{{__('admin.Price')}} <span class="text-danger">*</span></label>
                                <input type="text" name="price" class="form-control" value="{{ html_decode($product_variant->price) }}">
                            </div>

                            <div class="form-group">
                                <label for="">{{__('admin.Upload file')}}</label>
                                <input type="file" name="file_name" class="form-control" accept=".zip">
                            </div>

                            <button class="btn btn-primary">{{__('admin.Update')}}</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
      </div>
    @endforeach


<script>
    "use strict";
    function deleteData(id){
        $("#deleteForm").attr("action",'{{ url("admin/delete-product-variant/") }}'+"/"+id)
    }

</script>
@endsection
