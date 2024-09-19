@extends('admin.layouts.app')
@section('page_title', __('New Product'))
@section('content')
<div class="content container-fluid">
    <div class="page-header">
        <div class="row align-items-end">
            <div class="col-sm mb-2 mb-sm-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-no-gutter">
                        <li class="breadcrumb-item"><a class="breadcrumb-link"
                                href="javascript:void(0);">@lang('Dashboard')</a></li>
                        <li class="breadcrumb-item active" aria-current="page">@lang('Ecommerce')</li>
                        <li class="breadcrumb-item active" aria-current="page">@lang('Products')</li>
                        <li class="breadcrumb-item active" aria-current="page">@lang('Create Product')</li>
                    </ol>
                </nav>
                <h1 class="page-header-title">@lang('Create Product')</h1>
            </div>
        </div>
    </div>

    <form action="{{ route('admin.ecommerce.product.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-md-8">
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">@lang('Product Information')</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-4">
                                    <label for="ProductName" class="form-label">@lang('Name')</label>
                                    <input type="text" class="form-control @error('name') is-invalid @enderror"
                                        value="{{ old('name') }}" name="name" id="ProductName"
                                        placeholder="e.g : Maxi Baxi 2000">
                                    @error('name')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mb-4">
                                    <label for="project_sku" class="form-label">@lang('SKU')</label>
                                    <input type="text" class="form-control @error('sku') is-invalid @enderror"
                                        value="{{ old('sku') }}" id="project_sku" name="sku"
                                        placeholder="e.g : MXB-2000">
                                    @error('sku')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>


                            <div class="col-md-6" id="price_field">
                                <label for="price" class="form-label">@lang('Price')</label>
                                <div class="input-group mb-4">
                                    <input type="number"
                                        class="form-control @error('price') is-invalid @enderror"
                                        value="{{ old('price') }}" id="price"
                                        name="price" placeholder="e.g : 15000" step="1">
                                    <span class="input-group-text"
                                        id="priceCurrency">{{ basicControl()->currency_symbol }}</span>
                                    @error('price')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="TotalStock" class="form-label">@lang('Total Stock')</label>
                                <div class="mb-4">
                                    <input type="number"
                                        class="form-control @error('stock') is-invalid @enderror"
                                        value="{{ old('stock') }}" id="TotalStock" name="stock"
                                        placeholder="e.g : 500">
                                    @error('stock')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="taxonomy_id" class="form-label">@lang('Category')</label>
                                <div class="input-group mb-4">
                                    <!-- Select -->
                                    <div class="tom-select-custom w-100">
                                        <select class="js-select form-select" name="taxonomy_id" required
                                            id="taxonomy_id" autocomplete="off"
                                            data-hs-tom-select-options='{
                                                  "hideSearch": false,
                                                  "placeholder": "Select Category"
                                             }'>
                                            <option value=""></option>
                                            @foreach($taxonomies as $taxonomy)
                                            <option value="{{ $taxonomy->id }}" @selected(old('taxonomy_id')==$taxonomy->id)>
                                                {{ $taxonomy->name }}
                                            </option>
                                            @endforeach


                                        </select>
                                    </div>
                                    <!-- End Select -->
                                    @error('taxonomy_id')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="taxon_id" class="form-label">@lang('Sub Category')</label>
                                <div class="input-group mb-4">
                                    <!-- Select -->
                                    <div class="tom-select-custom w-100">
                                        <select class="js-select form-select" name="taxon_id" required
                                            id="taxon_id" autocomplete="off"
                                            data-hs-tom-select-options='{
                                                  "hideSearch": false,
                                                  "placeholder": "Select Category",
                                                  "valueField": "id",
                                                  "labelField": "title",
                                                  "searchField": "title",
                                                  "create": false
                                             }'>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                    <!-- End Select -->
                                    @error('taxon_id')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Body -->
                </div>
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">@lang('Product Dimensions')</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">

                            <div class="col-md-6" id="weight_field">
                                <label for="weight" class="form-label">@lang('Weight (optional)')</label>
                                <div class="input-group mb-4">
                                    <input type="number"
                                        class="form-control @error('weight') is-invalid @enderror"
                                        value="{{ old('weight') }}" id="weight"
                                        name="weight" placeholder="e.g : 200" step="1">
                                    <span class="input-group-text"
                                        id="weightType" title="Weight in Grams">GM</span>
                                    @error('weight')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6" id="width_field">
                                <label for="width" class="form-label">@lang('Width (optional)')</label>
                                <div class="input-group mb-4">
                                    <input type="number"
                                        class="form-control @error('width') is-invalid @enderror"
                                        value="{{ old('width') }}" id="width"
                                        name="width" placeholder="e.g : 27" step="1">
                                    <span class="input-group-text"
                                        id="widthType" title="Width in Centimeters">CM</span>
                                    @error('width')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6" id="height_field">
                                <label for="height" class="form-label">@lang('Height (optional)')</label>
                                <div class="input-group mb-4">
                                    <input type="number"
                                        class="form-control @error('height') is-invalid @enderror"
                                        value="{{ old('height') }}" id="height"
                                        name="height" placeholder="e.g : 21" step="1">
                                    <span class="input-group-text"
                                        id="heightType" title="Height in Centimeters">CM</span>
                                    @error('height')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6" id="length_field">
                                <label for="length" class="form-label">@lang('Length (optional)')</label>
                                <div class="input-group mb-4">
                                    <input type="number"
                                        class="form-control @error('length') is-invalid @enderror"
                                        value="{{ old('length') }}" id="length"
                                        name="length" placeholder="e.g : 60" step="1">
                                    <span class="input-group-text"
                                        id="lengthType" title="Length in Centimeters">CM</span>
                                    @error('length')
                                    <span class="invalid-feedback d-block">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Body -->
                </div>

                <div class="card mb-5">
                    <div class="card-header">
                        <h5 class="card-header-title">@lang('Short Description')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <textarea class="summernote" name="excerpt">
                                    @if (old('excerpt'))
                                        {{ old('excerpt') }}
                                    @else
                                        @if (env('APP_ENV') == 'local')
                                            Lorem ipsum odor amet, consectetuer adipiscing elit. Nec felis euismod cursus sapien cursus nec conubia duis. Primis enim sit nulla duis congue mattis aliquet curae.
                                        @endif
                                    @endif
                                </textarea>
                                @error('excerpt')
                                <span class="invalid-feedback d-block">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card  mb-5">
                    <div class="card-header">
                        <h5 class="card-header-title">@lang('Description')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <textarea class="summernote" name="description">
                                    @if (old('description'))
                                        {{ old('description') }}
                                    @else
                                        @if (env('APP_ENV') == 'local')
                                        <p>Lorem ipsum odor amet, consectetuer adipiscing elit. Nec felis euismod cursus sapien cursus nec conubia duis. Primis enim sit nulla duis congue mattis aliquet curae. Nunc molestie aliquet aptent purus nisl platea dui varius. Natoque eleifend vitae pulvinar erat pulvinar nam. Erat porttitor in ipsum elit curae, eget feugiat sed. Posuere pellentesque purus natoque netus hac mauris lacus. Fusce lacinia risus condimentum; vehicula at lacus. Euismod feugiat laoreet dignissim senectus ornare.</p>
                                        <p>Dolor pellentesque lobortis; laoreet accumsan luctus urna faucibus. Ac nascetur dolor ridiculus pharetra nisi tristique leo volutpat. Dolor habitant tincidunt potenti curabitur eros amet. Varius ac congue ipsum rhoncus ante magna nullam. Molestie mattis est ex morbi conubia viverra. Pretium ligula fermentum risus elementum elit efficitur. Lectus praesent enim molestie metus morbi elit cras urna. Vivamus dictumst magna nec tincidunt placerat. Litora ligula eros elit risus dolor.</p>
                                        <p>Commodo ac tristique placerat mauris egestas; aliquet hac. Imperdiet pellentesque arcu nascetur maecenas nostra mollis. Quis litora hac, ligula accumsan vel tempor per. Cubilia scelerisque vulputate est nunc quis vestibulum. Dictum magnis fermentum aptent pretium euismod tincidunt praesent efficitur in. Fringilla tortor enim fusce metus cubilia? Euismod ac tincidunt rutrum ac lacinia eget condimentum. Odio senectus ut molestie posuere quis cubilia. Dignissim netus nulla elementum pretium pellentesque.</p>
                                        @endif
                                    @endif
                                </textarea>
                                @error('description')
                                <span class="invalid-feedback d-block">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-5 ">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">@lang('Thumbnail')</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="col-12">
                            <label class="form-check form-check-dashed" for="logoUploader" id="content_img">
                                <img id="contentImg" class="avatar avatar-xl avatar-4x3 avatar-centered h-100 mb-2"
                                    src="{{ asset('assets/admin/img/oc-browse-file-light.svg') }}"
                                    alt="Description" data-hs-theme-appearance="default">
                                <img id="contentImg" class="avatar avatar-xl avatar-4x3 avatar-centered h-100 mb-2"
                                    src="{{ asset('assets/admin/img/oc-browse-file.svg') }}" alt="Description"
                                    data-hs-theme-appearance="dark">
                                <span class="d-block">@lang('Browse your file here')</span>
                                <input type="file" name="thumbnail[]" class="js-file-attach form-check-input"
                                    id="logoUploader"
                                    data-hs-file-attach-options='{
                                                                      "textTarget": "#contentImg",
                                                                      "mode": "image",
                                                                      "targetAttr": "src",
                                                                      "allowTypes": [".png", ".jpeg", ".jpg"]
                                                                   }'>
                            </label>
                            @error('image')
                            <span class="invalid-feedback d-block" role="alert">
                                {{ $message }}
                            </span>
                            @enderror
                        </div>

                        @error('images')
                        <span class="invalid-feedback d-block" role="alert">
                            {{ $message }}
                        </span>
                        @enderror
                    </div>

                    <!-- Body -->
                </div>

                <div class="card mb-3 mb-lg-5 ">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">@lang('Images')</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="input-field">
                            <div class="input-images-1"></div>
                        </div>

                        @error('images')
                        <span class="invalid-feedback d-block" role="alert">
                            {{ $message }}
                        </span>
                        @enderror
                    </div>

                    <!-- Body -->
                </div>

            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-white">
                        <h4 class="card-header-title">@lang('Publish')</h4>
                    </div>
                    <div class="card-body">
                        <div>
                            <button class="btn btn-primary mb-3" type="submit" name="status"
                                value="active">@lang('Save & Publish')</button>
                            <button class="btn btn-info ms-3 mb-3" type="submit" name="status"
                                value="draft">@lang('Save & Draft')</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
