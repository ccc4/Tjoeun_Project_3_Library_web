package mvc.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.AdminDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class AdminAction implements Action{

	private static final String viewPath = "/index.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMemberResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			Connection conn = JdbcConnection.getConnection();
			AdminDAO dao = AdminDAO.getInstance();
			
			int result = dao.login(conn, id, pw);
			request.setAttribute("loginResult", result);
			if(result == 1) {
				request.getSession().setAttribute("admin", id);
			}
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}

}
