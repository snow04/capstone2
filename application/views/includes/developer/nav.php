<nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <ul class="navbar-nav">

      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>

      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>

      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>

    </ul>

    <ul class="navbar-nav ml-auto">
     
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
            Profile <i class="fa fa-user"></i>
        </a>

        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">User Profile</span>
          
          <!-- <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a> -->

          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item text-center">
            Setting <i class="fa fa-clog"></i>
          </a>

          <div class="dropdown-divider"></div>
          <a href="<?=base_url('main/logoutDeveloper')?>" class="dropdown-item text-center">
            Logout <i class="fa fa-user"></i>
          </a>

        </div>
        
      </li>
      
    </ul>
  </nav>