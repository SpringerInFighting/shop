package cn.it.shop.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.it.shop.action.ValidationCodeAction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;


public class ValidationCodeResult implements Result{

	@Override
	public void execute(ActionInvocation actionInvocation) {
		ValidationCodeAction action = (ValidationCodeAction) actionInvocation
				.getAction();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		// 生成随机字串
		String verifyCode = action.generateVerifyCode(4);

		// 生成图片
		int w = 100, h = 50;
		try {
			action.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
