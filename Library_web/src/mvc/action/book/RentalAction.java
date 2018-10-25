package mvc.action.book;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.BookDAO;
import mvc.dto.MemberDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class RentalAction implements Action {

	private static final String viewPath = "/library";
	private static final String checkPath = "/WEB-INF/check/checkBookResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
			int m_idx = member.getIdx();
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			
			Connection conn = JdbcConnection.getConnection();
			BookDAO dao = BookDAO.getInstance();
			
			if(dao.checkReserve(conn, m_idx, b_idx) > 0) {
				int result2 = dao.reservationRental(conn, m_idx, b_idx);
			}
			int result = dao.rental(conn, m_idx, b_idx);
			
			request.setAttribute("rentalResult", result);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		}
	}

}
