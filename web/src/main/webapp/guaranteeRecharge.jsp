<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.netfinworks.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.netfinworks.tpu.web.util.ConfigUtil" %>
<%
ConfigUtil configUtil = SpringContextHolder.getBean("configUtil");
String tpuUrl = configUtil.getTpuAddressUrl();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta name="generator" content="HTML Tidy for Mac OS X (vers 31 October 2006 - Apple Inc. build 15.6), see www.w3.org">
		<link rel="stylesheet" href="css/form-field-tooltip.css" media="screen" type="text/css">
		<link rel="stylesheet" href="css/default.css" media="screen" type="text/css">
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/rounded-corners.js"></script>
		<script type="text/javascript" src="js/form-field-tooltip.js"></script>
		<script type="text/javascript" src="js/dateformat.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
		<script language="Javascript" type="text/javascript">

		</script>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>保证金充值网关测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>保证金充值网关测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试保证金充值网关。
				</div>
			</fieldset>
			<br>
			<br>
			<fieldset>
				<legend>
					操作
				</legend>
				<input style="height: 40px;width: 150px;" type="button"  value="随机订单" id="actRefresh" onclick='newOuterOrder()'/>
				<input style="height: 40px;width: 150px;" type="button"  value="自动签名" id="actSign" onclick='getSign()'/>
				<input style="height: 40px;width: 150px;" type="button" value="发起请求" id="actSend" onclick='sendRequestForOperatorSubstituteRecharge()'/>

			</fieldset>
			<br>
			<br>
	        <!-- -->
       	<jsp:include page="./baseParams.jsp" flush="true"/>
	        <!-- -->



<fieldset>
    <legend>保证金充值业务参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>


	<tr>
	    <td style="vertical-align: top; width: 25%;">收款方ID:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="identity_no" name="identity_no" value="9187437612" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">收款方ID类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="identity_type" name="identity_type" value="UID" tooltiptext="表明ID的类型，有这几种：UID/MOBILE,不可空<br>MOBILE"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户网站唯一订单号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="outer_trade_no" name="outer_trade_no" value="30000043551252300" tooltiptext="字符串,只允许使用字母、数字、- 、_,并以字母或数字开头;每商户提交的请求号，对于商户全局唯一,不可空<br>30000043551252300"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">充值金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="amount" name="amount" value="100.00" tooltiptext="单位为：RMB Yuan。取值范围为[0.01，1000000.00]，精确到小数点后两位。,不可空<br>25"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">是否是WEB跳转:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="is_web_access" name="is_web_access" value="Y" tooltiptext=""/>
	    <br>
	    </td>
	</tr>


<!-- 	<tr>
	    <td style="vertical-align: top; width: 25%;">操作员Id:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="operator_id" name="operator_id" value="1000002356" tooltiptext="操作代充的操作员,不可空<br>1000002356"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户转账提交时间:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q trade-timestamp" id="submit_time" name="submit_time" value="20140617020101" tooltiptext="数字串，一共14位,格式为：年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位],不可空<br>20071117020101"/>
	    <br>
	    </td>
	</tr>

	<tr>
	    <td style="vertical-align: top; width: 25%;">扩展字段1:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="ext1" name="ext1" value="" tooltiptext="支付方式的补充信息(现金放存根号),可空；如果是现金（cash）,必填现金存根号"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">扩展字段2:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="ext2" name="ext2" value="" tooltiptext="支付方式的补充信息(备用),可空"/>
	    <br>
	    </td>
	</tr>
 -->

	<tr>
	    <td style="vertical-align: top; width: 25%;">异步回调地址:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="notify_url" name="notify_url" value="<%= tpuUrl %>/mag/asynNotify.do" tooltiptext="异步通知调用方，表示成功或失败,不可空<br>http://*.com/tpu/mag/asynNotify.do"/>
	    <br>
	    </td>
	</tr>

        </tbody>
    </table>
</fieldset>



		<jsp:include page="./otherParams.jsp" flush="true"/>
		</div>
		<script language="Javascript" type="text/javascript">
			var tooltipObj = new DHTMLgoodies_formTooltip();
			tooltipObj.setTooltipPosition('right');
			tooltipObj.setPageBgColor('#EEEEEE');
			tooltipObj.setTooltipCornerSize(15);
			tooltipObj.initFormFieldTooltip();
			//newOrder();
		</script>
		<br>
		<br>
		<br>
	</body>
</html>

