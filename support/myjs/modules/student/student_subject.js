
const base_url = window.location.origin;
const location_path = window.location.pathname;

let studentTable =  $('#studentTable').DataTable(
{
    "processing": true,
        "ajax": `${base_url}/student/student_subject/student_list`,
        "columns": [
            { "width": "60%", "data": "name[, ]" },
            { "width": "10%", "data": "sex" },
            { "width": "10%", "data": "grade" },
            { "width": "20%", "data": "action" }
        ],
        "deferRender": true,
        "responsive": true,
});

setInterval( function () 
{
    studentTable.ajax.reload();
}, 20000 );

$(document).on('click','.btnStudentInfo', function()
{
    let student_id = $(this).attr('id');
});
