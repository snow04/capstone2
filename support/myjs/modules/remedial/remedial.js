
const base_url = window.location.origin;
const location_path = window.location.pathname;

let table = $('#remedialTable').DataTable(
{ 
    "processing": true,
        "ajax": `${base_url}/remedial/remedial_list`,
        "columns": [
            { "width": "50%", "data": "name[, ]" },
            { "width": "20%", "data": "subject" },
            { "width": "15%", "data": "status" },
            { "width": "15%", "data": "action" }
        ],
        "deferRender": true,
        "dom": 'PBfrtip',
        "buttons": [
            {
                extend: 'colvis',
                postfixButtons: [ 'colvisRestore' ]
            },
            {
                extend: 'copyHtml5',
                exportOptions: {
                    columns: [ 0, ':visible' ]
                }
            },
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: ':visible',
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 5 ]
                }
            },
            {
                extend: 'print',
                text: 'Print all (not just selected)',
                exportOptions: {
                    modifier: {
                        selected: null
                    }
                }
            }
        ],
        "responsive": true,
        "select": true
});

$(document).on('click', '.btnFinish', function(){
    let id = $(this).attr('id');

    Swal.fire({
        title: 'Are you sure?',
        text: "Student remedial will be udpated to finished",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Update!'
      }).then((result) => {
        if (result.value) 
        {
            $.post(`${base_url}/remedial/update`, {id: id}, function(succ)
            {
                if(succ.status)
                {
                    Swal.fire(
                        'Requested!',
                        'Remedial change to Finished.',
                        'success'
                    ).then(()=>{
                        table.ajax.reload();
                    });
                }
                else
                {
                    Swal.fire(
                        'Failed!',
                        'Remedial has not been changed.',
                        'error'
                    );
                }
            },'json');
            
        }
    });
});
