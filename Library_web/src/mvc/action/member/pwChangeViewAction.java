package mvc.action.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.member.MemberDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class pwChangeViewAction implements Action{

	private static final String viewPath = "/member/pwChange.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMemberResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			if(request.getSession().getAttribute("member") == null) {
				request.setAttribute("wrongResult", 1);
				request.getRequestDispatcher(checkPath).forward(request, response);
			}
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}

}
