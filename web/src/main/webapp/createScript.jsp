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
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>生成指定会员账户脚本测试页面</title>
	</head>
	<body>
		<div id="mainContainer">
			<h1>生成指定会员账户脚本测试页面</h1>
			<fieldset>
				<legend>
					介绍
				</legend>
				<div>
					本页面仅在测试环境使用，可根据提示输入生成指定会员账户脚本。
				</div>
			</fieldset>
			<br>
			<br>
			<fieldset>
				<legend>
					操作
				</legend>
<!-- 				<input style="height: 40px;width: 150px;" type="button"  value="随机订单" id="actRefresh" onclick='newOuterOrder()'/> -->
<!-- 				<input style="height: 40px;width: 150px;" type="button"  value="自动签名" id="actSign" onclick='getSign()'/> -->
<!-- 				<input style="height: 40px;width: 150px;" type="button" value="发起请求" id="actSend" onclick='sendRequestForOperatorSubstituteRecharge()'/> -->
				<input style="height: 40px;width: 150px;" type="button" value="生成脚本" id="createScript" onclick='createScript()'/>

			</fieldset>
			<br>
			<br>
	        <!-- -->
<%--        	<jsp:include page="./baseParams.jsp" flush="true"/> --%>
	        <!-- -->



<fieldset>
    <legend>生成指定会员账户脚本参数</legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>
     <tr>
	    <td style="vertical-align: top; width: 25%;">数据类型:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	         <select id="dbType" name="dbType">
	           	<option value="mysql">mysql</option>
	            <option value="oracle">oracle</option>
	         </select>            
	    <br>
	    </td>
	</tr>
	 <tr>
	    <td style="vertical-align: top; width: 25%; color:red">是否需要账户的初期脚本配置:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	         <select id="needConfig" name="needConfig">
	           	<option value="false">账户配置已存在，不需要提供脚本</option>
	            <option value="true">账户配置未存在，需要脚本</option>
	         </select>            
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">期望用户ID:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="member_id" name="member_id" value="期望用户ID" tooltiptext="字符串,只允许使用字母、数字、- 、_,并以字母或数字开头;每商户提交的请求号，对于商户全局唯一,不可空<br>30000043551252300"/>
	                    个人会员188888888888默认个人平台方，后续会员-1例如 188888888887，188888888886<br>
	                    企业会员288888888888默认企业平台方，后续会员-1例如 288888888887，288888888886<br>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">指定会员名称
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="member_name" name="member_name" value="会员名称" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">指定会员账户类型
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <select id="member_type" name="member_type">
	           	<option value="1">个人</option>
	            <option value="2">企业</option>
	        </select> 
	         <select id="account_sequence" name="account_sequence">
	           	<option value="01">基本户</option>
	            <option value="02">02</option>
	            <option value="03">03</option>
	            <option value="04">04</option>
	            <option value="05">05</option>
	            <option value="06">06</option>
	            <option value="07">07</option>
	            <option value="08">08</option>
	            <option value="09">09</option>
	            <option value="10">10</option>
	            <option value="11">11</option>
	            <option value="12">12</option>
	            <option value="13">13</option>
	            <option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
	        </select>  
	         <select id="account_sub_type" name="account_sub_type">
	           	<option value="all">全部子账户</option>
	            <option value="dr">只开借记户</option>
	        </select>   
	    <br>
	    </td>
	</tr>
	<!--  
	<tr>
	    <td style="vertical-align: top; width: 25%;">期望账户类型
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="account_type" name="account_type" value="账户类型" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">账户子类型
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <select id="account_sub_type" name="account_sub_type">
	           	<option value="ALL">全部</option>
	            <option value="DR">只开借记</option>
	        </select> 
	    <br>
	    </td>
	</tr>
	-->
	<tr>
	    <td style="vertical-align: top; width: 25%;">指定账户名称
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="account_name" name="account_name" value="账户名称" tooltiptext="用户ID（UID），车易拍用户手机号（MOBILE）,不可空<br>13500000000"/>
	    <br>
	    </td>
	</tr>
	<tr>
	    <td style="vertical-align: top; width: 25%;">账户请求值:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="original_request_no" name="original_request_no" value="账户请求值" tooltiptext="MA请求DPM的请求号"/>
	                    个人会员18888888888从999999801开始，后续类型只改尾两位，若其他非平台会员原则 个人会员从会员ID的尾两位+ 账户类型 <br>
	                    企业会员28888888888从999999901开始，后续类型只改尾两位，若其他非平台会员原则 企业会员从会员ID的尾两位+ 账户类型 <br>
	        <span style="color:red">******必须全局唯一，不允许重复******</span>
	       <br>
	    <br>
	    </td>
	</tr>
        </tbody>
    </table>
