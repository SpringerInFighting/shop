package cn.it.shop.listener;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;
import cn.it.shop.util.FileUploadUtil;
import cn.it.shop.util.FileUploadUtilImpl;
import cn.it.shop.util.IndexTimerTask;

/*
 * 启动的时候用来加载数据的初始化监听器
 */
public class InitDataServletContextListener implements ServletContextListener{

	// @Resource // 监听器是不能通过Spirng创建,则不可以依赖注入
	private ApplicationContext context;
	private FileUploadUtil fileUploadUtil;
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// Spring配置文件会加载2次
		// ApplicationContext context=new
		// ClassPathXmlApplicationContext("applicationContext-*.xml");
		// categoryService=(CategoryService)context.getBean("categoryService");
		//1: 获取业务逻辑类
		context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		
		/*
		 * 配置守护线程
		 */
		IndexTimerTask indexTimerTask = (IndexTimerTask) context.getBean("indexTimerTask");
		indexTimerTask.setContext(sce.getServletContext());
		//设置定时器，让首页的数据每个2秒同步一次（要配置守护线程）
		new Timer(true).schedule(indexTimerTask, 0, 3600*1000);
		
		fileUploadUtil = (FileUploadUtil) context.getBean("fileUpload");
		String[] bankName = fileUploadUtil.getFileNameByPath();

		sce.getServletContext().setAttribute("bankName", bankName);
	}

}
