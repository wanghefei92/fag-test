/**
 *
 */
package com.netfinworks.tpu.web.util;

import org.springframework.beans.factory.annotation.Value;

/**
 * <p>注释</p>
 * @author guyihui
 * @version $Id: ConfigUtil.java, v 0.1 2013-12-9 下午6:33:04 guyihui Exp $
 */
public class ConfigUtil {
	@Value("${mag.address.url}")
	private String magAddressUrl = "";
	
	@Value("${tpu.address.url}")
	private String tpuAddressUrl = "";
	
	@Value("${identity_type}")
	private String identityType = "";
	
	public String getMagAddressUrl() {
		return magAddressUrl;
	}
	public void setMagAddressUrl(String magAddressUrl) {
		this.magAddressUrl = magAddressUrl;
	}
	public String getTpuAddressUrl() {
		return tpuAddressUrl;
	}
	public void setTpuAddressUrl(String tpuAddressUrl) {
		this.tpuAddressUrl = tpuAddressUrl;
	}
	public String getIdentityType() {
		return identityType;
	}
	public void setIdentityType(String identityType) {
		this.identityType = identityType;
	}
	

}
