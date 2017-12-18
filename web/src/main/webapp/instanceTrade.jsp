<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.netfinworks.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.netfinworks.tpu.web.util.ConfigUtil" %>
<%
ConfigUtil configUtil = SpringContextHolder.getBean("configUtil");
String tpuUrl = configUtil.getTpuAddressUrl();
String service = request.getParameter("service");
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
		<title>即时到账交易测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>即时到账交易测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试即时到账交易。
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
	     	  即时到账业务参数
		</legend>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>


<tr>
    <td style="vertical-align: top; width: 25%;">商户网站请求号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="request_no" name="request_no" value="c009" tooltiptext="钱包合作商户请求号,不可空<br>订单编号：20131105154925">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">交易列表:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="trade_list" name="trade_list" value="不可空" tooltiptext="参见“2.3.2交易参数”,参数按表中的顺序，商品参数间用”~”间隔，每批商品用”$”间隔。如果有中间的参数为空，需要用”~”占位。建议商品数量不超过5个。<br>不可空">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">操作员Id:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="operator_id" name="operator_id" value="10005454" tooltiptext="运营平台操作者登录Id,可空">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">买家ID:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="buyer_id" name="buyer_id" value="9187437611" tooltiptext="不可空(匿名支付可空)">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">买家ID类型:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <div id="identityType"></div>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">买家手机:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="buyer_mobile" name="buyer_mobile" value="13812345678" tooltiptext="不可空(匿名支付可空)<br>MOBILE">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">用户在商户平台下单时候的ip地址:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="buyer_ip" name="buyer_ip" value="102.122.12.45" tooltiptext="用户在商户平台下单的时候的ip地址，公网IP，不是内网IP;用于风控校验,可空<br>202.114.12.45">
    <br>
    </td>
</tr>

           </tbody>
       </table>
       </fieldset>

       <fieldset>
		<legend>
      		即时到账支付参数
		</legend>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>


<tr>
    <td style="vertical-align: top; width: 25%;">支付方式:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" type="hidden" id="pay_method" name="pay_method" value="" />
    <input style="width: 100%;" id="pay_method_src" name="pay_method_src" value="online_bank" 
    tooltiptext="取值范围：pos（POS支付）online_bank (网银支付)，如果不设置支付方式，默认识跳转收银台，在收银台选择支付渠道" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>
<tr>
    <td style="vertical-align: top; width: 25%;">支付金额:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="pay_amount_src" name="pay_amount_src" value="0.20" 
    tooltiptext="单位为：RMB Yuan。取值范围为[0.01，1000000.00]，精确到小数点后两位。,不可空。" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>
<tr>
    <td style="vertical-align: top; width: 25%;">支付备注:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="pay_ext_src" name="pay_ext_src" value="TESTBANK,C,DC" 
    tooltiptext="pos支付备注为：操作员ID，现金存根号<br>网银支付备注为：银行号，对公/对私，借记/贷记(对公/对私：B/C;借记/贷记：DC=借记，CC=贷记，GC=综合) 必须注意区分大小写。" onchange="changePayMethod()"/>
    <br>
    </td>
</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">是否转收银台:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="go_cashier" name="go_cashier" value="Y" tooltiptext="取值有以下情况：Y使用(默认值) ,跳转收银台;N不使用;说明：只有需要跳转收银台时，此参数才有效,可空<br>Y"/>
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
		<tr>
	    <td style="vertical-align: top; width: 25%;">是否匿名支付:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="is_anonymous" name="is_anonymous" value="N" tooltiptext="取值有以下情况：Y，匿名支付 ，N（默认），登录收银台支付<br>"/>
	    <br>
	    </td>
	    </tr>
    <tr>

    </tr>
		<tr>
	    <td style="vertical-align: top; width: 25%;">支付渠道参数:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="pay_channel_extension" name="pay_channel_extension" value="{'name':'zhangsan'}" tooltiptext="透传至渠道的扩展参数，禁止使用：payerIp、webDomain、whiteChannelCode、PAGE_URL做KEY值<br>"/>
	    <br>
	    </td>
	    </tr>
    <tr>
           </tbody>
       </table>
       </fieldset>


       <fieldset>
		<legend>
	       	即时到账交易参数
		</legend>
		<input style="height: 40px;width: 150px;" type="button"  value="新的交易信息" id="newAssembledTradeInfo" onclick='newTradeInfo("trade_list","~");'>
		<input style="height: 40px;width: 150px;" type="button"  value="添加交易信息" id="addAssembledTradeInfo" onclick='addTradeInfo("trade_list","~","$");'>
		<input style="height: 40px;width: 150px;" type="button"  value="显示交易信息" id="viewAssembledTradeInfo" onclick='alert(assembleTradeInfo("$"));'>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>
