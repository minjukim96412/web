package jspbasic.listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener{
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
//		System.out.println("세션 속성 추가됨!");
		if (event.getName().equals("mid")) {
            System.out.println(event.getValue() + "님 로그인");
        }
		                                                                                                                                                                                                                                                                                                                                                                              
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
//		System.out.println("세션 속성 제거됨!");
		if (event.getName().equals("mid")) {
            System.out.println(event.getValue() + "님 로그아웃");
        }
	}
	
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
//		System.out.println("세션 속성 대체됨!");
	}
}
