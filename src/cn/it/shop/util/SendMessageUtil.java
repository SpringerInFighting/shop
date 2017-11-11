package cn.it.shop.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.web.client.HttpClientErrorException;

public class SendMessageUtil {

	public static void sendMessage(String phone, String forderId) throws HttpException, IOException{
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod("http://utf8.sms.webchinese.cn");
		postMethod.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		postMethod.setParameter("Uid", "TextMessage");
		postMethod.setParameter("Key", "bde383cf8ce2d37dab3f");
		postMethod.setParameter("smsMob", phone);
		postMethod.setParameter("smsText", "订单："+ forderId +"支付成功！我们会尽快为您配送！谢谢您的支持！【易购商城】");
		
		int code=httpClient.executeMethod(postMethod);
		System.out.println("HTTP请求返回的状态码:" + code);
		System.out.println(postMethod.getResponseBodyAsString());
	}
}
