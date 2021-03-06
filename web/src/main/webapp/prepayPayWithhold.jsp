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
		<title>定金扣款测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>定金扣款测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试定金下定。
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
    <legend>定金下定业务参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户网站请求号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="outer_trade_no" name="outer_trade_no" value="2013112405000020" tooltiptext="钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。,不可空<br>2013112405000020"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">原始的商户订金下订唯一订单号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="orig_outer_trade_no" name="orig_outer_trade_no" value="2014091614531058702473398298" tooltiptext="原始的商户订金下订唯一订单号。,不可空<br>2013112405000020"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">赔偿订金金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="amount" name="amount" value="3.00" tooltiptext="运营平台操作者登录Id,可空"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">交易金额分润账号集:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="royalty_parameters" name="royalty_parameters" value="9:200001010^3:101^4:1.00|12:100000011580^3:101^4:2.00" tooltiptext="UID1^收款方账号类型1^金额1 |UID2^收款方账号类型2^金额2<br>"/>
	    <br>
	    </td>
	</tr>
	
	<tr>
	    <td style="vertical-align: top; width: 25%;">异步回调地址:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="notify_url" name="notify_url" value="" tooltiptext="异步回调齐家，表示成功或失败,不可空<br>http://www.test.com/callback.htm"/>
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
