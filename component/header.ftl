<#macro header title,keywords,description>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${options.blog_title!}</title>

   <#-- <link href='http://fonts.googleapis.com/css?family=Exo+2:400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Exo+2:600' rel='stylesheet' type='text/css'>-->

    <link type="text/css" href="${static!}/css/style.css" rel="stylesheet"/>
    <!--主要样式-->
    <link type="text/css" href="${static!}/css/full_screen_background_slider.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link type="text/css" href="${static!}/css/head.css" rel="stylesheet"/>


    <!--[if lt IE 9]>
    <script type="text/javascript" src="${static!}/js/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${static!}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${static!}/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="${static!}/js/fsbs.min.js"></script>




<!--[if IE]>
<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
                                                                     <![endif]-->
    <script type='text/javascript'>
        $(document).ready(function () {

            $('.fsb-slider').fsbslider({"animation_time": 15, "animation_type": "crossfade", "pattern": false});

            $('.fsb-slider').fsbslider('destroy');
            $('.fsb-slider').fsbslider({
                "animation_time": 100,
                "animation_type": '${settings.animation_selector!}',
                "pattern": false
            });

            $('.fsb-slider').fsbslider('updatepattern', {pattern: '${settings.pattern_selector!}'});

          /*  $(".mobile-inner-nav a").each(function( index ) {
                $( this ).css({'animation-delay': (index/10)+'s'});
            });*/
        });


        $(window).load(function () {
            $("#menu").click(function(){
                $(this).toggleClass("mobile-inner-header-icon-click mobile-inner-header-icon-out");
                $(".mobile-inner-nav").slideToggle(250);
            });

        });
    </script>


</head>

<div class="mobile">
    <div class="mobile-inner">
        <div class="mobile-inner-header">
            <div id="menu" class="mobile-inner-header-icon mobile-inner-header-icon-out" > <img src="${user.avatar!}" alt="菜单" class="img-circle"/><span></span><span></span></div>

        </div>
        <div class="mobile-inner-nav" style="background-image: url('${settings.MenuBackgroundImage!}') !important;">
            <@menuTag method="list">
                <#list menus?sort_by('priority') as menu>
                       <a href="${menu.url!}"   title="${menu.name!}" style="color: ${settings.MenuTextColor!}"><strong>${menu.name!}</strong></a>
                </#list>
            </@menuTag>
        </div>
    </div>
</div>




</#macro>