<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>车辆轨迹回放</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://webapi.amap.com/maps?v=1.4.0&key=d097c2ed880c93c17ad2e5c190203c60"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.5.3/jquery-3.2.1.min.js" charset="UTF-8"></script>
</head>
<body>
<div id="container"></div>
<div class="button-group">
    <input type="button" class="button" value="开始动画" id="start"/>
     <input type="button" class="button" value="暂停动画" id="pause"/>
      <input type="button" class="button" value="继续动画" id="resume"/>
    <input type="button" class="button" value="停止动画" id="stop"/>
</div>
<script>
    var marker, lineArr;
    var lngX = 108.947273, latY = 34.30993;
	var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [lngX ,latY],
        zoom: 17
    });
    marker = new AMap.Marker({
        map: map,
        position: [lngX,latY],
        icon: "http://webapi.amap.com/images/car.png",
        offset: new AMap.Pixel(-26, -13),
        autoRotation: true
    });
    
    /***把ajax的异步设置成同步,防止$.getJSON无法对外部变量进行赋值****/
    $.ajaxSetup({async:false});
    
    /******************一辆车的路线绘制，后续根据路线的多少进行调整**************************/
    lineArr= [];
    $.getJSON('http://localhost:8080/SmallProject/routeController/getAllRoute.do', function(d) {
    	lineArr=d[0].path;
    	console.info(lineArr);
    	console.info(d);
    });
    /****************************************************************/
    // 绘制轨迹
    var polyline = new AMap.Polyline({
        map: map,
        path: lineArr,
        strokeColor: "#00A",  //线颜色
        // strokeOpacity: 1,     //线透明度
        strokeWeight: 3,      //线宽
        // strokeStyle: "solid"  //线样式
    });
    var passedPolyline = new AMap.Polyline({
        map: map,
        // path: lineArr,
        strokeColor: "#F00",  //线颜色
        // strokeOpacity: 1,     //线透明度
        strokeWeight: 3,      //线宽
        // strokeStyle: "solid"  //线样式
    });


    marker.on('moving',function(e){
        passedPolyline.setPath(e.passedPath);
    })
    map.setFitView();

    AMap.event.addDomListener(document.getElementById('start'), 'click', function() {
        marker.moveAlong(lineArr, 10000);
    }, false);
     AMap.event.addDomListener(document.getElementById('pause'), 'click', function() {
        marker.pauseMove();
       }, false);
      AMap.event.addDomListener(document.getElementById('resume'), 'click', function() {
        marker.resumeMove();
    }, false);
    AMap.event.addDomListener(document.getElementById('stop'), 'click', function() {
        marker.stopMove();
    }, false);

</script>
</body>
</html>