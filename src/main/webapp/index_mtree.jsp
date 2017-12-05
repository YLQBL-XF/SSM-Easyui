<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>index_mtree</title>
    <meta charset="utf-8">
	<link href="<%=basePath %>css/mtree.css" rel="stylesheet" type="text/css">
<style>
.mtree-demo .mtree {
  background: #EEE;
  margin: 20px auto;
  width: 100%;
  border-radius: 3px;
}
</style>

<link rel="stylesheet" href="<%=basePath %>font/font-awesome.min.css" type="text/css"></link>
</head>

<body>
<ul class="mtree jet fa1 ">
</ul>

<script src="<%=basePath %>js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/jquery.velocity.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>js/mtree.js"></script>
<script src="<%=basePath %>js/tree.js" charset="utf-8"></script>
<script>

var flag=0;
var count=0;
function loadTree(data){
    count+=1;
      var _mtree=$('.mtree');
			for(var i=0;i<data.length;i++){
				var node=data[i];
        if(node.parent){//有父节点
          var ul=$("<ul></ul>");
          for(var i=0;i<data.length;i++){
            var node=data[i];
            var ref=node.attributes.url;
            var li="";
            if(ref!=null){
              li=$("<li id="+node.id+"><a ref='"+ref+"' onclick='clickA(this)' class='"+node.iconCls+"' >"+node.text+"</a></li>");
            }
            $(ul).append(li);
            $("#"+node.parent).append(ul);
          }
        }else{ //没有有父节点
          var ref=node.attributes.url;
  				var li="";
  				if(ref!=null){
  					li=$("<li id="+node.id+"><a ref='"+ref+"'  class='"+node.iconCls+"' >"+node.text+"</a></li>");
  				}else{
  					li=$("<li id="+node.id+"><a ref='"+ref+"'  class='"+node.iconCls+"' >"+node.text+"</a></li>");
  				}
  				$(_mtree).append(li);
          if(node.child && node.child.length > 0 ){
            loadTree(node.child);
          }
        }
			}
		flag+=1;
		if(flag==count){
			loadTreeNode();
		}

}

loadTree(jsonData);

function clickA(_node){
	var title=$(_node).text();
	var ref=$(_node).attr("ref");
	if(ref!='null'){
		parent.freamAddTab(title,ref);
	}else{
	}
}
</script>

</body>
</html>
