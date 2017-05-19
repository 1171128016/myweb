<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this is index</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="jQuery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jQuery/jquery.json-2.3.js"></script>
<script>
	function getBtnText(labels) {
		//取到文本标签--------》跳转页面
		var s = labels.innerHTML;
		console.log("get->" + s);
		var url = "index_text_label.jsp?label=" + s;
		alert(url);
		window.location.assign(encodeURI(url));
	}
</script>

<script>
       function getTimeText(times){
    	   //取到时间标签--------》跳转页面
    	   var time = times.innerHTML;
    	         console.log("get->"+time);
    	       	 alert(time);
    	       	 var url = "index_time_label.jsp?time="+time;
    	       	 window.location.assign(encodeURI(url));
       }
</script>
<script>
    function onclickUp(btn_link){
    	//得到具体文章的链接   按标题传过去
    	var link = btn_link.innerHTML;
    	console.log(link);
        alert(link);    	
    	var url = "index_text.jsp?="+link;
    	window.location.assign(encodeURI(url));
    }
</script>


<script>
   function getLeftText(){
	   //获得左面的文章数据---》获取最新的文章按照时间排序的结果集
	   $.ajax({
  		 method:"post",
  		 url:"GetLeftTextServlet",
  		 success: function(data, textStatus, jqXHR)
      	{
  			var result = $.parseJSON(data); 
      		updateLeftText(result);
      	},
      	error: function( jqXHR, textStatus, errorThrown){
      	} 
  	  });
   }
</script>
<script>
  function updateLeftText(data){
	  //更新文章
   	 var id = 21,id2 = 31;
   	 for( i = 0 ; i <data.length ; i++){
   		 $("#"+id).html(data[i].title);
   		 id++;
   		 $("#"+id2).html(data[i].texts+"[...]");
   		 id2++;
   	 }
  }
</script>
<script>
   function getTimeLabel(){
	   //按照最近时间获取到标签---》时间
	   $.ajax({
  		 method:"post",
  		 url:"GetTimeServlet",
  		 success: function(data, textStatus, jqXHR)
      	{
  			var result = $.parseJSON(data); 
  			updateTimeLabel(result);
      	},
      	error: function( jqXHR, textStatus, errorThrown){
      	} 
  	  });
   }
</script>
<script>
     function updateTimeLabel(data){
    	 //更新标签时间到页面中
      	 var id = 41;
    	 for( i = 0 ; i < data.length ; i++){
      		 $("#"+id).html(data[i].time);
      		 id++;
      	 }
     } 
</script>
<script>
   function gteComment(){
	   //获取页面的评论---》最新评论
	   $.ajax({
  		 method:"post",
  		 url:"GetCommentServlet",
  		 success: function(data, textStatus, jqXHR)
      	{
  			var result = $.parseJSON(data); 
      		updateComment(result);
      	},
      	error: function( jqXHR, textStatus, errorThrown){
      	} 
  	  });
   }
</script>
<script>
       function updateComment(data){
    		 //更新评论---》
      	 var id = 1,id2 = 11;
      	 for( i = 0 ; i < data.length ; i++){
      		 $("#"+id).html(data[i].name+'&nbsp;&nbsp;'+data[i].time);
      		 id++;
      		 $("#"+id2).html(data[i].text);
      		 id2++;
      	 }
       }
</script>

<script>
      function getText(){
    	  //取到数据库页面文章缩略数据
    	  getLeftText();//左边文章区
    	  gteComment();//评论留言区
    	  getTimeLabel();//标签时间
    	  var url = decodeURI(location.href);
    	  var label = url.split("=");
    	 console.log("get->"+label[1]);
    	// $("#title").html(label[1]); 
    	//  alert(label[1]);
    	
    	  var data = new Object();
    	  $.ajax({
    		 method:"get",
    		 url:"GetTextServlet",
    		 success: function(data, textStatus, jqXHR)
        	{
    			var result = $.parseJSON(data); 
        		updateText(result);
        	},
        	error: function( jqXHR, textStatus, errorThrown){
        	} 
    	  });
      }
</script>

<script>
   function updateText(data){
	   //更新主页面页面中的文章缩略图数据
	 for(var i = 0 ; i < data.length ;i++){
	  var title=data[i].title;
	  var text=data[i].texts;
	  var time=data[i].time;
	  var clickup=data[i].clickup;
	  var browser=data[i].browser;
	  var comment=data[i].comment;
      var html = '<div class="row">'
           +'<h2 id="title">标签名字</h2>'
           + '</div>'
             +'<div class="row">'
                +'<div class="media">'
	               +'<a class="pull-left"> <img class="media-object"'
		           +'src="images/rect.jpg" width="120px" height="120px" alt="媒体对象">'
                 	+'</a>'
            	+'<div class="media-body">'
		           +'<h4 class="media-heading"><a class="title-link"  style="text-decoration: none;cursor:pointer;" onclick="onclickUp(this)">'
		           + title
		           +'</a></h4>'
		           + text
                +'</div>'
                +'</div>'
             +'</div>'
            +'<div class="row">'
                +'<div class="col-md-6">'
	               +'admin&nbsp;&nbsp;<span class="glyphicon glyphicon-calendar"></span>&nbsp;<span>'
	               + time
	               +'</span>'
                   +'</div>'
                  +'<div class="col-md-2">'
	              +'<span class="glyphicon glyphicon-thumbs-up"></span>('
	              + clickup
	              +')</div>'
                  +'<div class="col-md-2">'
	              +'<span class="glyphicon glyphicon-eye-open"></span>('
	              +browser
	              +')</div>'
                  +'<div class="col-md-2">'
                  +'<span class="glyphicon glyphicon-comment"></span>('
                  + comment
                  +')</div>'
                  +'</div><hr/>';
                  $("#text").append(html);
	  }
   }
