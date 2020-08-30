<div class="container-fluid">
    <div class="row">
        <div class="col-md-9 col-sm-12">
        
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" style="margin-left: 10px;"> <?=$student_info[0]->lastname?>, <?=$student_info[0]->firstname?> </h4>
                </div>
                <div class="card-body">
                    <p>Sex - <?=$student_info[0]->sex?></p>
                    <p>Year Level - <?=$student_info[0]->year_level?></p>
                </div>
            </div><br>

            <?php
                for($i =0; $i < count($subjects); $i++):
            ?>
                <p><?=$subjects[$i]?> <span class="badge badge-success" id="<?=$subjects[$i]?>_transmute">0</span>
                <?php
                        if(!$this->remedial_mdl->validateRemedial($subjects[$i])):
                ?>
                <button class="badge badge-danger btnRemedial" id="<?=$subjects[$i]?>" hidden>Submit for Remedial <i class="fa fa-pencil"></i></button>
                <?php
                    endif;
                ?>
                
                </p>
                
                <div id="canvas-holder" style="width:100%">
                    <canvas id="g_<?=$subjects[$i]?>"></canvas>
                </div><br>
            <?php
                endfor;
            ?>
        </div>
    </div>
</div>