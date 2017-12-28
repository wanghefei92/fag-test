<%@ page import="com.tigerft.tpu.web.util.SpringContextHolder" %>
<%@ page import="com.tigerft.tpu.web.util.ConfigUtil" %>
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
							<input style="width: 100%;" id="sign_key" name="sign_key" value="MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMX1qrS4SnyK9nO6bdS8bGQbw+ogd8XChBGfHLAkOPAD0nG0T0E4vWVjSoV6AMAIGvkYVtoCrsFQVzo+b/hsUCSo5KMEIrkwTaCuYho610h9vnmIfSULL/dP1hd7e1ojOwogPd2ZNC2k+OjFBJHUXb0kG/oPbkvbB5y+SWM4JP03AgMBAAECgYASWA6GiqFUYygtVzRAR2mf6TbBZlrS95B3dZAZ/nFMRH5mzPefKpvaXlYUgla5dMbTGF9L+n2pKkG7AvgrRBY09ZjChs9Ofc9Vxd53a9bbrHkZqC4O8swsRYXQA1aAuDlIuLzNpyIJxhgQGJx7dcv3RL/TY7mPNXUc6OvAhqsEKQJBAPRo6RGfWxeiDfJvbykrL0+9H1KPdARtobM+N8CwVC7e7oohyec/tbYmJlwWHR36qpt8MXoQ6Ykg1JR4fkV6BWsCQQDPWNwm9aJBD5Rem/zgbMMA3juYXp253ZAXgpsY0QG1YcI4KzxgUOpqwyeM8tY+nDAjPYRlxnns4y7u0J9gXw5lAkBlz53m/V7QxWzR5KGFoLugl8OIfMFzZsfJBs3qsokezTbIy7JzZhKnwdSQ35VZe6W+B0oE8y6VNNvYzSisgFvpAkBEk2QEcpreH7P3cmm5I99+qwFUzH4n2bJtRCHdnEqPXaypfQsz468T7kVnZW0cOfXlwdPHAVST1zNPgqojamzNAkBeEoHtl0MTdQcwaopXsThGaeU32E58z0Zs9Yt32wuHj4xtSEoSWaXAkOx8fGOp0rcfeSueVOXQpXxPO8+TatwQ" tooltiptext="商户私钥，用于生成密钥"/>
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
