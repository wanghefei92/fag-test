			var tooltipObj = new DHTMLgoodies_formTooltip();
			tooltipObj.setTooltipPosition('right');
			tooltipObj.setPageBgColor('#EEEEEE');
			tooltipObj.setTooltipCornerSize(15);
			tooltipObj.initFormFieldTooltip();
			//显示层信息
			function Show(obj) {
				obj.style.display = "block";
			}

			//隐藏信息层
			function Hide(obj) {
				obj.style.display = "none";
			}

			function getNewOrderNo(){
				return new DateFormat("yyyyMMddHHmmss").format(new Date())+Math.random(10000000000000, 90000000000000);
			}

			function getTradeTimestamp(){
				return new DateFormat("yyyyMMddHHmmss").format(new Date());
			}

			function newOrder() {
				$('#request_no').val(getNewOrderNo());
				//$('#return_url')notifyAddressUrl
			}

			function newOuterOrder() {
				$('#outer_trade_no').val(getNewOrderNo());
				$('#batch_no').val(getNewOrderNo());
				$('.trade-timestamp').val(getTradeTimestamp());
				//$('.start_time').val(getTradeTimestamp());
				$('.end_time').val(getTradeTimestamp());
				//$('#return_url')notifyAddressUrl
			}

			function sendRequest() {
				changePayMethod();
				doSendRequest();
			}
			
			function doSendRequest() {
				var paramString = assembleParamString();
				var signType = $('#sign_type').val();
				var sign = encodeURIComponent($('#sign').val());
				var data = "sign_type=" + signType + "&sign=" + sign + paramString;
				//alert(data);
				var targetUrl = $('#magAddressUrl').val();
				var linkString = $('#linkString').val();
				//window.open(targetUrl + '?' + data,'','height=500,width=800,scrollbars=yes,status =yes');
				window.open(targetUrl + '?' + linkString,'','height=500,width=800,scrollbars=yes,status =yes');
			}
			
			function getSign() {
				changePayMethod();
				doSign();
			}

			function doSign() {
				var paramNames = assembleParamNames();
				var paramString = assembleParamString();
				var signType = $('#sign_type').val();
				var signKey = encodeURIComponent($('#sign_key').val());
				//alert(signKey);
				var data = "signType=" + signType + "&signKey=" + signKey + paramNames + paramString;
				//alert(data);
				$.ajax('mag/sign.do',{
					type : 'POST',
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data : data
				}).done(function(result){
					alert(result["msg0"]);
					alert(result["msg1"]);
				    $("#sign").val(result["msg0"]);
					$("#linkString").val(result["msg1"]);
				});
			}
			function getEncrypt() {
				//alert(signKey);
				var publicKey = $('#public_key').val();
				var inputCharset=$('#_input_charset').val();
				var data = "public_key="+encodeURIComponent(publicKey)
				+"&_input_charset="+encodeURIComponent(inputCharset)+assembleEncryptParamString();
//				alert(data);
				$.ajax('mag/encrypt.do',{
					type : 'POST',
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data : data
				}).done(function(result){
				    $("#bank_account_no").val(result["msg0"]);
					$("#account_name").val(result["msg1"]);
				});
			}
			function assembleParamNames(){
				var params = $('.default-q');
				var q = "";
				for(var idx=0; idx<params.length-1; idx++){
					var tmp = params[idx].name + ",";
					q += tmp;

				}
				q += params[params.length-1].name;
				return "&paramNames=" + q;
			}

			function assembleParamString(){
				var params = $('.default-q');
				var q = "";
				for(var idx=0; idx<params.length; idx++){
					if(params[idx].name === 'royalty_parameters') {
						var tmp = "&" + params[idx].name + "=" + encodeURIComponent(parseRoyalty(params[idx].value));
					} else {
						var tmp = "&" + params[idx].name + "=" + encodeURIComponent(params[idx].value);
					}
					q += tmp;

				}
				return q;
			}
			function assembleEncryptParamString(){
				var params = $('.default-e');
				var q = "";
				for(var idx=0; idx<params.length; idx++){
					var tmp = "&" + params[idx].name + "=" + encodeURIComponent(params[idx].value);
					q += tmp;

				}
				return q;
			}

