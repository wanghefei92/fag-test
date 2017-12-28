<%@ page import="com.tigerft.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.tigerft.tpu.web.util.ConfigUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ConfigUtil configUtil = SpringContextHolder.getBean("configUtil");
String tpuAddressUrl = configUtil.getTpuAddressUrl();
String service = request.getParameter("service");
%>

       <fieldset>
		<legend>
		请求基本参数
		</legend>
       <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
           <tbody>


<tr>
    <td style="vertical-align: top; width: 25%;">接口名称:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="service" name="service" value="<%=service %>" tooltiptext="接口名称。,不可空<br>create_instant_trade"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">接口版本:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="version" name="version" value="1.0" tooltiptext="接口版本，目前只有固定值1.0,不可空<br>1"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">合作者身份ID:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="partner_id" name="partner_id" value="188888888888" tooltiptext="签约合作方的钱包唯一用户号。,不可空<br>188888888888"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">参数编码字符集:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="_input_charset" name="_input_charset" value="UTF-8" tooltiptext="商户网站使用的编码格式，如utf-8、gbk、gb2312等。,不可空<br>GBK"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">签名:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="sign" name="sign" value="e8qdwl9caset5zugii2r7q0k8ikopxor" tooltiptext="参见“签名机制”。,不可空<br>e8qdwl9caset5zugii2r7q0k8ikopxor"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">签名方式:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" id="sign_type" name="sign_type" value="RSA" tooltiptext="签名方式只支持RSA、MD5。,不可空<br>MD5"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">页面跳转同步返回页面路径:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="return_url" name="return_url" value="<%= tpuAddressUrl %>/mag/syncNotify.do" tooltiptext="钱包处理完请求后，当前页面自动跳转到商户网站里指定页面的http路径。批量，多商品的接口，无此字段,可空<br>http://mas.test.qijia.net/atinterface/receive_return.htm"/>
    <br>
    </td>
</tr>

<tr>
    <td style="vertical-align: top; width: 25%;">备注:
    <br>
    </td>
    <td style="vertical-align: top; width: 75%;">
    <input style="width: 100%;" class="default-q" id="memo" name="memo" value="" tooltiptext="说明信息,可空"/>
    <br>
    </td>
</tr>

           </tbody>
       </table>
       </fieldset>

