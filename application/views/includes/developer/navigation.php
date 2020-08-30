<?php
    $admin = [
        [
            "class"         => "dash",
            "url"           => base_url('admin'),
            "icon_class"    => "mdi mdi-view-dashboard",
            "title"         => "DASHBOARD",
            "sub_menu"      => null,

        ],
        [
            "class"         => "drivers",
            "url"           => base_url('driver'),
            "icon_class"    => "mdi mdi-car-multiple",
            "title"         => "DRIVER",
            "sub_menu"      => null,

        ],
        [
            "class"         => "passenger",
            "url"           => base_url('passenger'),
            "icon_class"    => "fa fa-user",
            "title"         => "PASSENGER",
            "sub_menu"      => null,

        ],
    ];

    function childMenu($data)
    {
        echo "<ul class='treeview-menu'>";
        foreach($data as $k=>$d)
        {
            echo "<li class='" . $d['class'] . "'>
                    <a href=" . $d['url'] . ">
                        <i class='" . $d['icon_class'] . "'></i> ".$d['title']."
                    </a>
                </li>";
        }
        echo "</ul>";
    }

    $usrtyp=$userTyp;
    $menu=$$usrtyp;

    // echo '<pre>';
    //     print_r($menu);
    // echo '</pre>';

    if($menu!=null)
    {
        echo "<ul class='metismenu' id='side-menu'>";
        foreach ($menu as $m)
        {
            echo "<li class='" . $m['class'] . "'>
                <a href='" . $m['url'] . "'>
                    <span><i class='" . $m['icon_class'] . "'></i> " . $m['title'] . "</span>";
            if ($m['sub_menu'] != null)
            {
                echo "<i class='fa fa-angle-left pull-right'></i>";
            }
            echo "</a>";
            if ($m['sub_menu'] != null)
            {
                childMenu($m['sub_menu']);
            }
            echo "</li>";
        }
        echo "</ul>";
    }

?>
