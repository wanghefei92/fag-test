<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta name="generator" content="HTML Tidy for Mac OS X (vers 31 October 2006 - Apple Inc. build 15.6), see www.w3.org">
		<script language="Javascript" type="text/javascript">

		</script>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>测试接口列表</title>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th>测试地址</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="instanceTrade.jsp?service=create_instant_trade">即时到账交易网关接口</a></td>
				</tr>
				<tr>
					<td><a href="ensureTrade.jsp?service=create_ensure_trade">担保交易网关接口</a></td>
				</tr>

				<tr>
					<td><a href="settle.jsp?service=create_settle">结算（确认收货）网关接口</a></td>
				</tr>
				<tr>
					<td><a href="refund.jsp?service=create_refund">退款网关接口</a></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><a href="prepayPay.jsp?service=prepay_pay">订金下订网关接口</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><a href="prepayPayWithhold.jsp?service=prepay_withhold">订金扣款网关接口</a></td> -->
<!-- 				</tr> -->
				<tr>
					<td><a href="querytrade.jsp?service=query_trade">交易查询网关接口</a></td>
				</tr>
				<tr>
					<td><a href="canceltrade.jsp?service=cancel_trade">交易取消网关接口</a></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><a href="batchedWithdrawal.jsp?service=create_batched_withdrawal">批量提现网关接口</a></td> -->
<!-- 				</tr> -->
				<tr>
					<td><a href="pay.jsp?service=create_pay">批量支付网关接口</a></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><a href="createwithdrawal.jsp?service=create_withdrawal">单笔提现网关接口</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><a href="changetradeamount.jsp?service=change_trade_amount">修改交易金额网关接口</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><a href="querymarginchanges.jsp?service=query_margin_changes">查询保证金变动网关接口</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><a href="balanceTransfer.jsp?service=balance_transfer">转账（扣款）网关接口</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><a href="guaranteeRecharge.jsp?service=margin_recharge">保证金充值网关接口</a></td> -->
<!-- 				</tr> -->
				<tr>
					<td><a href="pay2card.jsp?service=payment_to_card">付款到卡网关接口</a></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td> <a href="frozenFunds.jsp?service=frozen_funds">冻结资金网关接口</a></td> -->
<!-- 				</tr> -->

<!-- 				<tr> -->
<!-- 					<td> <a href="unfreezeFunds.jsp?service=unfreeze_funds">解冻资金网关接口</a></td> -->
<!-- 				</tr> -->
                <%--<tr>--%>
                    <%--<td><a href="instancetrade4pp.jsp?service=create_instant_trade_app">即时到账交易网关接口_APP</a></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td><a href="pay4app.jsp?service=create_pay_app">批量支付网关接口_APP</a></td>--%>
                <%--</tr>--%>
                  <tr>
                    <td><a href="createScript.jsp?service=create_script">生成指定会员账户脚本(供钱包开发人员使用【不需测试】)</a></td>
                </tr>
			</tbody>
		</table>
	</body>
</html>

