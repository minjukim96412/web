package jspbasic.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;

public class MyServletRequestAttributeListener implements ServletRequestAttributeListener{
	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		System.out.println("request의 속성이 추가 됨!");
	}
	@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		System.out.println("request의 속성이 제거 됨!");
	}
	@Override
	public void attributeReplaced(ServletRequestAttributeEvent srae) {
		System.out.println("request의 속성이 대체 됨!");
	}
}