@endsection
@push('css-lib')
<link rel="stylesheet" href="{{ asset('assets/admin/css/tom-select.bootstrap5.css') }}">
<link rel="stylesheet" href="{{ asset('assets/admin/css/summernote-bs5.min.css') }}">
<link rel="stylesheet" href="{{ asset('assets/admin/css/image-uploader.css') }}">
@endpush
@push('js-lib')
<script src="{{ asset('assets/admin/js/tom-select.complete.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/hs-file-attach.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/summernote-bs5.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/image-uploader.js') }}"></script>
@endpush
@push('script')
<script>
    (function() {
        // INITIALIZATION OF SELECT
        // =======================================================
        HSCore.components.HSTomSelect.init('.js-select')
    })();
    $(document).ready(function() {
        $('.input-images-1').imageUploader();
        $('.summernote').summernote({
            height: 200,
            callbacks: {
                onBlurCodeview: function() {
                    let codeviewHtml = $(this).siblings('div.note-editor').find('.note-codable')
                        .val();
                    $(this).val(codeviewHtml);
                }
            }
        });


        // $(document).on('change', '#taxonomy_id', function() {
        //     let taxon_id = document.getElementById('taxon_id');
        //     let control = taxon_id.tomselect;
        //     control.clear();
        //     control.clearOptions();

        //     console.log('taxonomy_id: ', $(this).val());
        //     axios.post('', {
        //             taxonomy_id: $(this).val()
        //         }, {
        //             headers: {
        //                 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        //             }
        //         })
        //         .then(function(response) {
        //             let taxon_id = document.getElementById('taxon_id');
        //             let control = taxon_id.tomselect;
        //             if (response.data.success) {
        //                 response.data.data.forEach(taxon => {
        //                     control.addOption({
        //                         id: taxon.id,
        //                         text: taxon.name
        //                     });
        //                 });
        //                 control.clear();
        //                 control.refreshItems();
        //             }
        //             console.log(response);
        //         })
        //         .catch(function(error) {
        //             console.log(error);
        //         });
        // })
    })
</script>
@endpush



@push('css')
<style>
    .image-uploader {
        height: 15rem;
        border: .125rem dashed rgba(231, 234, 243, .7);
        border-radius: 10px;
        position: relative;
        overflow: auto;
    }

    .input-images-1 {
        padding-top: .5rem !important;
    }
</style>
@endpush
