
const base_url = window.location.origin;
const location_path = window.location.pathname;

$.get(`${base_url}/advisory/advisory_list`, function(output){},'json');

let studentTable =  $('#advisoryTable').DataTable({
    "processing": true,
        "ajax": `${base_url}/advisory/advisory_list`,
        "columns": [
            { "width": "30%", "data": "section" },
            { "width": "20%", "data": "year_level" },
            { "width": "20%", "data": "student_no" },
            { "width": "30%", "data": "action" }
        ],
        "deferRender": true,
        "responsive": true,
        'stateSave': true
});

setInterval( function () {
    studentTable.ajax.reload();
}, 20000 );