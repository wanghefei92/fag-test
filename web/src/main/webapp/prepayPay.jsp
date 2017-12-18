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
		<title>定金下定测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>定金下定测试页面</h1>
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
    <legend>定金下定业务参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户网站请求号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="request_no" name="request_no" value="2013112405000020" tooltiptext="钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。,不可空<br>2013112405000020"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">订金下订批量数据:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="prepay_list" name="prepay_list" value="2013112405052142^500.00^13500000000^MOBILE ^001^|2013112405052156^6000.00^1000045343^UID^002^" tooltiptext="参数见2.9.2,,不可空<br>2013112405052142^500.00^13500000000^MOBILE ^001^|2013112405052156^6000.00^1000045343^UID^002^"/>
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
	    <td style="vertical-align: top; width: 25%;">买家ID:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="buyer_id" name="buyer_id" value="13812345678" tooltiptext="齐家ID（UID），钱包ID（MEMBER_ID），手机号（MOBILE）,齐家登录名（LOGIN_NAME）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">买家ID类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="buyer_id_type" name="buyer_id_type" value="MOBILE" tooltiptext="表明ID的类型，有这几种：UID/MEMBER_ID /MOBILE/LOGIN_NAME/COMPANY_ID,不可空<br>MOBILE"/>
	    <br>
	    </td>
	</tr>


	<tr>
    <td style="vertical-align: top; width: 25%;">支付方式:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" type="hidden" id="pay_method" name="pay_method" value="" />
    <input style="width: 100%;" id="pay_method_src" name="pay_method_src" value="" 
    tooltiptext="取值范围：pos（POS支付）online_bank (网银支付)，如果不设置支付方式，默认识跳转收银台，在收银台选择支付渠道" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>
<tr>
    <td style="vertical-align: top; width: 25%;">支付金额:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="pay_amount_src" name="pay_amount_src" value="" 
    tooltiptext="单位为：RMB Yuan。取值范围为[0.01，1000000.00]，精确到小数点后两位。,不可空。" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>
<tr>
    <td style="vertical-align: top; width: 25%;">支付备注:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="pay_ext_src" name="pay_ext_src" value="" 
    tooltiptext="pos支付备注为：操作员ID，现金存根号<br>网银支付备注为：银行号，对公/对私，借记/贷记(对公/对私：B/C;借记/贷记：DC=借记，CC=贷记，GC=综合) 必须注意区分大小写。" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">是否转收银台标识:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="go_cashier" name="go_cashier" value="Y" tooltiptext="取值有以下情况：
  Y使用(默认值) ,跳转收银台
  N不使用
说明：只有需要跳转收银台时，此参数才有效,可空<br>Y"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">是否WEB访问:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="is_web_access" name="is_web_access" value="Y" tooltiptext="取值有以下情况：Y，网站访问 ，跳转PC版收银台;N（默认），手机访问，跳转手机版收银台<br>Y"/>
	    <br>
	    </td>
	</tr>

        </tbody>
    </table>
</fieldset>


<fieldset>
    <legend>定金下定交易参数</legend>
    <input style="height: 40px;width: 150px;" type="button"  value="新的交易信息" id="newAssembledTradeInfo" onclick='newTradeInfo("prepay_list","^");'/>
		<input style="height: 40px;width: 150px;" type="button"  value="添加交易信息" id="addAssembledTradeInfo" onclick='addTradeInfo("prepay_list","^","|");'/>
		<input style="height: 40px;width: 150px;" type="button"  value="显示交易信息" id="viewAssembledTradeInfo" onclick='alert(assembleTradeInfo("^"));'/>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>


	<tr>
	    <td style="vertical-align: top; width: 25%;">商户网站唯一订单号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam1" name="tradeParam1" value="201311240503143" tooltiptext="钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。,不可空<br>201311240503143"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">订金金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam2" name="tradeParam2" value="300" tooltiptext="单位为：RMB Yuan，精确到小数点后两位。,不可空<br>300"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">卖家ID:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam3" name="tradeParam3" value="13855462942" tooltiptext="齐家ID（UID），钱包ID（MEMBER_ID），手机号（MOBILE）,齐家登录名（LOGIN_NAME）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">卖家ID类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam4" name="tradeParam4" value="MOBILE" tooltiptext="表明ID的类型，有这几种：UID/MEMBER_ID /MOBILE/LOGIN_NAME,不可空<br>MOBILE"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">业务号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam5" name="tradeParam5" value="1" tooltiptext="齐家对账用，无唯一性要求,不可空"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">服务器异步通知页面路径:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="tradeParam6" name="tradeParam6" value="http://mas.test.qijia.net/atinterface/receive_notify.htm" tooltiptext="钱包服务器主动通知商户网站里指定的页面http路径。,可空<br>http://mas.test.qijia.net/atinterface/receive_notify.htm"/>
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
