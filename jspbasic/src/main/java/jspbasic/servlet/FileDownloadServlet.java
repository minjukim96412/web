package jspbasic.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownloadServlet extends HttpServlet{

	private static final long serialVersionUID = 115645413155L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dir = "D:/upload";
		String filename = req.getParameter("filename");
		String filefullname = dir +"/" + filename;
		
		try {
			File file = new File(filefullname);
			byte[] bArray = new byte[4096];
			
			resp.setContentType("applicaion/octet-stream");
			String encName = new String(filename.getBytes("utf-8"),"8859_1");
			resp.setHeader("COntent-Disposition", "attachment; filename=" + encName );
			FileInputStream fis = new FileInputStream(filefullname);
			OutputStream os = resp.getOutputStream();
			
			int numRead = 0;
			while((numRead = fis.read(bArray,0,bArray.length)) != -1) {
				os.write(bArray, 0 , numRead);
			}
			os.close();
			fis.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
