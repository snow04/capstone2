<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger">
                <strong>Quarterly Assessment</strong> This page records scores for Quarterly Assessment activities
            </div>
            <div class="card">
                <div class="card-header">
                    <?php 
                        if(isset($this->session->subject_teach)){
                            echo '<a href="'.base_url('quarterly_assessment/s_index/'.$this->session->class_id).'" class="btn btn-outline-primary float-left"><i class="fa fa-arrow-left"></i></a>';
                        }else{
                            echo '<a href="'.base_url('quarterly_assessment/index/'.$this->session->class_id).'" class="btn btn-outline-primary float-left"><i class="fa fa-arrow-left"></i></a>';
                        }
                    ?>
                    <h4 class="car-title float-right" style="margin-left: 10px;"> Section <?=$class_info[0]->section;?></h4>
                </div>
                <div class="card-body">
                    <p>Classroom: <?=$class_info[0]->classroom;?></p>
                    <p>Year Level: <?=$class_info[0]->year_level;?></p>
                    <p>Schedule: <?=$class_info[0]->schedule;?></p>
                </div>
            </div><br>

            <div class="card">
                <div class="card-header">
                    <h4 class="car-title float-left" style="margin-left: 10px;"> Topic <?=$topic_info[0]->topic;?></h4>
                </div>
                <div class="card-body">
                    <p>Max: <?=$topic_info[0]->max;?></p>
                    <p>Quarter: <?=$topic_info[0]->quarter;?></p>
                </div>
            </div><br><br>

            <div class="table-responsive">
                <table class="table table-responsive" style="width:100%;" id="studentScoreTable">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Score</th>
                        </tr>
                    </thead>
                </table>
            </div>

        </div>
    </div>
</div>


<div class="modal" id="scoreModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div> -->

      <div class="modal-body">
            <p id="student_name"></p><hr>
            <p class="float-left">Max Score: <?=$topic_info[0]->max;?></p>
            <p class="float-right">Quarter: <?=$topic_info[0]->quarter;?></p>
            <br>
            <form action="" id="scoreForm">
                <div class="form-group">
                    <!-- <label for="score">Score</label> -->
                    <input type="number" name="id" id="id" class="form-control" hidden>
                    <input type="number" name="student_id" id="student_id" class="form-control" hidden>
                    <input type="number" name="score" id="score" class="form-control" max="<?=$topic_info[0]->max;?>">
                </div>
                <button class="btn btn-primary">Save Score</button>
            </form>
      </div>

      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div> -->

    </div>
  </div>
</div>