<tr>
    <td style="vertical-align: top; width: 25%;">商户网站唯一订单号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam1" name="tradeParam1" value="2013112405056743" tooltiptext="钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。,不可空<br>2013112405056743">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商品名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam2" name="tradeParam2" value="东风雪铁龙" tooltiptext="商品的标题/交易标题/订单标题/订单关键字等。该参数最长为128个汉字。,不可空<br>油漆">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商品单价:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam3" name="tradeParam3" value="0.10" tooltiptext="单位为：RMB Yuan。取值范围为[0.01，1000000.00]，精确到小数点后两位。,不可空<br>115">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商品数量:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam4" name="tradeParam4" value="2" tooltiptext="商品的数量。,不可空<br>2">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">交易金额:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam5" name="tradeParam5" value="0.20" tooltiptext="#NAME?,不可空<br>230">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">交易金额分润账号集:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam6" name="tradeParam6" value="" tooltiptext="参见“2.3.4 royalty_parameters参数说明”。,可空<br>参见“2.3.4 royalty_parameters参数说明”">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卖家标示ID:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam7" name="tradeParam7" value="9187437612" tooltiptext="用户ID（UID）<br>不可空">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卖家标示ID类型:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input type="hidden" style="width: 100%;" id="tradeParam8" name="tradeParam8" value="UID" tooltiptext="表明ID的类型,UID,不可空<br>UID">
    <select style="width: 100%;" class="default-q"  id="identityType2" name="identityType2"></select>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卖家手机号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam9" name="tradeParam9" value="13855462942" tooltiptext="卖家手机号,不可空">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商品描述:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam10" name="tradeParam10" value="爱丽舍-三厢 1.6 MT" tooltiptext="对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。,可空<br>白色墙面漆 5KG">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商品展示URL:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam11" name="tradeParam11" value="http://www.test.com/?product-9.html" tooltiptext="收银台页面上，商品展示的超链接。,可空<br>http://www.test.com/?product-9.html">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">商户订单提交时间:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam12" name="tradeParam12" value="20140526090530"  tooltiptext="数字串，一共14位格式为：年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位] ,可空<br>0">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">服务器异步通知页面路径:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam13" name="tradeParam13" value="<%= tpuUrl %>/mag/asynNotify.do" tooltiptext="异步通知调用方，表示成功或失败,不可空<br>http://*.com/tpu/mag/asynNotify.do"/>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">支付过期时间:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam14" name="tradeParam14" value="7d" tooltiptext="设置未付款交易的超时时间，一旦超时，该笔交易就会自动被关闭。取值范围：1m～15d。m-分钟，h-小时，d-天。该参数数值不接受小数点，如1.5h，可转换为90m。可空">
    <br>
    </td>
</tr>
<tr>
    <td style="vertical-align: top; width: 25%;">店铺名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="tradeParam15" name="tradeParam15" value="上海大众4S店" tooltiptext="具体交易发生的店铺名称。可空">
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
			changePayMethod();
			//newOrder();
			
			$(document).ready(function() { 
				$.ajax({
        			type: 'POST',
        			url: "mag/identity_type.do",
        			success: function(data) {
        				var identityTypes=data.split(",");
        				var selectStr = '<select style="width: 100%;" class="default-q"  id="buyer_id_type" name="buyer_id_type">';
        				$.each(identityTypes,function(){
        					selectStr += '<option value='+this+'>'+this+'</option>';
        				});
        				selectStr += "<option value=''></option>";
        				selectStr += '</select>';
        				$("#identityType").html(selectStr);
        				var selectStr2 = '';
        				$.each(identityTypes,function(){
        					selectStr2 += '<option value='+this+'>'+this+'</option>';
        				});
        				selectStr2 += "<option value=''></option>";
        				$("#identityType2").html(selectStr2);
        				$('#identityType2').change(function(){        					 
        					$("#tradeParam8").val($(this).children('option:selected').val());
        				});
	          	 	 } ,
       				 dataType: "text"
    			});
				})
		</script>
		<br>
		<br>
		<br>
	</body>
</html>
