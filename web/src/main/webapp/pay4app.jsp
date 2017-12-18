<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta name="generator"
          content="HTML Tidy for Mac OS X (vers 31 October 2006 - Apple Inc. build 15.6), see www.w3.org">
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
    <title>批量支付测试页面（APP）</title>
</head>
<body>
<div id="mainContainer">
    <h1>批量支付测试页面（APP）</h1>
    <fieldset>
        <legend>
            介绍
        </legend>
        <div>
            本页面仅在测试环境使用，可根据提示输入参数测试批量支付。
        </div>
    </fieldset>
    <br>
    <br>
    <fieldset>
        <legend>
            操作
        </legend>
        <input style="height: 40px;width: 150px;" type="button" value="随机订单" id="actRefresh" onclick='newOrder()'/>
        <input style="height: 40px;width: 150px;" type="button" value="自动签名" id="actSign" onclick='doSign()'/>
        <input style="height: 40px;width: 150px;" type="button" value="发起请求" id="actSend" onclick='doSendRequest()'/>

    </fieldset>
    <br>
    <br>
    <!-- -->
    <jsp:include page="./baseParams.jsp" flush="true"/>
    <!-- -->

    <fieldset>
        <legend>
            批量支付业务参数
        </legend>
        <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
            <tbody>


            <tr>
                <td style="vertical-align: top; width: 25%;">商户网站请求号:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="request_no" name="request_no"
                           value="20131105154925" tooltiptext="钱包合作商户请求号,不可空<br>订单编号：20131105154925"/>
                    <br>
                </td>
            </tr>

            <tr>
                <td style="vertical-align: top; width: 25%;">商户网站唯一订单号集合:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="outer_trade_no_list" name="outer_trade_no_list"
                           value="2013112405052132^2013112405052233"
                           tooltiptext="钱包合作商户网站唯一订单号（确保在合作伙伴系统中唯一）。总数不超过十笔,不可空<br>2013112405052132^2013112405052233"/>
                    <br>
                </td>
            </tr>

            <tr>
                <td style="vertical-align: top; width: 25%;">操作员Id:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="operator_id" name="operator_id" value="10005454"
                           tooltiptext="代付操作的操作员,可空<br>1000002356"/>
                    <br>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 25%;">买家登陆Token:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="token" name="token" value="" tooltiptext="用于验证用户登陆状态，可空。">
                    <br>
                </td>
            </tr>
            </tbody>
        </table>
    </fieldset>


    <fieldset>
        <legend>
            批量支付支付参数
        </legend>
        <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
            <tbody>


            <tr>
                <td style="vertical-align: top; width: 25%;">支付方式:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="pay_method" name="pay_method" value=""
                           tooltiptext="取值范围： cash（现金），pos（POS支付）， online_bank(网银支付)，balance(余额),可空<br>cash^25.00^操作员ID(必填)|pos^100.00^|balance^25.00^|online_bank ^75.00^银行编码"/>
                    <br>
                </td>
            </tr>

            <tr>
                <td style="vertical-align: top; width: 25%;">是否匿名支付:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="is_anonymous" name="is_anonymous" value="N"
                           tooltiptext="取值有以下情况：Y，匿名支付 ，N（默认），登录收银台支付<br>"/>
                    <br>
                </td>
            </tr>

            <tr>
                <td style="vertical-align: top; width: 25%;">用户在商户平台支付时候的ip地址:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="buyer_ip" name="buyer_ip" value="202.114.12.45"
                           tooltiptext="用户在商户平台下单的时候的ip地址，公网IP，不是内网IP,可空<br>202.114.12.45"/>
                    <br>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 25%;">是否转收银台:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="go_cashier" name="go_cashier" value="Y"
                           tooltiptext="取值有以下情况：Y使用(默认值) ,跳转收银台;N不使用;说明：只有需要跳转收银台时，此参数才有效,可空<br>Y"/>
                    <br>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 25%;">是否WEB访问:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="is_web_access" name="is_web_access" value="Y"
                           tooltiptext="取值有以下情况：Y，网站访问 ，跳转PC版收银台;N（默认），手机访问，跳转手机版收银台<br>Y"/>
                    <br>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 25%;">是否是APP访问:
                    <br>
                </td>
                <td style="vertical-align: top; width: 75%;">
                    <input style="width: 100%;" class="default-q" id="is_app_access" name="is_app_access" value="Y"
                           tooltiptext="取值有以下情况：Y使用(默认值) ，N不使用（WAP端访问）。"/>
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

