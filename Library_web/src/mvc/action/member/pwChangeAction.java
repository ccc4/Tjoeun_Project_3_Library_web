package mvc.action.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MemberDAO;
import mvc.dto.MemberDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class pwChangeAction implements Action{

	private static final String viewPath = "/index.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMemberResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
			int idx = member.getIdx();
			String prevPw = member.getPw();
			String prevPwCheck = request.getParameter("prevPwCheck");
			String newPw = request.getParameter("newPw");
			
			if(!prevPwCheck.equals(prevPw)) {
				request.setAttribute("pwChangeResult", -1);
				request.getRequestDispatcher(checkPath).forward(request, response);
				return;
			}
			if(newPw.equals(prevPw)) {
				request.setAttribute("pwChangeResult", -2);
				request.getRequestDispatcher(checkPath).forward(request, response);
				return;
			}
			
			Connection conn = JdbcConnection.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			
			int result = dao.pwChange(conn, idx, newPw);
			request.setAttribute("pwChangeResult", result);
			if(result == 1) {
				request.getSession().setAttribute("member", dao.getDTO(conn, idx));
			}
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}

}
