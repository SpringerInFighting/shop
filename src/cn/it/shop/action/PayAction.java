package cn.it.shop.action;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.httpclient.HttpException;
import org.apache.struts2.interceptor.ParameterAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.BackData;
import cn.it.shop.model.Forder;
import cn.it.shop.model.SendData;
import cn.it.shop.model.User;
import cn.it.shop.util.SendEmailUtil;
import cn.it.shop.util.SendMessageUtil;

/*
 * ParameterAware: 此接口可以获取请求的参数信息
 * 
 *  if (action instanceof ParameterAware) {
           ((ParameterAware) action).setParameters((Map)context.getParameters());
     }
    而且在执行Struts拦截器的时候是先执行: servletConfig---> modelDriven
 * */
@Controller
@Scope("prototype")
public class PayAction extends BaseAction<Object> implements ParameterAware {

	private Map parameters;
	@Override
	public void setParameters(Map<String, String[]> parameters) {
		// TODO Auto-generated method stub
		this.parameters = parameters;
	}
	
	
	// 重写getModel方法,根据请求的参数动态创建对象
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		if(parameters.get("pd_FrpId") != null){
			model = new SendData();
		}else{
			model = new BackData();
		}
		return model;
	}



	public String goBank(){
		Forder forder = (Forder) session.get("oldForder");
		User user = (User) session.get("user");
		SendData sendData = (SendData) model;
		// 1: 补全: p2 p3 Pa  pd(支付编码前台传递)
		sendData.setP2_Order(forder.getId().toString());
		sendData.setP3_Amt(forder.getTotal().toString());
		sendData.setPa_MP(user.getEmail() + "," +user.getPhone());
		// 2: 调用service完成数据的加密
		payService.saveDataToRequest(request, sendData);
		// 3: 跳转到最后支付确认页面
		return "pay";
	}
	
	public String backBank(){
		BackData backData = (BackData) model;
		// 2: 追加数据且加密
		// 3: 与传过来的密文进行比较,如果相等则说明数据没有被篡改
		System.out.println(backData);
		boolean back = payService.checkBackData(backData);
		//邮箱
		String address = backData.getR8_MP().split(",")[0];
		//电话号码
		String phone = backData.getR8_MP().split(",")[1];
		//订单号
		String forderId = backData.getR6_Order();
		
		String sendContext = "订单："+ forderId +"支付成功！我们会尽快为您配送！谢谢您的支持！【易购商城】";
		String Subject = "订单支付成功！";
		System.out.println("电话："+ phone);
		if(back){
			System.out.println("--------success---------");
			forderService.UpdateStatusById(Integer.valueOf(forderId), 2);
			//发送邮箱
			SendEmailUtil.Send(address, backData.getR6_Order(), Subject);
			try {
				//发送短信
				SendMessageUtil.sendMessage(phone, sendContext);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("-----fail---------");
		}
		return null;
	}

	
}
