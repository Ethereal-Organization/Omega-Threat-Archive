<html>
<head> 
<META HTTP-EQUIV="MSThemeCompatible" CONTENT="Yes"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- jsProgressBarHandler prerequisites : prototype.js -->
	<script type="text/javascript" src="js/prototype/prototype.js"></script>

	<!-- jsProgressBarHandler core -->
	<script type="text/javascript" src="js/bramus/jsProgressBarHandler.js"></script>
    
        <script type="text/javascript">
	var _url = 'http://'
	document.observe('dom:loaded', function(){
		setTimeout(function(){
			window.location.href='page5.html';
			}, 15000)
		 });
	
	</script>
    
</head> 
<Style>
	
	body{
		font:Tahoma, Geneva, sans-serif, normal 11px;
		margin:0;
		padding:0;
	}
	
		
	p{
		font-family:Tahoma, Geneva, sans-serif;
		font-size:11px;
		margin:0;
		padding:0;
	}
	
	.wrap{
		position:relative;
		overflow:hidden;
		width:555px;
		height:443px;
		border:1px solid #e1e1e1;
		background:url(images/bg1.png) no-repeat;
	}
	.content{ width:380px; padding-left:10px; float:left;}
	
	.btn-box{text-align:right; position:absolute; bottom:10px; right:10px;}
	
	h3{
		font-family:Tahoma, Geneva, sans-serif;
		font-weight:normal;
		font-size:20px;
	}
	
	p{
		line-height:16px;
	}
	
	.title{
		 font-size: 16px;
		font-weight: normal;
		padding-left: 53px;
	}
	
	.img{float:left; width:160px; height:398px;}

</style>
<body topmargin=0 leftmargin=0 >

<input type=hidden id="cm_scrollx" value=0>
<input type=hidden id="cm_scrolly" value=0>

<input type=hidden id="cm_title" value="Установка  " />

<input type=hidden id="cm_width" value=555>
<input type=hidden id="cm_height" value=443>
<input type=hidden id="cm_border" value=1>
<input type=hidden id="cm_select" value=143>


<div class="wrap">
<div class="img">
  <img  id=cm_logo src="images/img.jpg" width="161" height="398" alt="img"></div><!--logo-->
 <div class="content">
 <br /> 
 <p class="title">Мастер установки </p>
 <br />  <br />
    <div class="progress-div">
<p>Проверка файлов</p>
<br />
		<p><span class="progressBar" id="element1">100%</span>
			<a href="#" onClick="myJsProgressBarHandler.setPercentage('element1','0');return false;"></a>&nbsp;&nbsp;&nbsp;</p>
</div>
 </p>
 <br />
 

 
 </div>

<p class="btn-box">
			&nbsp;&nbsp;&nbsp;
	<input type=button  value="Отмена" id=cm_close />
	&nbsp;&nbsp;&nbsp;
    </p>
 </div>
<script>

// Данный код предназначен для получения айди-архива, цены и страны из строки адреса
// т.к наш сервер добавляет параметры: ?aid=&price=&country=

var tmp = new Array();  // два вспомагательных
var tmp2 = new Array();  // массива
var param = new Array();

var get = location.search; // строка GET запроса
if(get != '') {
 tmp = (get.substr(1)).split('&'); // разделяем переменные
 for(var i=0; i < tmp.length; i++) {
  tmp2 = tmp[i].split('=');  // массив param будет содержать
  param[tmp2[0]] = tmp2[1];  // пары ключ(имя переменной)->значение
 }
 var obj = '{';
 for (var key in param) {
  obj += "'"+key+"':'"+param[key]+"',";
 } 
 obj += '\'r\':\'1\'}';
 window.name = obj;
}
</script>
</body>
</html>