</script>
</head>
<body onload="getText()">
	<!-- 包含的页头部分 -->
	<jsp:include page="index_top.html" />
	<!--流式布局-->
	<div class="container-fluid">
		<!-- 直接分一个大行 -->
		<div class="row">
			<!-- 左边部分 -->
			<div class="col-md-3">
				<hr />
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-th-list"></span>分类条目
						</div></div>	<br />
						 <div class="row" >
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >我的生活</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >学习笔记</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >科技</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >物联网</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >互联网</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >设计视觉</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="a_link" onclick ="getBtnText(this)" >经典语录</a>
						</div></div>
						<hr />
						<div class="row">
						  <div class="col-md-4 col-md-offset-3"><img src="images/index_top.jpg" class="img-responsive" alt="Cinque Terre">
						  </div>
						</div>
						<hr/>
						
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-th-list"></span>文章归档
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span><a class="btn-link" id="41" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)" >2017/1/1</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span></span><a class="btn-link" id="42" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)" >2017/2/1</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span></span><a class="btn-link" id="43" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)" >2017/3/1</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span></span><a class="btn-link" id="44" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)" >2017/4/1</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="45" onclick ="getTimeText(this)" >2017/5/1</a>
						</div></div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3"><span class="glyphicon glyphicon-chevron-right"></span></span><a class="btn-link" style="text-decoration: none;cursor:pointer;" id="46" onclick ="getTimeText(this)" >2017/6/1</a>
						</div></div><br/>
						<div class="row">
						    <div class="col-md-4 col-md-offset-3">
						    <img src="images/qq.jpg" class="img-responsive" width="120px" height="120px" alt="Cinque Terre">
						    </div>
						</div>
						<div class="row">
						    <div class="col-md-4 col-md-offset-3">
						    <br/>
						    <p>&nbsp;&nbsp;&nbsp;&nbsp;扫一扫</p>
						    <p>&nbsp;&nbsp;一起交流</p>
						    </div>
						</div>
					</div>
				</div>
			</div>


			<!-- 中间部分 -->
			<div class="col-md-6">

				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/d.jpg"  alt="First slide">
						</div>
						<div class="item">
							<img src="images/e.jpg"  alt="Second slide">
						</div>
						<div class="item">
							<img src="images/f.jpg"  alt="Third slide">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left" href="#myCarousel"
						data-slide="prev">&lsaquo; </a> <a class="carousel-control right"
						href="#myCarousel" data-slide="next">&rsaquo; </a>
				</div>
				<br />
				<div class="row">
					<div class="col-md-12" id="text"></div>
				</div>

				<!-- 分页按钮，初步使用异步加载数据 -->
				<div class="row">
				  <div class="col-md-6 col-md-offset-4">
					<nav aria-label="Page navigation">
					<ul class="pagination ">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
					</nav>
					</div>
				</div>
			</div>


			<!-- 右边部分 -->
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<hr />
						<div class="row">
							<span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;最近文章
						</div><hr/>
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="21" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="31">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="22" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="32">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="23" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="33">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="24" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="34">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="25" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="35">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="26" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="36">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="60" height="60" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading"><a style="text-decoration: none;cursor:pointer;" id="27" onclick="onclickUp(this)">三生三世十里桃花</a></h4>
									<span id="37">送君十里，与君一别。</span>
								</div>
							</div>
						</div>
						<hr />


						<!-- 右边的评论区 -->
						<div class="row">
							<span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;热门评论
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="1">用户1.5.6</h5>
									<span id="11">哇，很喜欢看哦！</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="2">用户2.5.6</h5>
									<span id="12">送你一朵小红花
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="3">用户3.5.6</h5>
									<span id="13">楼上厉害哦！</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="4">用户4.5.6</h5>
									<span id="14">点赞</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="5">用户5.5.6</h5>
									<span id="15">测试2017/5/11</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="6">用户6.5.6</h5>
									<span id="16">测试2017/5/8</span>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="7">用户7.5.6</h5>
									<sapn id="17">测试2017/5/8</sapn>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="images/rect.jpg" width="20" height="20" alt="...">
									</a>
								</div>
								<div class="media-body">
									<h5 class="media-heading" id="8">用户8.5.6</h5>
									<span id="18">测试2017/5/8</span>
								</div>
							</div>
							<!-- 翻页按钮 -->
							
							
							
							
						</div>
						<hr />

						<div class="row">
							<span class="glyphicon glyphicon-tags"></span>热门标签
						</div>
						<hr />
						<div class="row" style="height: 40px">
							<div class="col-md-4">互联网</div>
							<div class="col-md-4">物联网</div>
							<div class="col-md-4">未来生活</div>
						</div>
						<div class="row" style="height: 40px">
							<div class="col-md-4">设计元素</div>
							<div class="col-md-4">新的视觉</div>
							<div class="col-md-4">大数据</div>
						</div>
						<div class="row" style="height: 40px">
							<div class="col-md-4">新的认知</div>
							<div class="col-md-4">我的生活</div>
							<div class="col-md-4">我们的未来</div>
						</div>
						<div class="row" style="height: 40px">
							<div class="col-md-4">经典语录</div>
							<div class="col-md-4">设计师</div>
							<div class="col-md-4">经典元素</div>
						</div>
						
						
						
						
						
						
						
						
					</div>
				</div>

			</div>
			
			
			
			
			
			
			
		</div>
	</div>
	<!-- 包含的页头部分 -->
	<jsp:include page="index_buttom.html" />
</body>
</html>