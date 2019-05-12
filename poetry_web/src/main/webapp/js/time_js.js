// JavaScript Document

// Date: 2014-11-07
// Author: Agnes Xu


i = 0;
j = 0;
count = 0;
MM = 0;
SS = 60  // 秒 90s
MS = 0;
totle = (MM+1)*600;
d = 180*(MM+1);
MM = "0" + MM;
var gameTime = 30;
var totalTime=30;
//count down
var showTime = function(){
    totle = totle - 1;
    if (i >= 360) {
        clearInterval(s);
        clearInterval(t1);
        $(".pie2").css("backgroundColor", "#fff");
        $(".pie2").css("-o-transform","rotate(" + 0 + "deg)");
        $(".pie2").css("-moz-transform","rotate(" + 0 + "deg)");
        $(".pie2").css("-webkit-transform","rotate(" + 0 + "deg)");

        $(".pie1").css("backgroundColor", "#fff");
        $(".pie1").css("-o-transform", "rotate(" + 0 + "deg)");
        $(".pie1").css("-moz-transform", "rotate(" + 0 + "deg)");
        $(".pie1").css("-webkit-transform", "rotate(" + 0 + "deg)");
        i = 0;
        gameTime=30;
    } else {
        if (totle > 0 && MS > 0) {
            MS = MS - 1;
            if (MS < 10) {
                MS = "0" + MS
            }
            ;
        }
        ;
        if (MS == 0 && SS > 0) {
            MS = 10;
            SS = SS - 1;
            if (SS < 10) {
                SS = "0" + SS
            }
            ;
        }
        ;
        if (SS == 0 && MM > 0) {
            SS = 60;
            MM = MM - 1;
            if (MM < 10) {
                MM = "0" + MM
            }
            ;
        }
        ;
    }
    ;
    $(".time").html(SS + "s");

};


var start1 = function(){

    //i = i + 0.6;

    i = i + 360/((totalTime)*10);  //旋转的角度  90s 为 0.4  60s为0.6
    count = count + 1;
    if(i <= 180){  // 一半的角度  90s 为 450
        $(".pie1").css("-o-transform","rotate(" + i + "deg)");
        $(".pie1").css("-moz-transform","rotate(" + i + "deg)");
        $(".pie1").css("-webkit-transform","rotate(" + i + "deg)");
    }else{
        $(".pie2").css("backgroundColor", "#d13c36");
        $(".pie2").css("-o-transform","rotate(" + i + "deg)");
        $(".pie2").css("-moz-transform","rotate(" + i + "deg)");
        $(".pie2").css("-webkit-transform","rotate(" + i + "deg)");
    }

};
function addColor(c){
    for(var j=0;j<=c;j++)
    {
        if(j <= 180){  // 一半的角度  90s 为 450
            $(".pie1").css("-o-transform","rotate(" + j + "deg)");
            $(".pie1").css("-moz-transform","rotate(" + j + "deg)");
            $(".pie1").css("-webkit-transform","rotate(" + j + "deg)");
        }else{
            $(".pie2").css("backgroundColor", "#d13c36");
            $(".pie2").css("-o-transform","rotate(" + j + "deg)");
            $(".pie2").css("-moz-transform","rotate(" + j + "deg)");
            $(".pie2").css("-webkit-transform","rotate(" + j + "deg)");
        }
    }
}

var start2 = function(){
    j = j + 0.6;
    count = count + 1;
    if (count == 300) {
        count = 0;
        clearInterval(t2);
        t1 = setInterval("start1()", 100);
    }
    $(".pie2").css("-o-transform","rotate(" + j + "deg)");
    $(".pie2").css("-moz-transform","rotate(" + j + "deg)");
    $(".pie2").css("-webkit-transform","rotate(" + j + "deg)");
}
i=0;
gameTime=30;
var s;
var t1;
var countDown = function() {
    addColor(i);
    j = 0;
    count =30;
    MM = 0;
    SS = gameTime;
    MS = 0;
    totle = (MM + 1) * gameTime * 10;
    d = 180 * (MM + 1);
    MM = "0" + MM;
    showTime();
    s = setInterval("showTime()", 100);
    start1();
    //start2();
    t1 = setInterval("start1()", 100);
}