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
		<title>退款网关接口测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>退款网关接口测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试退款网关接口。
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
				<input style="height: 40px;width: 150px;" type="button" value="发起请求" id="actSend" onclick='sendRequest()'/>

			</fieldset>
			<br>
			<br>
	        <!-- -->
       	<jsp:include page="./baseParams.jsp" flush="true"/>
	        <!-- -->


<fieldset>
    <legend>退款业务参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户网站唯一订单号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="outer_trade_no" name="outer_trade_no" value="30000043551252300" tooltiptext="字符串;只允许使用字母、数字、- 、_,并以字母或数字开头；每商户提交的请求号，对于商户全局唯一,必填<br>30000043551252300"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">原始的商户网站唯一订单号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="orig_outer_trade_no" name="orig_outer_trade_no" value="2013112405052320" tooltiptext="原始的钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。同交易中的一致。,不可空<br>2013112405052320"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">退款金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="refund_amount" name="refund_amount" value="10" tooltiptext="支持部分退款，退款金额不能大于交易金额。单位为：RMB Yuan，精确到小数点后两位。缺省值为0元。,不可空<br>50"/>
	    <br>
	    </td>
	</tr>

	<tr>
	    <td style="vertical-align: top; width: 25%;">退款担保金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="refund_ensure_amount" name="refund_ensure_amount" value="10" tooltiptext="退款金额>=退款担保金额。单位为：RMB Yuan，精确到小数点后两位。缺省值为0元。,可空<br>50"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">交易金额分润账号集:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="royalty_parameters" name="royalty_parameters" value="" tooltiptext="参见“2.3.4 royalty_parameters参数说明”。,可空<br>参见“2.3.4 royalty_parameters参数说明”"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">操作员Id:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="operator_id" name="operator_id" value="" tooltiptext="运营平台操作者登录Id,可空"/>
	    <br>
	    </td>
	</tr>


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

