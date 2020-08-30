
const base_url = window.location.origin;
const location_path = window.location.pathname;

let topicTable =  $('#topicTable').DataTable(
{
    "processing": true,
        "ajax": `${base_url}/written_work/written_work_topic_list`,
        "columns": [
            { "visible": false, "width": "0%", "data": "id" },
            { "width": "50%", "data": "topic" },
            { "width": "15%", "data": "max" },
            { "width": "15%", "data": "quarter" },
            { "width": "20%", "data": "action" }
        ],
        "order": [[ 0, "desc" ]],
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
            },
            {
                text: 'Add Topic <i class="fa fa-edit"></i>',
                className: 'tryLang',
                action: function ( e, dt, node, config ) {
                    $('#topicModal').modal('show');
                }
            }
        ],
        "select": true,
        "responsive": true,
});

$(".tryLang").removeClass("btn-secondary");
$(".tryLang").addClass("btn-primary");
$(".tryLang").css("margin-top",'10px');

// setInterval( function () 
// {
//     studentTable.ajax.reload();
// }, 20000 );

$(document).on('click','.btnStudentInfo', function()
{
    let student_id = $(this).attr('id');
});

$('#topicForm').submit(function(e){
    e.preventDefault();

    $.post(`${base_url}/written_work/save`, $(this).serialize(), function(succ)
    {
        if(succ.status)
        {
            Swal.fire(
                'Saved!',
                'Topic has been saved.',
                'success'
              ).then(()=>{
                topicTable.ajax.reload();
                $('#topicModal').modal('hide');

              });
        }
        else
        {
            Swal.fire(
                'Failed!',
                'Topic has not been deleted.',
                'error'
              );
        }
    },'json');

});
