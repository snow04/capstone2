<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger">
                <strong>Quarterly Assessment</strong> This page records scores for Quarterly Assessment activities
            </div>
            <div class="card">
                <div class="card-header">
                    <a href="<?=base_url('advisory')?>" class="btn btn-outline-primary float-left"><i class="fa fa-arrow-left"></i></a>
                    <h4 class="car-title float-right" style="margin-left: 10px;"> Section <?=$class_info[0]->section;?></h4>
                </div>
                <div class="card-body">
                    <p>Classroom: <?=$class_info[0]->classroom;?></p>
                    <p>Year Level: <?=$class_info[0]->year_level;?></p>
                    <p>Schedule: <?=$class_info[0]->schedule;?></p>
                    <a class="btn btn-success btn-sm" href="<?=base_url('written_work/index/'.$class_info[0]->id)?>">Written Work</a>
                    <a class="btn btn-primary btn-sm" href="<?=base_url('performance_task/index/'.$class_info[0]->id)?>">Performance Task</a>
                </div>
            </div><br>
            </div>

            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-stripe" style="width:100%;" id="topicTable">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Topic</th>
                                <th>Max Score</th>
                                <th>Quarter</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
    </div>
</div>



<div class="modal" id="topicModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div> -->

      <div class="modal-body">
            <form action="" id="topicForm">
                <input type="text" name="id" id="id" class="form-control" hidden>
                <div class="form-group">
                    <label for="topic">Topic</label>
                    <input type="text" name="topic" id="topic" class="form-control">
                </div>
                <div class="form-group">
                    <label for="max">Max</label>
                    <input type="number" name="max" id="max" class="form-control">
                </div>
                <button class="btn btn-primary">SAVE TOPIC</button>
            </form>
      </div>

      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div> -->

    </div>
  </div>
</div>