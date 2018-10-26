package mvc.action.msg;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.MsgDAO;
import mvc.dto.MemberDTO;
import mvc.dto.MsgDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class RecievedListAction implements Action {

	private static final int BOOK_ONEPAGE = 5;
	private static final int BOOK_ONESECTION = 5;

	
	private static final String viewPath = "/msg/recievedList.jsp";
	private static final String checkPath = "/WEB-INF/check/checkBookResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
			int m_idx = member.getIdx();
			
			Connection conn = JdbcConnection.getConnection();
			MsgDAO dao = MsgDAO.getInstance();
			
			int allCount = dao.recieved_allCount(conn);
			int onePage = BOOK_ONEPAGE;
			int oneSection = BOOK_ONESECTION;
			
			int totalPage = allCount / onePage + (allCount % onePage != 0 ? 1 : 0);
			
			int page = 1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				if(page < 1 || page > totalPage) {
					try {
						response.sendRedirect(request.getContextPath());
					} catch (IOException e) {
						e.printStackTrace();
					}
					return;
				}
			}
			
			int startPage = (page - 1) / oneSection * oneSection;
			if(startPage % oneSection == 0) startPage += 1;
			
			int endPage = startPage + oneSection - 1;
			if(endPage > totalPage) endPage = totalPage;
			
			ArrayList<MsgDTO> list = dao.recievedList(conn, page, onePage, m_idx);
			
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		}
	}

}
