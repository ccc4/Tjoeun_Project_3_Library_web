package mvc.action.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MemberDAO;
import mvc.dao.MsgDAO;
import mvc.dto.MemberDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class LoginAction implements Action{

	private static final String viewPath = "/";
	private static final String checkPath = "/WEB-INF/check/checkMemberResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if(request.getParameter("saveId") == null) {
				Cookie cookie = new Cookie("saveId", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			Connection conn = JdbcConnection.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			
			int result = dao.login(conn, id, pw);
			request.setAttribute("loginResult", result);
			if(result == 1) {
				MemberDTO member = dao.getMemberDTO(conn, id);
				request.getSession().setAttribute("member", member);
				
				MsgDAO msgDAO = MsgDAO.getInstance();
				int newMsg = msgDAO.checkNewMsg(conn, member.getIdx());
				request.getSession().setAttribute("newMsg", newMsg);
				if(newMsg > 0) {
					request.setAttribute("newMsg", newMsg);
				}
				
				if(request.getParameter("saveId") != null) {
					Cookie cookie = new Cookie("saveId", id);
					response.addCookie(cookie);
				}
			}
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}

}
