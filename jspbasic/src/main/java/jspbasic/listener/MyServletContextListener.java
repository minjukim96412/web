package jspbasic.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
//		System.out.println("컨텍스트 초기화 됨!");
		sce.getServletContext().setAttribute("userCount", 0);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("컨텍스트가 소멸 됨!");
	}
}
