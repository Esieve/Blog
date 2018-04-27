package tech.acodesigner.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * Created by 77239 on 2017/2/11/0011.
 */
public class MD5Util {
    public static String encoderPassword(String s) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
	    Base64.Encoder base64Encoder = Base64.getEncoder();
	    return base64Encoder.encodeToString(md5.digest(s.getBytes("utf-8")));
    }
}