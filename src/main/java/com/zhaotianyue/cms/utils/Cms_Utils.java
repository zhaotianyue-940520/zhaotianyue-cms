package com.zhaotianyue.cms.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class Cms_Utils {
	//加盐加密
	public static String encrypt(String pas,String uname) {
		return DigestUtils.md5Hex(pas+uname);
	}
}
