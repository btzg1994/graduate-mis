<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
	<base href="${pageContext.request.contextPath}/resources/">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <style>
        .info-box {
            height: 85px;
            background-color: white;
            background-color: #ecf0f5;
        }
        
        .info-box .info-box-icon {
            border-top-left-radius: 2px;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 2px;
            display: block;
            float: left;
            height: 85px;
            width: 85px;
            text-align: center;
            font-size: 45px;
            line-height: 85px;
            background: rgba(0, 0, 0, 0.2);
        }
        
        .info-box .info-box-content {
            padding: 5px 10px;
            margin-left: 85px;
        }
        
        .info-box .info-box-content .info-box-text {
            display: block;
            font-size: 14px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-transform: uppercase;
        }
        
        .info-box .info-box-content .info-box-number {
            display: block;
            font-weight: bold;
            font-size: 18px;
        }
        
        .major {
            font-weight: 10px;
            color: #01AAED;
        }
        
        .main {
            margin-top: 25px;
        }
        
        .main .layui-row {
            margin: 10px 0;
        }
    </style>
</head>

<body>
    <div class="layui-fluid main">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md3">
                <div class="info-box">
                    <span class="info-box-icon" style="background-color:#00c0ef !important;color:white;"><i class="fa fa-user-plus" aria-hidden="true"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">领卡总数</span>
                        <span class="info-box-number" id="total_card_num">65535</span>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="info-box">
                    <span class="info-box-icon" style="background-color:#dd4b39 !important;color:white;"><i class="fa fa-cny" aria-hidden="true"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">销券总金额</span>
                        <span class="info-box-number" id="total_money">100,0000</span>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="info-box">
                    <span class="info-box-icon" style="background-color:#00a65a !important;color:white;"><i class="fa fa-star-half-o" aria-hidden="true"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">日领卡数</span>
                        <span class="info-box-number" id="day_card_num">654</span>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="info-box">
                    <span class="info-box-icon" style="background-color:#f39c12 !important;color:white;"><i class="fa fa-send-o" aria-hidden="true"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">日销券金额</span>
                        <span class="info-box-number" id="day_money">8500</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-md12">
                <ul class="layui-timeline">
                </ul>
            </div>
        </div>
    </div>
    <script src="plugins/layui/layui.js"></script>
    <script>
        layui.use('jquery', function() {
            var $ = layui.jquery;
            $('#test').on('click', function() {
                parent.message.show({
                    skin: 'cyan'
                });
            });
        });
    </script>
</body>
</html>