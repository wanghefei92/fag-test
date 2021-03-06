<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<title>结算(分账)测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>结算(分账)测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试结算(分账)。
				</div>
			</fieldset>
			<br>
			<br>
			<fieldset>
				<legend>
					操作
				</legend>
				<input style="height: 40px;width: 150px;" type="button"  value="随机订单" id="actRefresh" onclick='newOrder()'/>
				<input style="height: 40px;width: 150px;" type="button"  value="自动签名" id="actSign" onclick='getSign()'/>
				<input style="height: 40px;width: 150px;" type="button" value="发起请求" id="actSend" onclick='sendRequest()'/>

			</fieldset>
			<br>
			<br>
	        <!-- -->
		<jsp:include page="./baseParams.jsp" flush="true"/>
	        <!-- -->


       <fieldset>
		<legend>
	      	 结算网关业务参数
		</legend>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>


<tr>
    <td style="vertical-align: top; width: 25%;">商户网站请求号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="request_no" name="request_no" value="订单编号：20131105154925" tooltiptext="钱包合作商户请求号,不可空<br>订单编号：20131105154925"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">原始的商户网站唯一订单号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="outer_trade_no" name="outer_trade_no" value="2013112405052323" tooltiptext="原始的钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。同交易中的一致。,不可空<br>2013112405052323"/>
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
    <input style="width: 100%;" class="default-q" id="operator_id" name="operator_id" value="10005454" tooltiptext="结算操作的操作员,不可空<br>1000002356"/>
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
