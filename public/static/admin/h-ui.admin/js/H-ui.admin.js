var num = 0,
oUl = $("#min_title_list"),
hide_nav = $("#Hui-tabNav");

function tabNavallwidth() {
    var taballwidth = 0,
    $tabNav = hide_nav.find(".acrossTab"),
    $tabNavWp = hide_nav.find(".Hui-tabNav-wp"),
    $tabNavitem = hide_nav.find(".acrossTab li"),
    $tabNavmore = hide_nav.find(".Hui-tabNav-more");
    if (!$tabNav[0]) {
        return
    }
    $tabNavitem.each(function(index, element) {
        taballwidth += Number(parseFloat($(this).width() + 60))
    });
    $tabNav.width(taballwidth + 25);
    var w = $tabNavWp.width();
    if (taballwidth + 25 > w) {
        $tabNavmore.show()
    } else {
        $tabNavmore.hide();
        $tabNav.css({
            left: 0
        })
    }
}

function Huiasidedisplay() {
    if ($(window).width() >= 768) {
        $(".Hui-aside").show()
    }
}

function getskincookie() {
    var v = $.cookie("Huiskin");
    var hrefStr = $("#skin").attr("href");
    if (v == null || v == "") {
        v = "default"
    }
    if (hrefStr != undefined) {
        var hrefRes = hrefStr.substring(0, hrefStr.lastIndexOf('skin/')) + 'skin/' + v + '/skin.css';
        $("#skin").attr("href", hrefRes)
    }
}

function Hui_admin_tab(obj) {
    var bStop = false,
    bStopIndex = 0,
    href = $(obj).attr('data-href'),
    title = $(obj).attr("data-title"),
    topWindow = $(window.parent.document),
    show_navLi = topWindow.find("#min_title_list li"),
    iframe_box = topWindow.find("#iframe_box");
    if (!href || href == "") {
        alert("data-href不存在，v2.5版本之前用_href属性，升级后请改为data-href属性");
        return false
    }
    if (!title) {
        alert("v2.5版本之后使用data-title属性");
        return false
    }
    if (title == "") {
        alert("data-title属性不能为空");
        return false
    }
    show_navLi.each(function() {
        if ($(this).find('span').attr("data-href") == href) {
            bStop = true;
            bStopIndex = show_navLi.index($(this));
            return false
        }
    });
    // 记录当前页面cookie
    var menu_data ='{href:"'+href+'",title:"'+title+'"}';
    $.cookie("Huimenu",menu_data);

    if (!bStop) {
        creatIframe(href, title);
        min_titleList();
    }else{
        show_navLi.removeClass("active").eq(bStopIndex).addClass("active");
        iframe_box.find(".show_iframe").hide().eq(bStopIndex).show().find("iframe").attr("src", href)
    }
}

function min_titleList() {
    var topWindow = $(window.parent.document),
    show_nav = topWindow.find("#min_title_list"),
    aLi = show_nav.find("li")
}

function creatIframe(href, titleName) {
    var topWindow = $(window.parent.document),
    show_nav = topWindow.find('#min_title_list'),
    iframe_box = topWindow.find('#iframe_box'),
    iframeBox = iframe_box.find('.show_iframe'),
    $tabNav = topWindow.find(".acrossTab"),
    $tabNavWp = topWindow.find(".Hui-tabNav-wp"),
    $tabNavmore = topWindow.find(".Hui-tabNav-more");
    var taballwidth = 0;
    show_nav.find('li').removeClass("active");
    show_nav.append('<li class="active"><span data-href="' + href + '">' + titleName + '</span><i></i><em></em></li>');
    if ('function' == typeof $('#min_title_list li').contextMenu) {
        $("#min_title_list li").contextMenu('Huiadminmenu', {
            bindings: {
                'closethis': function(t) {
                    var $t = $(t);
                    if ($t.find("i")) {
                        $t.find("i").trigger("click")
                    }
                },
                'closeall': function(t) {
                    $("#min_title_list li i").trigger("click")
                },
            }
        })
    } else {}
    var $tabNavitem = topWindow.find(".acrossTab li");
    if (!$tabNav[0]) {
        return
    }
    $tabNavitem.each(function(index, element) {
        taballwidth += Number(parseFloat($(this).width() + 60))
    });
    $tabNav.width(taballwidth + 25);
    var w = $tabNavWp.width();
    if (taballwidth + 25 > w) {
        $tabNavmore.show()
    } else {
        $tabNavmore.hide();
        $tabNav.css({
            left: 0
        })
    }
    iframeBox.hide();
    iframe_box.append('<div class="show_iframe"><div class="loading"></div><iframe frameborder="0" src=' + href + '></iframe></div>');
    var showBox = iframe_box.find('.show_iframe:visible');
    showBox.find('iframe').load(function() {
        showBox.find('.loading').hide()
    })
}

