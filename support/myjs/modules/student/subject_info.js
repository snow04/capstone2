
const base_url = window.location.origin;
const location_path = window.location.pathname;

function load_pie(data, target)
{
    var ctx = target;
    
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            responsive: true
        }
    });
}


    $.get(`${base_url}/student/subject_student_info/totalGrade/`, function(succ)
    {
        console.log("tang ina mo");
        console.log(succ);

        let ww = succ.written_work;
        let pt = succ.performance_task;
        let qa = succ.quarterly_assessment;
        let missed = succ.missed;

        let grade = ww+pt+qa;

        $.get(`${base_url}/student/subject_student_info/transmute_grade/${grade}`, function(succss)
        {
            console.log(succss);
            // if(grade < 75)
            if(succss.transmuted < 75)
            {
                $(`#${succ.subject}_transmute`).removeClass('badge-success');
                $(`#${succ.subject}_transmute`).addClass('badge-danger');
                $(`#${succ.subject}`).removeAttr('hidden');

            }
            else
            {
                $(`#${succ.subject}_transmute`).removeClass('badge-danger');
                $(`#${succ.subject}_transmute`).addClass('badge-success');
            }
            
            console.log(succss.transmuted);
            console.log(succ.subject);
            $(`#${succ.subject}_transmute`).text(succss.transmuted);

        },'json');

        let data = {
            datasets: [{
                data: [ww, pt, qa, missed],
                backgroundColor: ['#007bff', '#dc3545', 'orange','#f0e68c','#3f51b5','#e91e63','#795548']
            }],
        
            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: [
                'Written Work',
                'Performance Task',
                'Quarterly Assessment',
                'Missed',
            ]
        };
        load_pie(data, document.getElementById(`g_${ succ.subject }`).getContext('2d'));
    },'json');


$(document).on('click','.btnRemedial', function(){
    let id = $(this).attr('id');


    Swal.fire({
        title: 'Are you sure?',
        text: "Student remedial will be requested to admin",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Request!'
      }).then((result) => {
        if (result.value) 
        {
            $.post(`${base_url}/remedial/save`, {subject: id}, function(succ)
            {
                if(succ.status)
                {
                    Swal.fire(
                        'Requested!',
                        'Request for remedial sent.',
                        'success'
                    ).then(()=>{

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
    
})