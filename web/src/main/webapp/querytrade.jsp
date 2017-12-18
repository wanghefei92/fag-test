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
		<title>交易查询测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>交易查询测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试交易查询。
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
	      	 交易查询网关业务参数
		</legend>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>

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
				    <td style="vertical-align: top; width: 25%;">交易类型:
				    <br>
				    </td>
				    <td style="vertical-align: top; width: 75%;">
				    <input style="width: 100%;" class="default-q" id="trade_type" name="trade_type" value="INSTANT" tooltiptext="交易的类型类型包括即时到账(INSTANT)，担保交易(ENSURE)，退款(REFUND),提现（WITHDRAWAL）,定金下定（PREPAY）"/>
				    <br>
				    </td>
				</tr>

				<tr>
				    <td style="vertical-align: top; width: 25%;">开始时间:
				        <br>
				    </td>
				    <td style="vertical-align: top; width: 75%;">
				        <input style="width: 100%;" class="default-q" id="start_time" name="start_time" value="20140101020101" tooltiptext="数字串，一共14位,格式为：年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位],不可空<br>20071117020101"/>
				    <br>
				    </td>
				</tr>

				<tr>
				    <td style="vertical-align: top; width: 25%;">结束时间:
				        <br>
				    </td>
				    <td style="vertical-align: top; width: 75%;">
				        <input style="width: 100%;" class="default-q trade-timestamp" id="end_time" name="end_time" value="20140617020101" tooltiptext="数字串，一共14位,格式为：年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位],不可空<br>20071117020101"/>
				    <br>
				    </td>
				</tr>

				<tr>
				    <td style="vertical-align: top; width: 25%;">钱包交易号:
				    <br>
				    </td>
				    <td style="vertical-align: top; width: 75%;">
				    <input style="width: 100%;" class="default-q" id="inner_trade_no" name="inner_trade_no" value="" tooltiptext="如果交易类型为提现，此字段不可空，并填写“提现号”，提现号是钱包提现完成时，通知车易拍及用户的号码"/>
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
