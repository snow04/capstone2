
const base_url = window.location.origin;
const location_path = window.location.pathname;

let studentTable =  $('#studentScoreTable').DataTable(
    {
        "processing": true,
            "ajax": `${base_url}/written_work/topic/student_scoring_list`,
            "columns": [
                { "width": "70%", "data": "name" },
                { "width": "30%", "data": "score" }
            ],
            "deferRender": true,
    });

    $(document).on('click','.btnScore', function (){
        let id = $(this).attr('id');
        $('#student_id').val(id);

        $.get(`${base_url}/written_work/topic/getStudent/${id}`, function(output)
        {
            console.log(output);
            $('#student_name').text(`${output[0].lastname}, ${output[0].firstname}`);
        },'json');
        $('#scoreModal').modal('show');
    });

    $(document).on('click', '.btnScoreEdit', function(){
        let id = $(this).attr('id');
        $.get(`${base_url}/written_work/topic/getScore/${id}`, function(output)
        {
            $.get(`${base_url}/written_work/topic/getStudent/${output[0].student_id}`, function(outputs)
            {
                $('#student_name').text(`${outputs[0].lastname}, ${outputs[0].firstname}`);
            },'json');

            $('#score').val(output[0].score);
            $('#student_id').val(output[0].student_id);
            $('#id').val(output[0].id);
        },'json');
        $('#scoreModal').modal('show');
    });

    $('#scoreForm').submit(function(e){
        e.preventDefault();
        $.post(`${base_url}/written_work/topic/save`, $(this).serialize(), function(succ)
        {
            if(succ.status)
            {
                Swal.fire(
                    'Saved!',
                    'Score has been saved.',
                    'success'
                  ).then(()=>{
                    studentTable.ajax.reload();
                    $('#scoreModal').modal('hide');
    
                  });
            }
            else
            {
                Swal.fire(
                    'Failed!',
                    'Score has not been added.',
                    'error'
                  );
            }
        },'json');
    });