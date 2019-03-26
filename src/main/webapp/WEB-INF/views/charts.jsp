<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css">
	<style type="text/css">
		.container{margin: 20px;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="https://cdn.staticfile.org/jquery/3.3.1/jquery.min.js"></script>
  </head>
  
  <body>
  	<div class="container">
	
		<div class="layui-row layui-col-space20">
		  	<div class="layui-col-md6">
		  		<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title" ><span id="title_status"></span></h2>
			    		<div class="layui-colla-content layui-show">
							<div id="dom_status" style="height:400px;width: 100%" ></div>
			    		</div>
			  		</div>
				</div>
		  	</div>
		  	
			<div class="layui-col-md6">
		  		<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title" ><span id="title_attitude"></span></h2>
			    		<div class="layui-colla-content layui-show">
							<div id="dom_attitude" style="height:400px;width: 100%"></div>
			    		</div>
			  		</div>
				</div>
		  	</div>
	
		</div>
		
		
		<div class="layui-row layui-col-space20">
		
		  	<div class="layui-col-md12">
		    	<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title" ><span id="title_industry"></span></h2>
			    		<div class="layui-colla-content layui-show">
							<div id="dom_industry" style="height:600px;width: 100%"></div>
			    		</div>
			  		</div>
				</div>
		  	</div>
		  	
		</div>
		<div class="layui-row layui-col-space20">
		
		  	<div class="layui-col-md12">
		    	<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title" ><span id="title_salary"></span></h2>
			    		<div class="layui-colla-content layui-show">
							<div id="dom_salary" style="height:400px;width: 100%"></div>
			    		</div>
			  		</div>
				</div>
		  	</div>
		  	
		</div>
		<div class="layui-row layui-col-space20">
		
		  	<div class="layui-col-md12">
		    	<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title" ><span id="title_area"></span></h2>
			    		<div class="layui-colla-content layui-show">
							<div id="dom_area" style="height:400px;width: 100%"></div>
			    		</div>
			  		</div>
				</div>
		  	</div>
		  	
		</div>
		
		
	</div>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script>
layui.use(['element','form'], function(){
  var element = layui.element;
  var form = layui.form;
  //…
});
</script>
<script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });


        function initECharts(type,container,data){
        			// 使用
			        require(
			            [
			                'echarts',
			                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
			                'echarts/chart/pie',
			                'echarts/chart/line',

			            ],
			            function (ec) {
			                // 基于准备好的dom，初始化echarts图表
			                var myChart = ec.init(container); 
			               switch(type){
        						case 'bar':
									// 柱状图
									var option = {
									    title : {
									        text: data.title,
									    },
									    tooltip : {
									        trigger: 'item'
									    },
									    legend: {
									        data:data.legend
									    },
									    xAxis : [
									        {
									            type : 'category',
									            data : data.xArray,
									            axisLabel:{
										    		interval: 0,
										    		rotate:-30
										    	}
									        }
									    ],
									    yAxis : [
									        {
									            type : 'value',
									        }
									    ],
									    grid:{
									    	y2:150
									    },
									    series : [
									        {
									            name:data.legend[0],
									            type:'bar',
									            data:data.valueArray,
									            markPoint : {
									                data : [
									                    {type : 'max', name: '最大值'},
									                    {type : 'min', name: '最小值'}
									                ]
									            },
									        }
									    ]
									};
								break;
							case 'pie':
								// 饼图
								var option = {
								    title : {
								        text: data.title,
								        x:'center'
								    },
								    tooltip : {
								        trigger: 'item',
								        formatter: "{a} <br/>{b} : {c} ({d}%)"
								    },
								    legend: {
								        orient : 'vertical',
								        x : 'left',
								        data:data.mixValueArray
								    },
								    series : [
								        {
								            name:data.legend[0],
								            type:'pie',
								            radius : '55%',
								            center: ['50%', '60%'],
								            data:data.mixValueArray
								        }
								    ]
								};
								break;
							case 'line':
								// 折线图
								var option = {
								    title : {
								        text: data.title,
								    },
								    tooltip : {
								        trigger: 'axis'
								    },
								    legend: {
								        data:data.legend
								    },
								    xAxis : [
								        {
								            type : 'category',
								            boundaryGap : false,
								            data : data.xArray,
								            axisLabel:{
										    		interval: 0
										    	}
								        }
								    ],
								    yAxis : [
								        {
								            type : 'value',
								        }
								    ],
								    series : [
								        {
								            name:data.legend[0],
								            type:'line',
								            data:data.valueArray,
								            markPoint : {
								                data : [
								                    {type : 'max', name: '最大值'},
								                    {type : 'min', name: '最小值'}
								                ]
								            },
								            markLine : {
								                data : [
								                    {type : 'average', name: '平均值'}
								                ]
								            }
								        }
								    ]
								};
								break;
							}
			            	// 为echarts对象加载数据 
		                	myChart.setOption(option); 
			            }
			        );
        		}
      	
    </script>
    <script type="text/javascript">
    	
		function renderDomByParams(params,domObj){
			var url = '${pageContext.request.contextPath}/b/jobinfo/get_chart_data';
			$.post(url,params,function(data){
				if(data.status == 'success'){
					var chartData = data.chartData;
					var t;
					switch(params.type){
						case 1:// job_Status
							t = 'pie';
							$('#title_status').text(chartData.title);
							break;
						case 2:// attitude
							t = 'pie';
							$('#title_attitude').text(chartData.title);
							break;
						case 3:// industry
							$('#title_industry').text(chartData.title);
							t = 'bar';
							break;
						case 4:// area
							$('#title_area').text(chartData.title);
							t = 'bar';
							break;
						case 5:// salary
							$('#title_salary').text(chartData.title);
							t = 'line';
							break;
					}
					initECharts(t,domObj,chartData);
				}else{
					alert('系统繁忙!');
				}
			},'json');
		}   
		
		function initData(){
		
			var dom_status = $('#dom_status')[0];
			var dom_attitude = $('#dom_attitude')[0];
			var dom_industry = $('#dom_industry')[0];
			var dom_area = $('#dom_area')[0];
			var dom_salary = $('#dom_salary')[0];
			
			renderDomByParams({'type':1},dom_status);
			renderDomByParams({'type':2},dom_attitude);
			renderDomByParams({'type':3},dom_industry);
			renderDomByParams({'type':4},dom_area);
			renderDomByParams({'type':5},dom_salary);
			$('.layui-show').hide();
			
		} 	
    </script>
    <script type="text/javascript">
    	$(function(){
    		//初始化数据
    		initData();
    	})
    </script>
  </body>
</html>