</fieldset>

<fieldset>
    <legend>生成指定会员账户脚本结果</legend>
    <br>
	    <div>会员信息：</div>
	    <div id="script_result_member"></div>
    <br>
	    <div>会员属性信息：</div>
	    <div id="script_result_memberType"></div>
    <br>
	    <div>会员账户信息：</div>
	    <div id="script_result_memberAccount"></div>
    <br>
	    <div>账户信息：</div>
	    <div id="script_result_account"></div>
</fieldset>

<fieldset>
    <legend>生成指定账户类型配置脚本</legend>
    <br>
	    <div>会员账户配置：</div>
	    <div id="script_result_config_account"></div>
    <br>
	    <div>账户科目信息：</div>
	    <div id="script_result_config_accountTitle"></div>
</fieldset>

<%-- 		<jsp:include page="./otherParams.jsp" flush="true"/> --%>
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

<script language="Javascript" type="text/javascript">
  function createScript(){
	  // 创建脚本
	 var dbType = $("#dbType option:selected").val();
	 var needConfig = $("#needConfig option:selected").val();
	 var memberId = $("#member_id").val();
	 var memberType = $("#member_type").val();
	 var memberName = $("#member_name").val();
	 var accountSeq = $("#account_sequence option:selected").val();
	 var accountType = memberType + accountSeq ;
	 var accountName = $("#account_name").val();
	 var accountSubType = $("#account_sub_type option:selected").val();
	 var originalRequestNo = $("#original_request_no").val();
	 // 外部账户资金科目
	 var accountTitle = "2001";
	 var accountTitleParent="2001001";
	 if("2" == memberType){
		 accountTitle +=  "0010"+ accountSeq ;
	 } else {
		 accountTitle +=  "0020"+ accountSeq ;
		 accountTitleParent="2001002";
	 }
	 var accountNo = accountTitle + memberId +"00001";
	
	 var memberStr = "";
	 var memberTypeStr = "";
	 var memberAccountStr = "";
	 var accountStr = "";
	 if (dbType == "mysql") {
		 // 会员信息
		 memberStr = "INSERT INTO member.tm_member(MEMBER_ID, MEMBER_NAME, MEMBER_TYPE, STATUS, LOCK_STATUS, FROM_IP, ACTIVE_TIME, CREATE_TIME) "+
         "VALUES ('"+memberId+"', '"+memberName+"', "+memberType+", 1, 0, NULL, now(), now());";
	 
         // 会员属性信息
		 if("2" == memberType){
	    	memberTypeStr = memberTypeStr + "INSERT INTO member.tr_company_member(MEMBER_ID, CREATE_TIME) VALUES ('"+memberId+"', now());";
	     } else {
	    	memberTypeStr = memberTypeStr + "INSERT INTO member.tr_personal_member(MEMBER_ID, DEFAULT_LOGIN_NAME, TRUE_NAME, CERT_TYPE, ID_NO, GENDER, POSTITION, CAREER, BIRTHDAY, CREATE_TIME) " +
	    	  " VALUES ('"+ memberId +"', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, now());";
	     }
		 
		 // 会员账户信息
		 memberAccountStr = "INSERT INTO member.tr_member_account(MEMBER_ID, ORIGINAL_REQUEST_NO, ACCOUNT_TYPE, ACCOUNT_ID, ACCOUNT_ATTRIBUTE, STATUS, ALIAS, CREATE_TIME, CATEGORY, TYPE_ID) "+
	      "VALUES ( '"+memberId+"', '"+originalRequestNo +"', "+accountType+", '"+ accountNo +"', "+ memberType +", 1, '"+accountName +"', now(),  'DPM', '"+accountType+"');";

	     //账户信息
		 accountStr =   
		      "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT VALUES ('"+ accountNo +"', '"+ accountTitle +"', '客户资金-'+accountName, sysdate(), '"+ memberId +"', '1000', "+memberType+", "+accountType+", 2, 2, 'CNY', sysdate(), '"+originalRequestNo+"');"+
		     "<br>" + "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'DR', NULL, 'DR资金属性', sysdate(), sysdate());";
		     if(accountSubType == 'all') {
		    	 accountStr += 
		    		 "<br>" + "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'CR', NULL, 'CR资金属性', sysdate(), sysdate());"+
				     "<br>" + "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'FR', NULL, 'FR资金属性', sysdate(), sysdate());";
		     }
	
		 if(needConfig == 'true'){
			  //会员账户配置信息
	    	  var accountConfig = "INSERT INTO MEMBER.td_account_config (ID, ACCOUNT_TYPE, MAX_ACCOUNT_COUNT, STATUS, SUPPORT_MEMBER_TYPES, MEMO, SHARE_BASE_PWD, ACCOUNT_ATTR, ACCOUNT_SUB_TYPE) VALUES ("+accountType+", "+accountType+", 1, 1, '"+memberType+"', '"+accountName+"', 0, "+memberType+","+accountType+");";
	    	  $("#script_result_config_account").html(accountConfig);
	    	  
	    	  
			  var dpmConfig	 = "INSERT INTO dpm.t_act_account_titile (TITLE_CODE, TITLE_NAME, TITLE_LEVEL, PARENT_TITLE_CODE, IS_LEAF, TYPE, BALANCE_DIRECTION, STATUS, GMT_MODIFIED, GMT_CREATE, MEMO, TITLE_RANGE) VALUES ('"+     accountTitle +"', '客户资金-"+ accountName +"', 3, '"+ accountTitleParent +"', 'Y', '"+memberType+"', 2, 'Y', sysdate(), sysdate(), '客户资金-"+accountName+"', 2);";
			  
			  //账户配置信息
	    	    dpmConfig += 
	    		   "<br><br>INSERT INTO dpm.t_dpm_account_crl_def (ACCOUNT_TITLE_ID, ACCOUNT_ATTRIBUTE, ACCOUNT_TYPE, CURRENCY_CODE, BAL_DIRECTION, STATUS, REMARK, INPUT_UID, INPUT_TIME, CHECK_UID, CHECK_TIME) VALUES ('"+accountTitle+"', "+memberType+","+accountType+", 'CNY', 2, 0, '客户资金'"+accountName + ", NULL, sysdate(), NULL, sysdate())"
	    		 + "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','DR',NULL,sysdate(),sysdate());";
	          
    		  if(accountSubType == 'all') {
    			 dpmConfig +=   "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','CR',NULL,sysdate(),sysdate());"
    		                  + "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','FR',NULL,sysdate(),sysdate());";
    		  }
    		 
    		  $("#script_result_config_accountTitle").html(dpmConfig);
	          
	     } else {
	    	  $("#script_result_config_account").html("无");
	     }
	 
	 } else {
		 //会员信息
		 memberStr = "INSERT INTO member.tm_member(MEMBER_ID, MEMBER_NAME, MEMBER_TYPE, STATUS, LOCK_STATUS, FROM_IP, ACTIVE_TIME, CREATE_TIME) "+
         "VALUES ('"+memberId+"', '"+memberName+"', "+memberType+", 1, 0, NULL, sysdate, sysdate);";
	 
         //会员属性信息
         if("2" == memberType){
	    	memberTypeStr = memberTypeStr + "INSERT INTO member.tr_company_member(MEMBER_ID, CREATE_TIME) VALUES ('"+memberId+"', sysdate);";
	     } else {
	    	memberTypeStr = memberTypeStr + "INSERT INTO member.tr_personal_member(MEMBER_ID, DEFAULT_LOGIN_NAME, TRUE_NAME, CERT_TYPE, ID_NO, GENDER, POSTITION, CAREER, BIRTHDAY, CREATE_TIME) " +
	    	  " VALUES ('"+ memberId +"', NULL, NULL, NULL, NULL, 0, 1, 1, NULL, sysdate);";
	     }
		
		 //会员账户信息
		 memberAccountStr = "INSERT INTO member.tr_member_account(ID, MEMBER_ID, ORIGINAL_REQUEST_NO, ACCOUNT_TYPE, ACCOUNT_ID, ACCOUNT_ATTRIBUTE, STATUS, ALIAS, CREATE_TIME, CATEGORY, TYPE_ID) "+
	      "VALUES ('"+ accountType +"','"+memberId+"', '"+ originalRequestNo +"', "+accountType+", '"+ accountNo +"', "+ memberType +", 1, '"+accountName +"', sysdate,  'DPM', '"+accountType+"');";

	     //账户信息
	     accountStr =   
		              "<br>INSERT INTO dpm.T_DPM_OUTER_ACCOUNT VALUES ('"+ accountNo +"', '"+ accountTitle +"', '客户资金-"+accountName+"', sysdate, '"+ memberId +"', '1000', "+memberType+", "+accountType+", 2, 2, 'CNY', sysdate, '"+originalRequestNo+"');" 
		             + "<br>INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'DR', NULL, 'DR资金属性', sysdate, sysdate);";
         
		     if(accountSubType == 'all') {
		        accountStr +=  "<br>" + "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'CR', NULL, 'CR资金属性', sysdate, sysdate);"+
		                       "<br>" + "INSERT INTO dpm.T_DPM_OUTER_ACCOUNT_SUBSET VALUES ('"+ accountNo +"', 0.0000, 'FR', NULL, 'FR资金属性', sysdate, sysdate);";
   		     }
		
			 if(needConfig == 'true'){
				  //会员账户配置信息 
				  var accountConfig = "INSERT INTO MEMBER.td_account_config (ID, ACCOUNT_TYPE, MAX_ACCOUNT_COUNT, STATUS, SUPPORT_MEMBER_TYPES, MEMO, SHARE_BASE_PWD, ACCOUNT_ATTR, ACCOUNT_SUB_TYPE) VALUES ("+accountType+", "+accountType+", 1, 1, '"+memberType+"', '"+accountName+"', 0, "+memberType+","+accountType+");";
		    	  $("#script_result_config_account").html(accountConfig);
				  
				 var dpmConfig = "<br>INSERT INTO dpm.t_act_account_titile (TITLE_SEQ_NO,TITLE_CODE, TITLE_NAME, TITLE_LEVEL, PARENT_TITLE_CODE, IS_LEAF, TYPE, BALANCE_DIRECTION, STATUS, GMT_MODIFIED, GMT_CREATE, MEMO, TITLE_RANGE) VALUES (dpm.SEQ_ACCOUNT_TITILE.nextval,'"+ accountTitle +"', '客户资金-"+accountName +"', 3, '"+accountTitleParent+"', 'Y', '"+memberType+"', 2, 'Y', sysdate, sysdate, '客户资金-"+accountName+"', 2);";
				  
		    	  //账户配置信息
		    	  dpmConfig += 
				     "<br><br>INSERT INTO dpm.t_dpm_account_crl_def (ACCOUNT_TITLE_ID, ACCOUNT_ATTRIBUTE, ACCOUNT_TYPE, CURRENCY_CODE, BAL_DIRECTION, STATUS, REMARK, INPUT_UID, INPUT_TIME, CHECK_UID, CHECK_TIME) VALUES ('"+accountTitle+"', "+memberType+","+accountType+", 'CNY', 2, 0, '客户资金-商户-放款专用过渡户', NULL, sysdate, NULL, sysdate);"
		    		+ "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','DR',NULL,sysdate,sysdate);";
		         
	    		 if(accountSubType == 'all') {
	    			 dpmConfig +=   "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','CR',NULL,sysdate,sysdate);"
	    		                  + "<br><br>INSERT INTO DPM.t_dpm_subacc_fundattribute (ACCOUNT_TYPE,CURRENCY_CODE,FUND_TYPE,REMARK,GMT_CREATED,GMT_MODIFIED) VALUES ("+accountType+",'CNY','FR',NULL,sysdate,sysdate);";
	    		 }
	    		 $("#script_result_config_accountTitle").html(dpmConfig);
		    
			 } else {
		    	  $("#script_result_config_account").html("无");
		     }
	 }
	 $("#script_result_member").html(memberStr);
     
     $("#script_result_memberType").html(memberTypeStr);
    
     $("#script_result_memberAccount").html(memberAccountStr);

     $("#script_result_account").html(accountStr);

  }
</script>

