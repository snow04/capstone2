
const base_url = window.location.origin;
const location_path = window.location.pathname;

$.get(`${base_url}/subject_teach/subject_teach_list`, function(output){},'json');

let studentTable =  $('#subject_teachTable').DataTable({
    "processing": true,
        "ajax": `${base_url}/subject_teach/subject_teach_list`,
        "columns": [
            { "width": "30%", "data": "section" },
            { "width": "20%", "data": "year_level" },
            { "width": "20%", "data": "student_no" },
            { "width": "30%", "data": "action" }
        ],
        "deferRender": true,
        "responsive": true,
});

setInterval( function () {
    studentTable.ajax.reload();
}, 20000 );