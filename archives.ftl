
<#include "component/header.ftl">
<@header title="文章归档 - ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>

<style>
    * {
        margin: 0px;
        margin: 0px;
    }


    #tag {
        position: relative;
        width: 80%;
        height: 30%;
        margin: 40px auto 0;
        overflow: hidden;
        box-shadow: 0 0 50px #8e8e8e;
        -webkit-box-shadow: 0 0 50px #8e8e8e;
        -moz-box-shadow: 0 0 50px #8e8e8e;
    }
    #tag a {
        position: absolute;
        color: #8e8e8e;
        text-decoration: none;
        top: 260px;
        display: block;
        border: #8e8e8e 1px solid;
        box-shadow: 0 0 5px #8e8e8e;
        -webkit-box-shadow: 0 0 5px #8e8e8e;
        -moz-box-shadow: 0 0 5px #8e8e8e;
        background: #fff;
        filter: alpha(opacity: 30);
        opacity: 0.3;
        font-size: 14px;
        padding: 3px 5px;
        font-family: arial;
        text-shadow: none;
    }
    #tag a:hover {
        filter: alpha(opacity: 100);
        opacity: 1;
        font-weight: bold;
        font-size: 16px;
    }
</style>
<script>
    window.onload = function() {
        var oDiv = document.getElementById('tag');
        var aA = document.getElementsByTagName('a');
        var i = 0;
        for (i = 0; i < aA.length; i++) {
            aA[i].pause = 1;
            aA[i].time = null;
            initialize(aA[i]);
            aA[i].onmouseover = function() {
                this.pause = 0;
            };
            aA[i].onmouseout = function() {
                this.pause = 1;
            };
        }
        setInterval(starmove, 50);

        function starmove() {
            for (i = 0; i < aA.length; i++) {
                if (aA[i].pause) {
                    domove(aA[i]);
                }
            }
        }

        function domove(obj) {
            if (obj.offsetTop <= -obj.offsetHeight) {
                obj.style.top = oDiv.offsetHeight + "px";
                initialize(obj);
            } else {
                obj.style.top = obj.offsetTop - obj.ispeed + "px";
            }
        }

        function initialize(obj) {
            var iLeft = parseInt(Math.random() * oDiv.offsetWidth);
            var scale = Math.random() * 1 + 1;
            var iTimer = parseInt(Math.random() * 1500);
            obj.pause = 0;

            obj.style.fontSize = 12 * scale + 'px';

            if ((iLeft - obj.offsetWidth) > 0) {
                obj.style.left = iLeft - obj.offsetWidth + "px";
            } else {
                obj.style.left = iLeft + "px";
            }
            clearTimeout(obj.time);
            obj.time = setTimeout(function() {
                obj.pause = 1;
            }, iTimer);
            obj.ispeed = Math.ceil(Math.random() * 4) + 1;
        }
    };

</script>
<body>
<#if settings.ArchivesBackgroundImage??>
<style type="text/css">
    body {
        background-image: url('${settings.ArchivesBackgroundImage!}');
    }
</style>
</#if>

<div id="tag">
<@tagTag method="list">
    <#list tags as tag>
        <a class="tagcloud-item"  href="${context!}/tags/${tag.slugName!}" title='${tag.name!}'>${tag.name!}</a>
    </#list>
</@tagTag>
</div>

</body>
<#include "component/footer.ftl">