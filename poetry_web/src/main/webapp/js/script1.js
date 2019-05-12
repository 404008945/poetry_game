
function clearTime() {
    i=0;
    gameTime = 30;
    if(s)
    clearInterval(s);
    if(t1)
    clearInterval(t1);
    $(".pie2").css("backgroundColor", "#fff");
    $(".pie2").css("-o-transform","rotate(" + 0 + "deg)");
    $(".pie2").css("-moz-transform","rotate(" + 0 + "deg)");
    $(".pie2").css("-webkit-transform","rotate(" + 0 + "deg)");

    $(".pie1").css("backgroundColor", "#fff");
    $(".pie1").css("-o-transform", "rotate(" + 0 + "deg)");
    $(".pie1").css("-moz-transform", "rotate(" + 0 + "deg)");
    $(".pie1").css("-webkit-transform", "rotate(" + 0 + "deg)");
}
function updateTime() {
    i=0;
    gameTime=30;
    countDown();

   // timer = setInterval(function () {
   //      $(".clock span").html(time);
   //      time--;
   //      if (time == -1) {
   //          clearInterval(timer);
   //          time = 30;
   //      }
   //  }, 1000)
}
// var timer2;
function updateTimeBySecond(ltime) {
   i= (30-ltime)/30*360;

    gameTime = ltime;
    countDown();
    // time=ltime
    // timer2 = setInterval(function () {
    //     $(".clock span").html(time);
    //     time--;
    //     if (time == -1) {
    //         clearInterval(timer2);
    //         time = 30;
    //     }
    // }, 1000)
}
function downloadFilebyAjax(url) {//通过ajax动态请求用户头像
    var xhr = new XMLHttpRequest();
    xhr.open("get", url, true);
    xhr.responseType = "blob";
    xhr.onload = function() {
        if (this.status <=300) {
            var blob = this.response;
            var image = $(".user .right img")[0]
            $(".user .right img").show();
            $(image).onload = function(e) {
                window.URL.revokeObjectURL(image.src);
                //$(".audio-length-total").html(str);
            };
            image.src = window.URL.createObjectURL(blob);
          //  $("#audioPlayer").click();
        } }
    xhr.send();
}





