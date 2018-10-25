package mvc.action.msg;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MemberDAO;
import mvc.dao.MsgDAO;
import mvc.dto.MemberDTO;
import mvc.dto.MsgDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class WriteAction implements Action {

	private static final String viewPath = "/msg/sent.jsp";
	private static final String checkPath = "/WEB-INF/check/checkMsgResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
			int from_idx = member.getIdx();
			String to_nickname = request.getParameter("nickname");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			
			Connection conn = JdbcConnection.getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			int to_idx = memberDAO.getMemberIdx(conn, to_nickname);
			
			MsgDAO dao = MsgDAO.getInstance();
			
			int result = dao.write(conn, from_idx, to_idx, title, contents);
			
			System.out.println(from_idx);
			System.out.println(to_idx);
			System.out.println(title);
			System.out.println(contents);
			
			request.setAttribute("writeResult", 1);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		}
	}

}
