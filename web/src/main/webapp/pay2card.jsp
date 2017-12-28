<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tigerft.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.tigerft.tpu.web.util.ConfigUtil" %>
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
		<title>付款到卡网关测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>付款到卡网关测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入参数测试付款到卡网关。
				</div>
			</fieldset>
			<br>
			<br>
			<fieldset>
				<legend>
					操作
				</legend>
				<input style="height: 40px;width: 150px;" type="button"  value="加密" id="actEncrypt" onclick='getEncrypt()'/>
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
    <legend>付款到卡业务参数</legend>
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
	    <td style="vertical-align: top; width: 25%;">会员标识号:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="identity_no" name="identity_no" value="9187437612" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>


	<tr>
	    <td style="vertical-align: top; width: 25%;">标识类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input type="hidden" style="width: 100%;" class="default-q" id="identity_type" name="identity_type" value="UID" tooltiptext="表明ID的类型，有这几种：UID/MOBILE,不可空<br>MOBILE"/>
	        <select style="width: 100%;" class="default-q"  id="identityType2" name="identityType2"></select>
	    <br>
	    </td>
	</tr>

	<tr>
	    <td style="vertical-align: top; width: 25%;">金额:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="amount" name="amount" value="0.01" tooltiptext="单位为：RMB Yuan。取值范围为[0.01，1000000.00]，精确到小数点后两位。,不可空<br>25"/>
	    <br>
	    </td>
	</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卡号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-e" id="bank_account_no_src" name="bank_account_no_src" value="6214830215878947" tooltiptext="请输入卡号明文，然后点击加密">
    <input style="width: 100%;background-color:transparent" class="default-q" id="bank_account_no" name="bank_account_no" readonly  />
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">账户名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-e" id="account_name_src" name="account_name_src" value="测试01" tooltiptext="请输入账户明文，然后点击加密">
    <input style="width: 100%;background-color:transparent" class="default-q" id="account_name" name="account_name"  readonly  />
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">银行编码:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="bank_code" name="bank_code" value="CMB" tooltiptext="银行编号 见附录">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">银行名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="bank_name" name="bank_name" value="招商银行" tooltiptext="银行全称 见附录">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">支行名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="bank_branch" name="bank_branch" value="中国招商银行上海市浦建路支行" tooltiptext="">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">支行号:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="bank_line_no" name="bank_line_no" value="102290013891" tooltiptext="银行分支行号">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">银行省份:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="province" name="province" value="上海市" tooltiptext="">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">银行城市:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="city" name="city" value="上海市" tooltiptext="">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卡类型:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="card_type" name="card_type" value="DEBIT" tooltiptext="DEBIT 借记,CREDIT 贷记">
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">卡属性:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="card_attribute" name="card_attribute" value="C" tooltiptext="对公/B, 对私/C">
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
			$(document).ready(function() { 
				$.ajax({
        			type: 'POST',
        			url: "mag/identity_type.do",
        			success: function(data) {
        				var identityTypes=data.split(",");        				
        				var selectStr2 = '';
        				$.each(identityTypes,function(){
        					selectStr2 += '<option value='+this+'>'+this+'</option>';
        				});
        				selectStr2 += "<option value=''></option>";
        				$("#identityType2").html(selectStr2);
        				$('#identityType2').change(function(){        					 
        					$("#identity_type").val($(this).children('option:selected').val());
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

