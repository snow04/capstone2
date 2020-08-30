<div class="container-fluid">
    <div class="row">
        <div class="col-md-9 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <a href="<?=base_url('advisory')?>" class="btn btn-outline-primary float-left"><i class="fa fa-arrow-left"></i></a>
                        <h4 class="car-title float-right" style="margin-left: 10px;"> Section <?=$class_info[0]->section;?></h4>
                    </div>
                    <div class="card-body">
                        <p>Classroom: <?=$class_info[0]->classroom;?></p>
                        <p>Year Level: <?=$class_info[0]->year_level;?></p>
                        <p>Schedule: <?=$class_info[0]->schedule;?></p>
                    </div>
                </div><br><br>
            <div class="table-responsive">
                
                <table class="table table-stipe" id="studentTable" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Sex</th>
                            <th>Grade</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>