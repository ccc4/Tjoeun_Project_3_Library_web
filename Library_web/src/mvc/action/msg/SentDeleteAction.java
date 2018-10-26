package mvc.action.msg;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MsgDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class SentDeleteAction implements Action {

	private static final String viewPath = "/msg/write.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMsgResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			int idx = Integer.parseInt(request.getParameter("idx"));
			
			Connection conn = JdbcConnection.getConnection();
			MsgDAO dao = MsgDAO.getInstance();
			
			int result = dao.sentDelete(conn, idx);
			
			request.setAttribute("sDeleteMsg", result);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		}
	}

}
