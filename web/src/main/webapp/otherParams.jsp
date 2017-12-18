<%@ page import="com.netfinworks.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.netfinworks.tpu.web.util.ConfigUtil" %>
<%
ConfigUtil configUtil = SpringContextHolder.getBean("configUtil");
String magAddressUrl = configUtil.getMagAddressUrl();
String tpuAddressUrl = configUtil.getTpuAddressUrl();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <fieldset>
       	<legend>
       		其他
       	</legend>
        <table>
       	 <tbody>
       					<tr>
							<td style="vertical-align: top; width: 30%;">商户私钥（NOTENCRYPT）：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="sign_key" name="sign_key" value="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAO/6rPCvyCC+IMalLzTy3cVBz/+wamCFNiq9qKEilEBDTttP7Rd/GAS51lsfCrsISbg5td/w25+wulDfuMbjjlW9Afh0p7Jscmbo1skqIOIUPYfVQEL687B0EmJufMlljfu52b2efVAyWZF9QBG1vx/AJz1EVyfskMaYVqPiTesZAgMBAAECgYEAtVnkk0bjoArOTg/KquLWQRlJDFrPKP3CP25wHsU4749t6kJuU5FSH1Ao81d0Dn9m5neGQCOOdRFi23cV9gdFKYMhwPE6+nTAloxI3vb8K9NNMe0zcFksva9c9bUaMGH2p40szMoOpO6TrSHO9Hx4GJ6UfsUUqkFFlN76XprwE+ECQQD9rXwfbr9GKh9QMNvnwo9xxyVl4kI88iq0X6G4qVXo1Tv6/DBDJNkX1mbXKFYL5NOW1waZzR+Z/XcKWAmUT8J9AkEA8i0WT/ieNsF3IuFvrIYG4WUadbUqObcYP4Y7Vt836zggRbu0qvYiqAv92Leruaq3ZN1khxp6gZKl/OJHXc5xzQJACqr1AU1i9cxnrLOhS8m+xoYdaH9vUajNavBqmJ1mY3g0IYXhcbFm/72gbYPgundQ/pLkUCt0HMGv89tn67i+8QJBALV6UgkVnsIbkkKCOyRGv2syT3S7kOv1J+eamGcOGSJcSdrXwZiHoArcCZrYcIhOxOWB/m47ymfE1Dw/+QjzxlUCQCmnGFUO9zN862mKYjEkjDN65n1IUB9Fmc1msHkIZAQaQknmxmCIOHC75u4W0PGRyVzq8KkxpNBq62ICl7xmsPM=" tooltiptext="商户私钥，用于生成密钥"/>
							<br>
							</td>						
						</tr>
						<tr>
							<td style="vertical-align: top; width: 30%;">钱包公钥（NOTENCRYPT）：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="public_key" name="public_key" value="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDv0rdsn5FYPn0EjsCPqDyIsYRawNWGJDRHJBcdCldodjM5bpve+XYb4Rgm36F6iDjxDbEQbp/HhVPj0XgGlCRKpbluyJJt8ga5qkqIhWoOd/Cma1fCtviMUep21hIlg1ZFcWKgHQoGoNX7xMT8/0bEsldaKdwxOlv3qGxWfqNV5QIDAQAB" tooltiptext="钱包公钥，用于加密数据"/>
							<br>
							</td>	
						</tr>
						
						<!--
						<tr>
							<td style="vertical-align: top; width: 30%;">商户私钥类型：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="keyType" name="keyType" value="MD5" tooltiptext="商户私钥，用于生成密钥">
							<br>
							</td>
						</tr>
						 -->
						<tr>
							<td style="vertical-align: top; width: 30%;">网关地址：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="magAddressUrl" name="magAddressUrl" value="<%= magAddressUrl %>/gateway/receiveOrder.do" tooltiptext="收单网关地址"/>
							<br>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top; width: 30%;">同步通知地址：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="notifyAddressUrl" name="notifyAddressUrl" value="<%= tpuAddressUrl %>/mag/syncNotify.do" tooltiptext="同步通知地址"/>
							<br>
							</td>
						</tr>
						<!--
						<tr>
							<td style="vertical-align: top; width: 30%;">模拟商户返回：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="result" name="result" value="<result>1</result><redirecturl>http://weibo.com</redirecturl>" tooltiptext="商户私钥，用于生成密钥">
							<br>
							</td>
						</tr>
						-->
						<tr>
							<td style="vertical-align: top; width: 30%;">跳转请求：
							<br>
							</td>
							<td style="vertical-align: top; width: 70%;">
							<input style="width: 100%;" id="linkString" name="linkString" value="" tooltiptext=""/>
							<br>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<br/>
			</fieldset>
