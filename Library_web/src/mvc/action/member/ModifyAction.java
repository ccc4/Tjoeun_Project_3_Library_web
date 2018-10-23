package mvc.action.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MemberDAO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class ModifyAction implements Action{

	private static final String viewPath = "/index.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMemberResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			int idx = Integer.parseInt(request.getParameter("idx"));
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			int gender = Integer.parseInt(request.getParameter("gender"));
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			
			Connection conn = JdbcConnection.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			
			int result = dao.modify(conn, idx, nickname, name, age, gender, tel, email, address);
			request.setAttribute("modifyResult", result);
			if(result == 1) {
				request.getSession().setAttribute("member", dao.getDTO(conn, idx));
			}
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
		}
	}

}
