
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

let subjects = new Array('Filipino','English','Mathematics','Science','AP','ESP','EPP','MAPEH');
for(let i =0; i < subjects.length; i++)
{

    $.get(`${base_url}/student/student_info/totalGrade/${subjects[i]}`, function(succ)
    {
        
        let ww = succ[0].written_work;
        let pt = succ[0].performance_task;
        let qa = succ[0].quarterly_assessment;

        let grade = ww+pt+qa;

        console.log(succ);

        $.get(`${base_url}/student/student_info/transmute_grade/${grade}`, function(succss)
        {

            // if(grade < 75)
            if(succss.transmuted < 75)
            {
                $(`#${subjects[i]}_transmute`).removeClass('badge-success');
                $(`#${subjects[i]}_transmute`).addClass('badge-danger');
                $(`#${subjects[i]}`).removeAttr('hidden');

            }
            else
            {
                $(`#${subjects[i]}_transmute`).removeClass('badge-danger');
                $(`#${subjects[i]}_transmute`).addClass('badge-success');
            }
            $(`#${subjects[i]}_transmute`).text(succss.transmuted);

        },'json');

        let data = {
            datasets: [{
                data: [ww.toFixed(2), pt.toFixed(2), qa.toFixed(2), succ[0].missed.toFixed(2)],
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
        load_pie(data, document.getElementById(`g_${subjects[i]}`).getContext('2d'));
    },'json');
}


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