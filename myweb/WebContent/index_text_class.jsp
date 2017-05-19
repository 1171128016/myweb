<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章归档</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="jQuery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jquery/jquery.json-2.3.js"></script>
<script>
	function getBtnText(labels) {
		var s = labels.innerHTML;
		console.log("get->" + s);
		var url = "index_label.jsp?label=" + s;
		alert(url);
		window.location.assign(encodeURI(url));
	}
</script>
<script>
	function getTimeText(times) {
		var time = times.innerHTML;
		console.log("get->" + time);
		alert(time);
		var url = "index_time_label.jsp?time=" + time;
		window.location.assign(encodeURI(url));
	}
</script>

<script>
   function get_time_label(){
	   //按照最近时间获取到标签---》时间
	   $.ajax({
  		 method:"post",
  		 url:"Get_Time_Servlet",
  		 success: function(data, textStatus, jqXHR)
      	{
  			var result = $.parseJSON(data); 
      		updata_time_label(result);
      	},
      	error: function( jqXHR, textStatus, errorThrown){
      	} 
  	  });
   }
</script>
<script>
     function updata_time_label(){
    	 //更新标签时间到页面中
    	 var data = new Array();
      	 var a = new Object();
      	 a.time="时间测试1";
      	 var b = new Object();
      	 b.time="时间测试2";
      	 data[0]=a;
      	 data[1]=b;
      	 var id = 41;
    	 for( i = 0 ; i <data.length ; i++){
      		 $("#"+id).html(data[i].time);
      		 id++;
      	 }
     } 
</script>
<style>
.a_fontsize {
	font-szie: 23px;
}
</style>
<style>
a {
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
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
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-th-list"></span>分类条目
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">我的生活</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">学习笔记</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">科技</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">物联网</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">互联网</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">设计视觉</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_link" style="text-decoration: none;cursor:pointer;" onclick="getBtnText(this)">经典语录</a>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<img src="images/index_top.jpg" class="img-responsive"
									alt="Cinque Terre">
							</div>
						</div>
						<hr />

						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-th-list"></span>文章归档
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/1/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/2/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/3/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/4/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/5/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<span class="glyphicon glyphicon-chevron-right"></span></span><a
									class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick="getTimeText(this)">2017/6/1</a>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<img src="images/qq.jpg" class="img-responsive" width="120px"
									height="120px" alt="Cinque Terre">
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 col-md-offset-3">
								<br />
								<p>&nbsp;&nbsp;&nbsp;&nbsp;扫一扫</p>
								<p>&nbsp;&nbsp;一起交流</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<hr />
				<div class="row">
					<h2>文章归档</h2>
				</div>
				<hr />
				<div class="row">
					<span class="glyphicon glyphicon-calendar"></span>按照时间分类
				</div>
				<div class="row">

					<table class="table table_striped" align="center">
						<tr>
							<th>时间</th>
							<th>文章数</th>
							<th>点击量</th>
						</tr>
                        <tr>
                        <td><a class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)">2017-1-1</a></td>
                        <td>20</td>    
                        <td>34</td>            
                        </tr>
                        <tr>
                        <td><a class="btn-link" id="a_label" style="text-decoration: none;cursor:pointer;" onclick ="getTimeText(this)">2017-2-1</a></td>
                        <td>30</td>    
                        <td>44</td>            
                        </tr>
					</table>


				</div>

				<hr />
				<div class="row">
					<span class="glyphicon glyphicon-tags"></span>按照标签分类
				</div>
				<hr />
				<div class="row" style="height: 40px">
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">互联网</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">物联网</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">未来生活</button>
					</div>
				</div>
				<br />
				<div class="row" style="height: 40px">
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">设计元素</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">新的视觉</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">大数据</button>
					</div>
				</div>
				<br />
				<div class="row" style="height: 40px">
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">知识认知</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">我的生活</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">我们的未来</button>
					</div>
				</div>
				<br />
				<div class="row" style="height: 40px">
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">经典语录</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">设计师</button>
					</div>
					<div class="col-md-4">
						<button onclick="getBtnText(this)" type="button"
							class="btn btn-info">元素大师</button>
					</div>
				</div>
			</div>
			<hr />
		</div>


	</div>
	</div>

	</div>

	<!-- 包含的页头部分 -->
	<jsp:include page="index_buttom.html" />
</body>
</html>