<nav class="navbar navbar-expand-md bg-primary navbar-dark sticky-top" style="margin-bottom: 20px;">

  <a class="navbar-brand" href="<?=base_url('profile')?>">DICNHS CLASS ASSISTANT</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="collapsibleNavbar">

    <ul class="navbar-nav mr-auto">

        <!-- <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                Teacher <i class="far fa-user"></i>
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="<?=base_url('teacher/');?>">Register Teacher <i class="fal fa-plus"></i> </a>
                <a class="dropdown-item" href="<?=base_url('advisory/addAdvisory');?>">Add Advisory <i class="fal fa-user-plus"></i></a>
                <a class="dropdown-item" href="<?=base_url('advisory/');?>">Advisory List <i class="fal fa-users"></i></a>
                <a class="dropdown-item" href="<?=base_url('subject_teacher/');?>">Subject Handling <i class="fal fa-sticky-note"></i></a>
            </div>
        </li> -->

        <li class="nav-item">
            <a href="<?=base_url('advisory')?>" class="nav-link">Advisories <i class="fa fa-user"></i></a>
        </li>

        <li class="nav-item">
            <a href="<?=base_url('subject_teach')?>" class="nav-link">Subject Teachings <i class="fa fa-users"></i></a>
        </li>

        <!-- <li class="nav-item">
            <a href="<?=base_url('remedial')?>" class="nav-link">Remedial Classes <i class="fa fa-pencil"></i></a>
        </li> -->
       

       

        
    </ul>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                Profile <i class="fal fa-user"></i>
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Settings <i class="fal fa-cog"></i> </a>
                <a class="dropdown-item" href="<?=base_url('main/logout')?>">Logout <i class="fal fa-sign-out"></i></a>
            </div>
        </li>
    </ul>
  </div>
</nav>