function removeIframe() {
    var topWindow = $(window.parent.document),
    iframe = topWindow.find('#iframe_box .show_iframe'),
    tab = topWindow.find(".acrossTab li"),
    showTab = topWindow.find(".acrossTab li.active"),
    showBox = topWindow.find('.show_iframe:visible'),
    i = showTab.index();
    tab.eq(i - 1).addClass("active");
    tab.eq(i).remove();
    iframe.eq(i - 1).show();
    iframe.eq(i).remove()
}

function removeIframeAll() {
    var topWindow = $(window.parent.document),
    iframe = topWindow.find('#iframe_box .show_iframe'),
    tab = topWindow.find(".acrossTab li");
    for (var i = 0; i < tab.length; i++) {
        if (tab.eq(i).find("i").length > 0) {
            tab.eq(i).remove();
            iframe.eq(i).remove()
        }
    }
}

function getHTMLDate(obj) {
    var d = new Date();
    var weekday = new Array(7);
    var _mm = "";
    var _dd = "";
    var _ww = "";
    weekday[0] = "星期日";
    weekday[1] = "星期一";
    weekday[2] = "星期二";
    weekday[3] = "星期三";
    weekday[4] = "星期四";
    weekday[5] = "星期五";
    weekday[6] = "星期六";
    _yy = d.getFullYear();
    _mm = d.getMonth() + 1;
    _dd = d.getDate();
    _ww = weekday[d.getDay()];
    obj.html(_yy + "年" + _mm + "月" + _dd + "日 " + _ww)
};

$(function(){

    getHTMLDate($("#top_time"));
    getskincookie();
    Huiasidedisplay();
    var resizeID;

    $(window).resize(function() {
        clearTimeout(resizeID);
        resizeID = setTimeout(function() {
            Huiasidedisplay()
        },
        500)
    });

    $(".nav-toggle").click(function() {
        $(".Hui-aside").slideToggle()
    });

    $(".Hui-aside").on("click", ".menu_dropdown dd li a",function(){
        if ($(window).width() < 768) {
            $(".Hui-aside").slideToggle()
        }
    });

    $(".Hui-aside").Huifold({
        titCell: '.menu_dropdown dl dt',
        mainCell: '.menu_dropdown dl dd',
    });

    $(".Hui-aside").on("click", ".menu_dropdown a",function() {
        Hui_admin_tab(this)
    });

    $(document).on("click", "#min_title_list li",function() {
        var bStopIndex = $(this).index();
        var iframe_box = $("#iframe_box");
        $("#min_title_list li").removeClass("active").eq(bStopIndex).addClass("active");
        iframe_box.find(".show_iframe").hide().eq(bStopIndex).show()
    });

    $(document).on("click", "#min_title_list li i",function() {
        var aCloseIndex = $(this).parents("li").index();
        $(this).parent().remove();
        $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
        num == 0 ? num = 0 : num--;
        tabNavallwidth();
        // 清除页面记录cookie
        $.cookie("Huimenu",null);
    });

    $(document).on("dblclick", "#min_title_list li",function() {
        var aCloseIndex = $(this).index();
        var iframe_box = $("#iframe_box");
        if (aCloseIndex > 0) {
            $(this).remove();
            $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
            num == 0 ? num = 0 : num--;
            $("#min_title_list li").removeClass("active").eq(aCloseIndex - 1).addClass("active");
            iframe_box.find(".show_iframe").hide().eq(aCloseIndex - 1).show();
            tabNavallwidth()
        } else {
            return false
        }
    });

    tabNavallwidth();

    $('#js-tabNav-next').click(function() {
        num == oUl.find('li').length - 1 ? num = oUl.find('li').length - 1 : num++;
        toNavPos()
    });

    $('#js-tabNav-prev').click(function() {
        num == 0 ? num = 0 : num--;
        toNavPos()
    });

    function toNavPos(){
        oUl.stop().animate({
            'left': -num * 100
        },
        100)
    }

    $("#Hui-skin .dropDown-menu a").click(function() {
        var v = $(this).attr("data-val");
        $.cookie("Huiskin", v);
        var hrefStr = $("#skin").attr("href");
        var hrefRes = hrefStr.substring(0, hrefStr.lastIndexOf('skin/')) + 'skin/' + v + '/skin.css';
        $(window.frames.document).contents().find("#skin").attr("href", hrefRes)
    })
});