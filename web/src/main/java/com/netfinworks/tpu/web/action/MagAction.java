/**
 *
 */
package com.netfinworks.tpu.web.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netfinworks.mag.util.sign.RSA;
import com.netfinworks.mag.util.tools.MagCore;
import com.netfinworks.tpu.web.util.ActionUtil;
import com.netfinworks.tpu.web.util.ConfigUtil;

/**
 * <p>加签等</p>
 * @author guyihui
 * @version $Id: MagAction.java, v 0.1 2013-12-6 下午2:14:26 guyihui Exp $
 */

@Controller
public class MagAction {

	@Resource(name = "configUtil")
    private ConfigUtil configUtil;
	
	@RequestMapping("/mag/test.do")
	public String test(HttpServletRequest request, ModelMap model){
		String msg = ActionUtil.buildMsg(ActionUtil.CODE_SUCCESS, "测试");
		model.addAttribute(ActionUtil.MESSAGE, msg);
		return "/msg.jsp";
	}

	@RequestMapping("/mag/sign.do")
	public String sign(HttpServletRequest request, ModelMap model){
		String signType = request.getParameter("signType");
		String signKey = request.getParameter("signKey");
		String paramNameString = request.getParameter("paramNames");
		String[] paramNames = paramNameString.split(",");
		Map<String, String> params = new HashMap<String, String>();
		for (int i = 0; i < paramNames.length; i++) {
			String paramName = paramNames[i];
			params.put(paramName, request.getParameter(paramName));
		}
		String charset = params.get("_input_charset");
		String resultSign = null;
		String linkString = null;
		try {
			Map<String, String> result = MagCore.buildRequestPara(params, signType, signKey, charset);
			//System.out.println(result);
			linkString = MagCore.createLinkString(result, true);
			resultSign = result.get("sign");
			//System.out.println(linkString);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = ActionUtil.buildMsg(ActionUtil.CODE_SUCCESS, resultSign, linkString);
		model.addAttribute(ActionUtil.MESSAGE, msg);
		return "/msg.jsp";
	}
	@RequestMapping("/mag/encrypt.do")
    public String encrypt(HttpServletRequest request, ModelMap model){
        String publicKey = request.getParameter("public_key");
        String bank_account_no = request.getParameter("bank_account_no_src");
        String account_name = request.getParameter("account_name_src");
        String charset = request.getParameter("_input_charset");
        String msg = ActionUtil.buildMsg(ActionUtil.CODE_SUCCESS, encrypt(bank_account_no, publicKey, charset), encrypt(account_name, publicKey, charset));
        model.addAttribute(ActionUtil.MESSAGE, msg);
        return "/msg.jsp";
    }
	@RequestMapping("/mag/syncNotify.do")
	public String syncNotify(HttpServletRequest request, ModelMap model){

		return "/syncNotify.jsp";
	}
	
	/**
	 * 商户异步通知
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/mag/asynNotify.do")
	public void notify(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String succInfo = "success";
        response.setCharacterEncoding("utf8");
        response.setHeader("content-type", "text/html;charset=UTF-8");
        StringBuilder sb = new StringBuilder();
        sb.append(succInfo);
        response.getWriter().write(sb.toString());
	}
	
	/**
	 * 
	 * @param src
	 * @param publicKey
	 * @param charset
	 * @return
	 */
	private String encrypt(String src,String publicKey,String charset){
        try {
            byte[] bytes = RSA.encryptByPublicKey(src.getBytes(charset), publicKey);
            return Base64.encodeBase64String(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	@RequestMapping("/mag/identity_type.do")
	@ResponseBody
	public String getIdentityType(HttpServletRequest request, ModelMap model){
		String identityType = configUtil.getIdentityType();
		System.out.println(identityType);
		return identityType;
	}

}
