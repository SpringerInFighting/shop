package cn.it.shop.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailUtil {

	public static void Send(String address, String sendContext, String subject) {
		Properties properties = new Properties();
		Transport transport = null;
		// 此属性在getDefaultInstance方法说明中查找
		properties.put("mail.transport.protocol", "smtp");
		// 根据配置文件获取一个session会话
		Session session = Session.getDefaultInstance(properties);
		//设置debug格式
		session.setDebug(true);
		// 创建一个邮件对象
		Message message = new MimeMessage(session);
		// 设置邮件的标题
		
		try {
			 //设置自定义发件人昵称    
	        String nick="";    
	        try {    
	            nick=javax.mail.internet.MimeUtility.encodeText("易购商城");    
	        } catch (UnsupportedEncodingException e) {    
	            e.printStackTrace();    
	        }     
			
			
			message.setSubject(subject);
			// 设置发送邮箱地址
			message.setFrom(new InternetAddress("13119615917@163.com"));
			
			message.setFrom(new InternetAddress(nick+" <13119615917@163.com>"));
			// 设置邮件正文内容
			message.setContent(sendContext, "text/html;charset=utf-8");
			// 通过sesion获取邮件传输对象
			transport = session.getTransport();
			// 连接到邮件服务器
			transport.connect("smtp.163.com","13119615917@163.com","123456789b");
			// 设置发送的邮件和发送地址
			transport.sendMessage(message, new Address[]{
					new InternetAddress(address)
			});
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				transport.close();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	/*public static void main(String []args) throws MessagingException{
		Properties properties = new Properties();
		Transport transport = null;
		// 此属性在getDefaultInstance方法说明中查找
		properties.put("mail.transport.protocol", "smtp");
		// 根据配置文件获取一个session会话
		Session session = Session.getDefaultInstance(properties);
		//设置debug格式
		session.setDebug(true);
		// 创建一个邮件对象
		Message message = new MimeMessage(session);
		// 设置邮件的标题
		
		try {
			message.setSubject("测试邮箱");
			// 设置发送邮箱地址
			message.setFrom(new InternetAddress("13119615917@163.com"));
			// 设置邮件正文内容
			message.setContent("正文内容", "text/html;charset=utf-8");
			// 通过sesion获取邮件传输对象
			transport = session.getTransport();
			// 连接到邮件服务器
			transport.connect("smtp.163.com","13119615917@163.com","123456789b");
			// 设置发送的邮件和发送地址
			transport.sendMessage(message, new Address[]{
					new InternetAddress("1538563097@qq.com")
			});
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			transport.close();
		}
	}*/
}
