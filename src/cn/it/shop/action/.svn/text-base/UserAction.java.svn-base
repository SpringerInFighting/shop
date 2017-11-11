package cn.it.shop.action;

import java.io.ByteArrayInputStream;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.User;
import cn.it.shop.util.SendEmailUtil;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	@SkipValidation
	public String login(){
		System.out.println("---login----"+model);
		
		model = userService.login(model);
		System.out.println("---login2----"+model);
		if(model==null){
			session.put("error", "用户名或密码错误!");
			return "ulogin";
		}else{
			// 登陆成功,跳转到首页
			session.put("user", model);
			System.out.println("user:"+session.get("user"));
			// 根据需求是否被过滤器拦截器选择跳转到不同页面
			if(session.get("goURL")==null){
				return "index";
			}else{
				return "goURL";
			}
		}
	}
	
	//验证登录名是否被使用
	@SkipValidation
	public String repeatLogin(){
		String repeat;
		System.out.println(model);
		String login = model.getLogin();
		Long re = userService.repeatLogin(login);
		if(re != 0){
			repeat = "false";
		}else{
			repeat = "true";
		}
		System.out.println(re);
		inputStream = new ByteArrayInputStream(repeat.getBytes());
		return "stream";
	}
	
	//注册新用户
	public String register(){
		
		System.out.println("USER:"+model);
		userService.registerUser(model);
		login();
		final String sendContext = "恭喜您！成为易购商城的会员，您的密码："+model.getPass() + "请妥善保管！谢谢您的支持！【易购商城】";
		final String subject = "注册成功";
		//另开一个线程发送Email
		Thread threadOne = new Thread(new Runnable() {
	        public void run() {
	        	SendEmailUtil.Send(model.getEmail(), sendContext, subject);
	        }
	    });
		threadOne.start();
		return "redirect";
	}
	
	//退出登录
	@SkipValidation
	public String logout(){
		
		session.clear();
		return "index";
	}
	
	public String checkcode(){
		inputStream = new ByteArrayInputStream("true".getBytes());
		System.out.println("-----成功--------");
		return "stream";
	}
}
