jQuery ->
  $('.datatable').dataTable
    "sPaginationType": "full_numbers"
    "oPaginate": {
        "sFirst":    "<< ",
        "sPrevious": " < ",
        "sNext":     " > ",
        "sLast":     " >>"
    } 
    sProcessing:   "Bitte warten...",
    sLengthMenu:   "_MENU_ Eintraege anzeigen",
    sZeroRecords:  "Keine Eintraege vorhanden.",
    sInfo:         "_START_ bis _END_ von _TOTAL_ Eintraegen",
    sInfoEmpty:    "0 bis 0 von 0 Eintraegen",
    sInfoFiltered: "(gefiltert von _MAX_  Eintraegen)",
    sInfoPostFix:  "",
    sSearch:       "Suchen",
    sUrl:          "",
    #sPaginationType: "foundation"
    #bJQueryUI: true
    #bProcessing: true
    #bServerSide: true
  $('#new_painting').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_painting').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')