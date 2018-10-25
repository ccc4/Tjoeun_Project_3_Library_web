package mvc.action.book;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mvc.action.Action;
import mvc.dao.BookDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class AddAction implements Action {

	private static final String viewPath = "/subject/library.jsp";
	private static final String checkPath = "/WEB-INF/check/checkBookResult.jsp";
	private static final String saveDirectory = "/upload/image";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			
			String imgPath = "";

			String saveDir = request.getServletContext().getRealPath(saveDirectory);
			System.out.println(saveDir);
			
			if(request.getPart("file").getSize() != 0) {
				Part filePart = request.getPart("file");
				String originFileName = getFileName(filePart);
				System.out.println(filePart.getName());
				System.out.println(originFileName);
				System.out.println(saveDir + originFileName);
				
				Random random = new Random();
				String fileName = "image_" + random.nextLong() + originFileName.substring(originFileName.indexOf("."));
				
				File dir = new File(saveDir);
				if(!dir.exists()) dir.mkdirs();
				File file = new File(dir, fileName);
				
				BufferedInputStream bis = 
						new BufferedInputStream(filePart.getInputStream());
							
				BufferedOutputStream bos = 
						new BufferedOutputStream(
								new FileOutputStream(file));
				
				byte [] data = new byte[1024];
				
				while ( bis.read(data) != -1) {
					bos.write(data);
				}
				bis.close();
				bos.close();
				
				imgPath = saveDirectory + "/" + fileName;
			}
			
			Connection conn = JdbcConnection.getConnection();
			BookDAO dao = BookDAO.getInstance();
			
			int result = dao.add(conn, title, author, publisher, imgPath);
			
			request.setAttribute("addResult", result);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}
	
	private String getFileName(Part filePart) {
		for (String filePartData : 
			filePart.getHeader("Content-Disposition").split(";")) {
			System.out.println(filePartData);
			if (filePartData.trim().startsWith("filename")) {
				return filePartData.substring(filePartData.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
