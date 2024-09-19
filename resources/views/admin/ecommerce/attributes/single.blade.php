@extends('admin.layouts.app')
@section('page_title', $taxonomy->name)
@section('content')
<div class="content container-fluid">
    <div class="page-header">
        <div class="row align-items-end">
            <div class="col-sm mb-2 mb-sm-0">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-no-gutter">
                        <li class="breadcrumb-item"><a class="breadcrumb-link"
                                href="javascript:void(0);">@lang('Dashboard')</a></li>
                        <li class="breadcrumb-item active" aria-current="page">@lang('Attributes')</li>
                        <li class="breadcrumb-item active" aria-current="page">@lang($taxonomy->name)</li>
                    </ol>
                </nav>
                <h1 class="page-header-title">@lang($taxonomy->name)</h1>
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
                        placeholder="@lang('Search attributes')"
                        aria-label="@lang('Search attributes')"
                        autocomplete="off">
                    <a class="input-group-append input-group-text display-none" href="javascript:void(0)">
                        <i id="clearSearchResultsIcon" class="bi-x"></i>
                    </a>
                </div>

            </div>

            <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2">
                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#newModal" class="btn btn-primary"><i class="fa-duotone fa-solid fa-plus me-1"></i>@lang('New '.$taxonomy->name)</a>
            </div>
        </div>

        <div class=" table-responsive datatable-custom  ">
            <table id="attributesTable"
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
                        <th>@lang($taxonomy->name)</th>
                        <th>@lang('Subtitle')</th>
                        <th>@lang('Slug')</th>
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

<!-- New Modal -->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel"
    data-bs-backdrop="static"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="newModalLabel"><i
                        class="bi bi-check2-square"></i> @lang("New ".$taxonomy->name)</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<?= route('admin.ecommerce.attributes.single_attribute_store', [$taxonomy->slug]) ?>" method="post">
                @csrf
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="attributeName" class="form-label">{{ $taxonomy->name }}</label>
                        <input type="text" name="name" required class="form-control" id="attributeName">
                    </div>
                    <div class="">
                        <label for="attributeSubtitle" class="form-label">Subtitle</label>
                        <input type="text" name="subtitle" class="form-control" id="attributeSubtitle">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn-primary">@lang('Add')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End New Modal -->

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
    data-bs-backdrop="static"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="editModalLabel"><i
                        class="bi bi-check2-square"></i> @lang("Edit")</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="post" id="editForm">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="attributeNameEdit" class="form-label">{{ $taxonomy->name }}</label>
                        <input type="text" name="name" required class="form-control" id="attributeNameEdit">
                    </div>
                    <div class="">
                        <label for="attributeSubtitleEdit" class="form-label">Subtitle</label>
                        <input type="text" name="subtitle" class="form-control" id="attributeSubtitleEdit">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn-primary">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Edit Modal -->

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
        $('#attributeNameEdit').val($(this).data('name'));
        $('#attributeSubtitleEdit').val($(this).data('subtitle'));
    })
    $(document).on('click', '.deleteBtn', function() {
        $('#deleteForm').attr('action', $(this).data('route'))
    })
    $(document).on('ready', function() {

        // HSCore.components.HSFlatpickr.init('.js-flatpickr')
        HSCore.components.HSTomSelect.init('.js-select', {
            maxOptions: 250,
        })
        HSCore.components.HSDatatables.init($('#attributesTable'), {
            processing: true,
            serverSide: true,
            ordering: false,
            ajax: {
                url: "<?= route("admin.ecommerce.attributes.single_attribute_list", $taxonomy->id) ?>",
            },

            columns: [{
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'subtitle',
                    name: 'subtitle'
                },
                {
                    data: 'slug',
                    name: 'slug'
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

        document.getElementById("filter_button").addEventListener("click", function() {
            let filterTransactionId = $('#transaction_id_filter_input').val();
            let filterDate = $('#filter_date_range').val();
            const datatable = HSCore.components.HSDatatables.getItem(0);
            datatable.ajax.url("{{ route('admin.transaction.search') }}" + "?filterTransactionID=" + filterTransactionId +
                "&filterDate=" + filterDate).load();
        });
        $.fn.dataTable.ext.errMode = 'throw';
    });
</script>
@endpush
