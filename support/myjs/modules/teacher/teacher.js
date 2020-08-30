
const base_url = window.location.origin;
const location_path = window.location.pathname;

    let form = $('#teacherForm');
    let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
    if (isMobile) 
    {
        form.removeClass('position-fixed');
    } 
    else 
    {
        form.addClass('position-fixed');
    }

    $.get(`${base_url}/teacher/teachers_list`, function(output){},'json');

    let table = $('#teacherTable').DataTable(
        { 
        "processing": true,
        "ajax": `${base_url}/teacher/teachers_list`,
        "columns": [
            { "width": "60%", "data": "name[, ]" },
            { "width": "10%", "data": "sex" },
            { "width": "15%", "data": "subject" },
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

    $('#teacherTable').DataTable().searchPanes.rebuildPane();
   
    setInterval( function () {
        table.ajax.reload();
    }, 20000 );
    
    $('.dt-buttons').addClass('float-left');


$('#teacherForm').submit(function(e)
{
    e.preventDefault();
    $.post(`${base_url}/teacher/addTeacher`, $(this).serialize(), function(succ)
    {
        if(succ.status)
        {
            Swal.fire(
                'Success!',
                'new teacher has been added.',
                'success'
              ).then(()=>{
                table.ajax.reload();
                $(this)[0].reset();
              });
        }
        else
        {
            Swal.fire(
                'Failed!',
                'Your file has not been added.',
                'error'
              );
        }    
    },'json');
});

$(document).on('click','.btnEdit', function()
{
    let id = $(this).attr('id');
    $.post(`${base_url}/teacher/getTeacher`, {'id': id}, function(succ)
    {
        $('#id').val(succ[0].id);
        $('#lastname').val(succ[0].lastname);
        $('#firstname').val(succ[0].firstname);
        $('#birthdate').val(succ[0].birthdate);
        $('#sex').val(succ[0].sex);
        $('#subject').val(succ[0].subject);
    },'json');
});

$('#clearFields').click(function(){
    $('#teacherForm')[0].reset();
});

$(document).on('click','.btnDelete', function()
{
    let id = $(this).attr('id');

    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.value) 
        {
          $.post(`${base_url}/teacher/deleteTeacher`, {'id': id}, function(succ)
          {
              if(succ.status)
              {
                Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                  ).then(()=>{
                    table.ajax.reload();
                  });
              }
              else
              {
                Swal.fire(
                    'Failed!',
                    'Your file has not been deleted.',
                    'error'
                  );
              }
          },'json');
          
        }
      });

});