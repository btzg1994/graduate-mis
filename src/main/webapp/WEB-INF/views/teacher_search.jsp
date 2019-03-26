<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>layui</title>
<base href="${pageContext.request.contextPath}/resources/">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/main.css?v=1.1" media="all">
<style type="text/css">
.buttonBox {
	cursor: pointer;
}
</style>
</head>

<body>
	<div style="padding:0px 50px 0px 50px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>筛选条件</legend>
		</fieldset>

		<form class="layui-form" action="#">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">地市</label>
					<div class="layui-input-inline">
						<!-- <input type="text" id="city" name="city" autocomplete="off"
							class="layui-input"> -->
						<select id="city" name="city" lay-verify="" lay-filter="city">
							<option value=""></option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">区县</label>
					<div class="layui-input-inline">
						<!-- <input type="text" id="city" name="city" autocomplete="off"
							class="layui-input"> -->
						<select id="quxiao" name="quxiao" lay-verify="">
							<option value=""></option>
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">商户名称</label>
					<div class="layui-input-inline">
						<input type="text" name="merName" id="merName" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">商户号</label>
					<div class="layui-input-inline">
						<input type="text" name="merId" id="merId" autocomplete="off"
							class="layui-input">
					</div>
				</div>

			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">渠道经理</label>
					<div class="layui-input-inline">
						<input type="text" name="qudaojingli" id="qudaojingli"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">起止时间</label>
					<div class="layui-input-inline">
						<input type="text" name="beginTime" id="beginTime"
							placeholder="请选择开始时间" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid">-</div>
					<div class="layui-input-inline">
						<input type="text" name="endTime" id="endTime"
							placeholder="请选择结束时间" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="*" style="width: 10%;"
						class="layui-btn" id="search">查询</button>
					<button style="width: 10%;" type="reset"
						class="layui-btn layui-btn-primary">重置</button>
					<button style="width: 10%;  float:right;"
						class="layui-btn layui-btn-normal" id="down">数据导出</button>
				</div>
			</div>
		</form>


		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>结果展示</legend>
		</fieldset>

		<div class="layui-form">
			<table class="layui-table" lay-size="sm">
				<thead>
					<tr>
						<th style="width:30px">编号</th>
						<th style="width:30px">地市</th>
						<th style="width:30px">区县</th>
						<th style="width:50px">商户名称</th>
						<th style="width:50px">商户号</th>
						<th style="width:50px">商户openid</th>
						<th style="width:50px">商户联系电话</th>
						<th style="width:50px">渠道经理</th>
						<th style="width:50px">渠道经理联系方式</th>
						<th style="width:50px">操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="fenye" style="float:right;"></div>
		</div>
	</div>
	<script type="text/html" id = "orderDetail">
		<div style="padding-left:10px;padding-right:10px;">
		<table class="layui-table" lay-size="sm">
				<thead>
					<tr>
						<th style="width:30px">编号</th>
						<th style="width:30px">订单号</th>
						<th style="width:30px">券码</th>
						<th style="width:50px">收款时间</th>
						<th style="width:50px">收款额</th>
					</tr>
				</thead>
				<tbody id = "orderDetailTBody">
					
				</tbody>
		</table>
		<div>
	</script>
	<script type="text/html" id = "orderDetailRow">
		<tr>
						<td>{{index}}</td>
						<td>{{accept_no}}</td>
						<td>{{rp_code}}</td>
						<td>{{pay_time}}</td>
						<td>{{use_fee}}</td>
		</tr>
	</script>
	<script type="text/html" id="row">
					<tr>
						<td>{{index}}</td>
						<td>{{city}}</td>
						<td>{{quxiao}}</td>
						<td>{{merName}}</td>
						<td>{{merId}}</td>
						<td>{{openid}}</td>
						<td>{{connectWay}}</td>
						<td>{{manager}}</td>
						<td>{{managerConnect}}</td>
						<td>
							{{if orders == "undefined"}}
								暂无订单
							{{else}}
								<a style="color:rgb(26,161,148);" href="javascript:orderDetail({{index}},'{{merName}}');">查看详情</a>
							{{/if}}
						</td>
					</tr>
	</script>

	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		var orderDetail;
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage', 'element' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
				
				$ = layui.jquery;
			var laydate = layui.laydate;
			var form = layui.form;
	
			orderDetail = function(index,merName){
				layer.open({
					title : merName + "收款详情",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area :  [ '1000px', '700px' ],
					content : template('orderDetail', {})
				});
				var orders = orderMap.get(index);
				var html  = "";
				for(var i = 0; i < orders.length; i++){
					var curr = orders[i];
					curr.index = i + 1;
					html += template('orderDetailRow', curr);
				}
				$('#orderDetailTBody').append(html);
			}
	
			// ------------------------- 初始化二级选择框
			var city = cityCode[610000];
			for (var key in city) {
				var option = "<option value = '" + key + "'>" + city[key] + "</option>";
				$('#city').append(option);
			}
			form.render('select');
			form.on('select(city)', function(data) {
				$('#quxiao').html('<option value=""></option>');
				form.render('select');
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				var val = data.value;
	
				var area = cityCode[val];
				for (var key in area) {
					var option = "<option value = '" + key + "'>" + area[key] + "</option>";
					$('#quxiao').append(option);
				}
				form.render('select');
			});
			// ------------------------- 初始化二级选择框
	
			//执行一个laydate实例
			laydate.render({
				elem : '#beginTime' //指定元素
			});
			laydate.render({
				elem : '#endTime' //指定元素
			});
	
			var orderMap;
			// 添加数据
			function addRow(data) {
				orderMap = new Map();
				for (var i = 0; data && i < data.length; i++) {
					var curr = data[i];
					curr.index = i + 1;
					curr.orders = curr.orders ? curr.orders : "undefined";
					orderMap.set(curr.index, curr.orders);
					var html = template('row', curr);
					$('tbody').append(html);
				}
			}
			var total;
			function getData(condition) {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/gatherDetailData",
					async : false,
					beforeSend : function() {
						$('#search').attr('disabled', 'disabled');
						layer.load();
					},
					complete : function() {
						$('#search').removeAttr('disabled');
						layer.closeAll('loading');
					},
					data : JSON.stringify(condition),
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						$('tbody').empty();
						addRow(data.list);
						total = data.total;
					}
				});
			}
	
				
				
			function freshPage(count) {
				laypage.render({
					elem : 'fenye',
					count : count, //数据总数，从服务端得到
					jump : function(obj, first) {
						//obj包含了当前分页的所有参数，比如：
						console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						console.log(obj.limit); //得到每页显示的条数
						var condition = {
							city : $('#city').val() ? cityCode['610000'][$('#city').val()] : '',
							quxiao : $('#city').val() && $('#quxiao').val() ? cityCode[$('#city').val()][$('#quxiao').val()] : '',
							merName : $('#merName').val(),
							merId : $('#merId').val(),
							beginTime : $('#beginTime').val(),
							endTime : $('#endTime').val(),
							manager : $('#qudaojingli').val(),
							pageNum : obj.curr,
							pageSize : obj.limit
						}
						getData(condition);
						
						//首次不执行
						if (!first) {
							//do something
						}
					}
				});
			}
			var downLoadCondition = {};
			form.on('submit(*)', function(data) {
				// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				if (!$('#city').val() && $('#quxiao').val()) {
					layer.open({
						title : '警告',
						content : '请先选择地市!'
					});
					return false;
				}
				var condition = {
					city : $('#city').val() ? cityCode['610000'][$('#city').val()] : '',
					quxiao : $('#city').val() && $('#quxiao').val() ? cityCode[$('#city').val()][$('#quxiao').val()] : '',
					merName : $('#merName').val(),
					merId : $('#merId').val(),
					beginTime : $('#beginTime').val(),
					endTime : $('#endTime').val(),
					manager : $('#qudaojingli').val()
				}
				downLoadCondition = condition;
				getData(condition);
				freshPage(total);
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			
			$('#down').click(function(){
				downLoadCondition.type = 1;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/addDownLoadTask2",
					async : false,
					data : JSON.stringify(downLoadCondition),
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						if(data.errmsg == "ok"){
							alert("下载任务已添加入下载队列,请稍后查看下载!");
						}
					}
				});
				return false;
			
			});
		});
	
		var cityCode = {
			610000 : {
				610100 : '西安市',
				610200 : '铜川市',
				610300 : '宝鸡市',
				610400 : '咸阳市',
				610500 : '渭南市',
				610600 : '延安市',
				610700 : '汉中市',
				610800 : '榆林市',
				610900 : '安康市',
				611000 : '商洛市'
			},
			610100 : {
				610102 : '新城区',
				610103 : '碑林区',
				610104 : '莲湖区',
				610111 : '灞桥区',
				610112 : '未央区',
				610113 : '雁塔区',
				610114 : '阎良区',
				610115 : '临潼区',
				610116 : '长安区',
				610117 : '高陵区',
				610118 : '鄠邑区',
				610122 : '蓝田县',
				610403 : '杨陵区',
				610124 : '周至县'
			},
			610200 : {
				610202 : '王益区',
				610203 : '印台区',
				610204 : '耀州区',
				610222 : '宜君县'
			},
			610300 : {
				610302 : '渭滨区',
				610303 : '金台区',
				610304 : '陈仓区',
				610322 : '凤翔县',
				610323 : '岐山县',
				610324 : '扶风县',
				610326 : '眉县',
				610327 : '陇县',
				610328 : '千阳县',
				610329 : '麟游县',
				610330 : '凤县',
				610331 : '太白县'
			},
			610400 : {
				610402 : '秦都区',
				610404 : '渭城区',
				610422 : '三原县',
				610423 : '泾阳县',
				610424 : '乾县',
				610425 : '礼泉县',
				610426 : '永寿县',
				610427 : '彬县',
				610428 : '长武县',
				610429 : '旬邑县',
				610430 : '淳化县',
				610431 : '武功县',
				610481 : '兴平市'
			},
			610500 : {
				610502 : '临渭区',
				610503 : '华州区',
				610522 : '潼关县',
				610523 : '大荔县',
				610524 : '合阳县',
				610525 : '澄城县',
				610526 : '蒲城县',
				610527 : '白水县',
				610528 : '富平县',
				610581 : '韩城市',
				610582 : '华阴市'
			},
			610600 : {
				610602 : '宝塔区',
				610603 : '安塞区',
				610621 : '延长县',
				610622 : '延川县',
				610623 : '子长县',
				610625 : '志丹县',
				610626 : '吴起县',
				610627 : '甘泉县',
				610628 : '富县',
				610629 : '洛川县',
				610630 : '宜川县',
				610631 : '黄龙县',
				610632 : '黄陵县'
			},
			610700 : {
				610702 : '汉台区',
				610703 : '南郑区',
				610722 : '城固县',
				610723 : '洋县',
				610724 : '西乡县',
				610725 : '勉县',
				610726 : '宁强县',
				610727 : '略阳县',
				610728 : '镇巴县',
				610729 : '留坝县',
				610730 : '佛坪县'
			},
			610800 : {
				610802 : '榆阳区',
				610803 : '横山区',
				610822 : '府谷县',
				610824 : '靖边县',
				610825 : '定边县',
				610826 : '绥德县',
				610827 : '米脂县',
				610828 : '佳县',
				610829 : '吴堡县',
				610830 : '清涧县',
				610831 : '子洲县',
				610881 : '神木市'
			},
			610900 : {
				610902 : '汉滨区',
				610921 : '汉阴县',
				610922 : '石泉县',
				610923 : '宁陕县',
				610924 : '紫阳县',
				610925 : '岚皋县',
				610926 : '平利县',
				610927 : '镇坪县',
				610928 : '旬阳县',
				610929 : '白河县'
			},
			611000 : {
				611002 : '商州区',
				611021 : '洛南县',
				611022 : '丹凤县',
				611023 : '商南县',
				611024 : '山阳县',
				611025 : '镇安县',
				611026 : '柞水县'
			}
		};
	</script>

</body>
</html>

