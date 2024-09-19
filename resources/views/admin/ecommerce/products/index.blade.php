@extends('admin.layouts.app')
@section('page_title',__('Products'))
@section('content')
<div class="content container-fluid">
    <div class="page-header">
        <div class="row align-items-end">
            <div class="col-sm mb-2 mb-sm-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-no-gutter">
                        <li class="breadcrumb-item"><a class="breadcrumb-link"
                                href="javascript:void(0);">@lang('Dashboard')</a></li>
                        <li class="breadcrumb-item active" aria-current="page">@lang('Products')</li>
                    </ol>
                </nav>
                <h1 class="page-header-title">@lang('Products')</h1>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header card-header-content-md-between">
            <div class="mb-2 mb-md-0">

                <div class="input-group input-group-merge navbar-input-group">
                    <div class="input-group-prepend input-group-text">
                        <i class="bi-search"></i>
                    </div>
                    <input type="search" id="datatableSearch"
                        class="search form-control form-control-sm"
                        placeholder="@lang('Search products')"
                        aria-label="@lang('Search products')"
                        autocomplete="off">
                    <a class="input-group-append input-group-text display-none" href="javascript:void(0)">
                        <i id="clearSearchResultsIcon" class="bi-x"></i>
                    </a>
                </div>

            </div>

            <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2">
                <a href="<?= route('admin.ecommerce.product.create') ?>" class="btn btn-primary"><i class="fa-duotone fa-solid fa-plus me-1"></i>@lang('New Product')</a>
            </div>
        </div>

        <div class=" table-responsive datatable-custom  ">
            <table id="productsTable"
                class="js-datatable table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                data-hs-datatables-options='{
                       "columnDefs": [{
                          "targets": [0, 2],
                          "orderable": false
                        }],
                       "order": [],
                       "info": {
                         "totalQty": "#datatableWithPaginationInfoTotalQty"
                       },
                       "search": "#datatableSearch",
                       "entries": "#datatableEntries",
                       "pageLength": 15,
                       "isResponsive": false,
                       "isShowPaging": false,
                       "pagination": "datatablePagination"
                     }'>
                <thead class="thead-light">
                    <tr>
                        <th>@lang('Name')</th>
                        <th>@lang('SKU')</th>
                        <th>@lang('Stock')</th>
                        <th>@lang('Price')</th>
                        <th>@lang('Excerpt')</th>
                        <th>@lang('Status')</th>
                        <th class="w-100 d-flex justify-content-end">@lang('Action')</th>
                    </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>

        <div class="card-footer">
            <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                        <span class="me-2">@lang('Showing:')</span>
                        <!-- Select -->
                        <div class="tom-select-custom">
                            <select id="datatableEntries"
                                class="js-select form-select form-select-borderless w-auto" autocomplete="off"
                                data-hs-tom-select-options='{
                                            "searchInDropdown": false,
                                            "hideSearch": true
                                          }'>
                                <option value="10">10</option>
                                <option value="20" selected>20</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                            </select>
                        </div>
                        <span class="text-secondary me-2">@lang('of')</span>
                        <span id="datatableWithPaginationInfoTotalQty"></span>
                    </div>
                </div>


                <div class="col-sm-auto">
                    <div class="d-flex  justify-content-center justify-content-sm-end">
                        <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
    data-bs-backdrop="static"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="deleteModalLabel"><i
                        class="bi bi-check2-square"></i> @lang("Confirmation")</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="post" id="deleteForm">
                @csrf
                @method('DELETE')
                <div class="modal-body">
                    <p>@lang("Do you want to delete this Item")</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn-primary">@lang('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Delete Modal -->

@endsection



@push('css-lib')
<link rel="stylesheet" href="{{ asset('assets/admin/css/tom-select.bootstrap5.css') }}">
<link rel="stylesheet" href="{{ asset('assets/admin/css/flatpickr.min.css') }}">
@endpush


@push('js-lib')
<script src="{{ asset('assets/admin/js/tom-select.complete.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/flatpickr.min.js') }}"></script>
@endpush



@push('script')
<script>
    $(document).on('click', '.editBtn', function() {
        $('#editForm').attr('action', $(this).data('route'));
        $('#editFormInputName').val($(this).data('name'));
    })
    $(document).on('click', '.deleteBtn', function() {
        $('#deleteForm').attr('action', $(this).data('route'))
    })
    $(document).on('click', '.product_status', function() {
        let id = $(this).data('id');
        let state = $(this).data('state');
        axios.post('', {
                productId: id,
                requestType: 'changeState'
            }, {
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            })
            .then(function(response) {
                let statusSwitch = $('#product_id_' + id);
                if (response.data.success) {
                    if (response.data.state == 'active') {
                        $(statusSwitch).attr('checked', true);
                    } else {
                        $(statusSwitch).removeAttr('checked');
                    }
                    Notiflix.Notify.success('Product status updated successfully');
                } else {
                    if (state == 'active') {
                        $(statusSwitch).attr('checked', true);
                    } else {
                        $(statusSwitch).removeAttr('checked');
                    }
                    Notiflix.Notify.failure('Unable to change the status');
                }
            })
            .catch(function(error) {
                console.log(error);
                if (state == 'active') {
                    $(statusSwitch).attr('checked', true);
                } else {
                    $(statusSwitch).removeAttr('checked');
                }
                Notiflix.Notify.failure('Unable to change the status');
            });

    })
    $(document).on('ready', function() {
        HSCore.components.HSTomSelect.init('.js-select', {
            maxOptions: 250,
        })
        HSCore.components.HSDatatables.init($('#productsTable'), {
            processing: true,
            serverSide: true,
            ordering: false,
            ajax: {
                url: "<?= route("admin.ecommerce.product.list") ?>",
            },

            columns: [{
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'sku',
                    name: 'sku'
                },
                {
                    data: 'stock',
                    name: 'stock'
                },
                {
                    data: 'price',
                    name: 'price'
                },
                {
                    data: 'excerpt',
                    name: 'excerpt'
                },
                {
                    data: 'state',
                    name: 'state'
                },
                {
                    data: 'action',
                    name: 'action',
                    className: 'w-100 d-flex justify-content-end'
                },
            ],

            language: {
                zeroRecords: `<div class="text-center p-4">
                    <img class="dataTables-image mb-3" src="{{ asset('assets/admin/img/oc-error.svg') }}" alt="Image Description" data-hs-theme-appearance="default">
                    <img class="dataTables-image mb-3" src="{{ asset('assets/admin/img/oc-error-light.svg') }}" alt="Image Description" data-hs-theme-appearance="dark">
                    <p class="mb-0">No data to show</p>
                    </div>`,
                processing: `<div><div></div><div></div><div></div><div></div></div>`
            },
        });

        $.fn.dataTable.ext.errMode = 'throw';
    });
</script>
@endpush

@push('css')
<style>
    .maximum-two-lines {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }
</style>
@endpush