//			function assembleTradeInfo() {
//				var tradeNo = getNewOrderNo();
//				$('#tradeParam1').val(tradeNo);
//				$('.trade-timestamp').val(getTradeTimestamp());
//				var tradeInfo = '';
//				var params = $('input[id^=tradeParam]');
//				for(var idx=0; idx<params.length-1; idx++){
//					var para = params[idx].value;
//					para = para.length + ':' + para;
//					tradeInfo += para;
//					tradeInfo +='~';
//				}
//				var para = params[params.length-1].value;
//				para = para.length + ':' + para;
//				tradeInfo += para;
//				return tradeInfo;
//			}

			function assembleTradeInfo(sep) {
				var tradeNo = getNewOrderNo();
				$('#tradeParam1').val(tradeNo);
				$('.trade-timestamp').val(getTradeTimestamp());
				var service = $('#service').val(); // 用于判断是否要处理分润集
				var tradeInfo = '';
				var params = $('input[id^=tradeParam]');
				for(var idx=0; idx<params.length-1; idx++){
					var para = params[idx].value;
					if (idx == 5 && (service=='create_instant_trade' || service=='create_instant_trade_app') && para) {
						// 分润集处理
						para = parseRoyalty(para);
					}
					para = para.length + ':' + para;
					tradeInfo += para;
					tradeInfo += sep;
				}
				var para = params[params.length-1].value;
				para = para.length + ':' + para;
				tradeInfo += para;
				return tradeInfo;
			}

			function addTradeInfo() {
				var tradeInfo = assembleTradeInfo('~');
				var curTradeInfo = $('#trade_list').val();
				if('' == curTradeInfo){
					$('#trade_list').val(tradeInfo);
				}else{
					$('#trade_list').val(curTradeInfo + '$' + tradeInfo);
				}
			}

			function addTradeInfo(targetId, sep, app) {
				var tradeInfo = assembleTradeInfo(sep);
				var curTradeInfo = $('#'+targetId).val();
				if('' == curTradeInfo){
					$('#'+targetId).val(tradeInfo);
				}else{
					$('#'+targetId).val(curTradeInfo + app + tradeInfo);
				}
			}
			function changePayMethod(){
				var payMethodSrc=$('#pay_method_src').val();
				var payAmountSrc=$('#pay_amount_src').val();
				var payExtSrc=$('#pay_ext_src').val();
				if(payMethodSrc==null||payMethodSrc==""){
					$('#pay_method').val("");
				}else{
					var payStr=payMethodSrc.length+':' +payMethodSrc;
					payStr+="^"+payAmountSrc.length+':' +payAmountSrc;
					payStr+="^"+payExtSrc.length+':' +payExtSrc;
					$('#pay_method').val(payStr);
				}
			}
			
			function newTradeInfo() {
				var tradeInfo = assembleTradeInfo('~');
				$('#trade_list').val(tradeInfo);
			}

			function newTradeInfo(targetId,sep) {
				var tradeInfo = assembleTradeInfo(sep);
				$('#'+targetId).val(tradeInfo);
			}

			function sendRequestForOperatorSubstituteRecharge() {
				var payMethod = $('#pay_method').val();
				var ext1 = $('#ext1').val();
				if("cash" == payMethod && "" == ext1){
					alert("支付方式为现金（cash）,扩展字段1必填现金存根号");
					return;
				}
				sendRequest();
			}

			function parseRoyalty(origRoy) {
				var result ='';
				var strs= new Array(); //定义一数组
				strs=origRoy.split("|"); //分割成不同的分润记录
				for (i=0;i<strs.length ;i++ ) {
					var seg = new Array();
					seg = strs[i].split("^"); //分割成UID，账户类型，金额
					for (j=0;j<seg.length ;j++ ) {
						seg[j] = seg[j].length + ':' + seg[j];
						result +=seg[j];
						if (j < seg.length -1) {
							result +="^";
						}
					}
					if (i < strs.length -1) {
						result +="|";
					}
				}
				return result;
			}

