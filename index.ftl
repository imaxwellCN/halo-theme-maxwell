<#include "component/header.ftl">
<@header title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>


<body>
<#--无博客内容 显示定义背景图-->
    <#if settings.BackgroundImage??>
    <style type="text/css">
        body {
            background-image: url('${settings.BackgroundImage!}');
        }
    </style>
    <#else>
        <#if posts.getTotalElements() gt 0>
        <#--首页轮播图-->
        <ul class="fsb-slider">
            <#list posts.content as post>
                <li><span><img src="${post.thumbnail!}">${post.title!}</span></li>
            </#list>
        </ul>
        <#else>
    <#--无自定义背景 显示默认背景图-->
         <style type="text/css">
             body {
                 background-image: url('https://www.maxwellcoding.club/image/ab0a92777c7f3831b82bbccbc9b377a7.png') !important;
             }
         </style>

        </#if>

    </#if>

</body>
<#include "component/footer.ftl">
