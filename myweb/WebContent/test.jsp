<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="jQuery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jQuery/jquery.json-2.3.js"></script>
<script>
    function getData(){
    	$.ajax({
			method:"post",
			url:"TestServlet",
    		success: function(data, textStatus, jqXHR)
    		{
    			var result = $.parseJSON(data);
                 test(result);    		
    		},
    		error: function( jqXHR, textStatus, errorThrown){
    		}			
		});
    }
	function append_data(data) {
		console.log(data);
		for ( var i = 0; i < data.length ;i++) {
			var name = data[i].name,
			score = data[i].score,
			rank = data[i].rank;

			var html = '<div><ul><li>姓名-》'
					+ name
					+ '</li><li>成绩—》'
					+ score
					+ '</li><li>-》'
					+ rank
					+ '</li></ul></div>';
			$("#test").append(html);
			
			
			
			
		
			
			
			
		}
	}
</script>
<script>
  function test(data){
	    for( i = 0 ; i < data.length ; i++){
	    var name = data[i].name;
	    var text = data[i].text;
	    var time = data[i].time;
		var html2 = '<div class="row">' 
		+'<div class="media">'
			+'<div class="media-left">'
				+'<a > <img class="media-object" src="images/rect.jpg"'
					+'width="20" height="20" alt="...">'
				+'</a>'
			+'</div>'
			+'<div class="media-body">'
				+'<h5 class="media-heading"><span>'
				+ name
				+'</span>&nbsp;&nbsp;'
				+ time
				+'</h5>'
				+ text
			+'</div>'
		+'</div>'
	+'</div><hr/>';
		 $("#test").append(html2);
	    }
  }
</script>



<title>this is test</title>
</head>
<body onload="getData()">
<div class="container" id="test">
</div>

<div class="btn-toolbar" role="toolbar" aria-label="...">
  <div class="btn-group" role="group" aria-label="...">...</div>
  <div class="btn-group" role="group" aria-label="...">...</div>
  <div class="btn-group" role="group" aria-label="...">...</div>
</div>
</body>
</html>