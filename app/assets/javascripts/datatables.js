  responsiveHelper = undefined
  breakpointDefinition =
    tablet: 1024
    phone: 480

  tableContainer = $('.datatable')
  tableContainer.dataTable

    sPaginationType: "bootstrap"
    # Setup for responsive datatables helper.
    bAutoWidth: false
    bStateSave: false

    fnPreDrawCallback: ->
      responsiveHelper = new ResponsiveDatatablesHelper(tableContainer, breakpointDefinition) unless responsiveHelper

    fnRowCallback: (nRow, aData, iDisplayIndex, iDisplayIndexFull) ->
      responsiveHelper.createExpandIcon nRow

    fnDrawCallback: (oSettings) ->
      responsiveHelper.respond()