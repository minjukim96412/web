package simplemvc.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import simplemvc.command.AgeCommand;
import simplemvc.command.Command;
import simplemvc.command.HobbyCommand;
import simplemvc.command.NameCommand;

//컨트롤러의 역할
//요청을 받아서 요청을 분석하고 요청파라미터에 따라 포워딩할 뷰와
//뷰에 표시할 데이터(모델)를 결정하고 뷰로 포워딩

public class MVCController extends HttpServlet{

	private static final long serialVersionUID = 153478654121L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			processRequest(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			processRequest(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//command.properties 파일을 읽어서 properties 맵에 저장한다.
		Properties prop = new Properties();
		File file = new File("D:\\embeded\\simplemvc\\src\\main\\java\\simplemvc\\prop\\command.properties");
		prop.load(new FileReader(file));
		
		//커맨드 패턴
		Command command = null;
		try {
			//명령에 따른 처리클래스를 생성
			Class cl = Class.forName((String)(prop.get(req.getQueryString())));
			//명령처리클래스의 객체를 생성
			command =(Command)cl.newInstance();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		/*
		System.out.println(prop.get(req.getQueryString()));
		//1. 요청 파라미터 
		String paramRequest = req.getParameter("request") 
				== null ? "" :req.getParameter("request");
		
		//요청 처리 후 결과를 저장할 객체
		Object resultObj = null;
		
		//처리 결과를 표현할 View로 사용할 jsp의 경로
		Object viewJSP = null;
		
		//2. 요청에 따라 결과를 생성하고 뷰를 결정
//		if(paramRequest.equals("name")) {
//			resultObj = "홍길동";
//			viewJSP = "/jsp/name.jsp";
//		}else if(paramRequest.equals("age")) {
//			resultObj = 30;
//			viewJSP = "/jsp/age.jsp";
//		}else if(paramRequest.equals("hobby")) {
//			resultObj = "축구";
//			viewJSP = "/jsp/hobby.jsp";
//		}
		Command command = null;
		//command 패턴 이용
		if(paramRequest.equals("name")) {
			command = new NameCommand();
		}else if(paramRequest.equals("age")) {
			command = new AgeCommand();
		}else if(paramRequest.equals("hobby")) {
			command = new HobbyCommand();
		}
*/		
		
		//request 에 속성변수 설정
//		req.setAttribute("resultObj", resultObj);
		req.setAttribute("resultObj", command.returnModel());
		
		//3. 생성된 결과를 뷰에 전달
		RequestDispatcher dispatcher = req.getRequestDispatcher((String)command.returnView());
		dispatcher.forward(req, resp);
	
	
	
	}
	
}
