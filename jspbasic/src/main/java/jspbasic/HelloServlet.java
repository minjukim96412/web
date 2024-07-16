package jspbasic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		 System.out.println("서블릿 초기화!");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("서블릿 서비스!");
		System.out.println(req.getParameter("name"));
	}
	
	@Override
	public void destroy() {
		System.out.println("서블릿 소멸!");
	}
	
	
	
}
