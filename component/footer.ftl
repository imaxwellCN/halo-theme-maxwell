<style type="text/css">

    footer {
        margin-top: -10px;
        position: absolute;
        bottom: -100px;
        /* height: 100px;*/
        width: 100%;
        text-align: center;
       /* line-height: 20px;*/
      /*  background: #111;*/
        background-color: rgba(0,0,0,0.9);
    }

    footer p {

    }

    footer a, p {
        font-size: 14px;
        margin: 0 8px;
        text-decoration: none;
        color: #888;
        /*text-shadow: 0 0 5px rgba(0, 0, 0, .5);*/
        /*transition: all .4s;*/
    }

    /*    footer {
            font-size: 0.75em;
            text-align: center;
            clear: both;
            padding-top: 50px;
            color: #ccc;
        }*/

</style>
<script type="text/javascript">
    function new_date_time() {
        window.setTimeout("new_date_time()", 30000);
        var today = new Date();
        var Hours = today.getHours();
        Hours = Hours > 9 ? Hours : "0" + Hours;
        var Minutes = today.getMinutes();
        Minutes = Minutes > 9 ? Minutes : "0" + Minutes;
        $(".new_date_time").text(Hours + ":" + Minutes);
    }
    new_date_time();
</script>
<script type="text/javascript">
    function show_date_time() {
            window.setTimeout("show_date_time()", 1000);
            BirthDay = new Date("${settings.TimeStatistics!}");
            today = new Date();
            timeold = (today.getTime() - BirthDay.getTime());
            sectimeold = timeold / 1000;
            secondsold = Math.floor(sectimeold);
            msPerDay = 24 * 60 * 60 * 1000;
            e_daysold = timeold / msPerDay;
            daysold = Math.floor(e_daysold);
            e_hrsold = (e_daysold - daysold) * 24;
            hrsold = Math.floor(e_hrsold);
            e_minsold = (e_hrsold - hrsold) * 60;
            minsold = Math.floor((e_hrsold - hrsold) * 60);
            seconds = Math.floor((e_minsold - minsold) * 60);
            span_dt_dt.innerHTML = daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
    }
    show_date_time();
</script>



<footer>
<#if settings.Icp??>
    <a href="http://beian.miit.gov.cn" target="_blank">${settings.Icp!}</a><br>
</#if>
<#if settings.PublicSecurityRecord??>
    <div style="display: inline-block;background-image: url(${static!}/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
        <a href="http://www.beian.gov.cn" target="_blank">${settings.PublicSecurityRecord!}</a>
    </div>
    <br>
</#if>
<#if settings.TimeStatistics??>
    <p>本站运行：<span id="span_dt_dt"></span></p>
</#if>
    <p>Copyright &copy; ${.now?string('yyyy')}<a href="${context!}"> ${options.blog_title!}<#if settings.SiteSubtitle??>
        - ${settings.SiteSubtitle!}</#if></a></p>
    <!-- 请尊重作者，请务必保留版权 &ndash;&gt; -->
    <p>Powered by <a target="blank" href="http://halo.run">Halo</a>
        Theme by <a target="blank"  href="https://maxwellcoding.club">Maxwell</a>
         <a href="${context!}/rss.xml">文章(RSS)</a></p>
<@global.footer />
</footer>
