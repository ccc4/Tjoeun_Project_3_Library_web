package mvc.action.book;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.BookDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class SearchAction implements Action {

	private static final String viewPath = "/lView?b_idx=";
	private static final String checkPath = "/WEB-INF/check/checkBookResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			String title = request.getParameter("title");
			
			Connection conn = JdbcConnection.getConnection();
			BookDAO dao = BookDAO.getInstance();
			
			int b_idx = dao.getBookIdx(conn, title);
			
			JdbcCloser.close(conn);
			
			if(b_idx == 0) {
				request.setAttribute("wrongTitle", 1);
				request.getRequestDispatcher(checkPath).forward(request, response);
			}
			
			response.sendRedirect(request.getContextPath() + viewPath + b_idx);
//			request.getRequestDispatcher(viewPath).forward(request, response);
		}
	}

}
