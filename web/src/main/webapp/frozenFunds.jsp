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
		<title>冻结资金网关测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>冻结资金网关测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试冻结资金网关。
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
    <legend>冻结资金业务参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>

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
	    <td style="vertical-align: top; width: 25%;">车易拍用户Id:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="identity_no" name="identity_no" value="9187437612" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">车易拍用户Id类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="identity_type" name="identity_type" value="UID" tooltiptext="表明ID的类型，有这几种：UID/MOBILE,不可空<br>MOBILE"/>
	    <br>
	    </td>
	</tr>

	<tr>
	    <td style="vertical-align: top; width: 25%;">账户类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="account_type" name="account_type" value="101" tooltiptext="目前只支持对私基本户和保证金户"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">冻结资金属性:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="fund_prop_type" name="fund_prop_type" value="DR" tooltiptext="DR：借记资金；CR：贷记资金。默认：DR"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">冻结金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="amount" name="amount" value="100.00" tooltiptext="金额必须大于0<br>25"/>
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

