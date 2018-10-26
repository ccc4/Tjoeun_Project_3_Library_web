package mvc.action.book;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.BookDAO;
import mvc.dto.BookDTO;
import mvc.dto.MemberDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class ViewAction implements Action {

	private static final String viewPath = "/library/view.jsp";
	private static final String checkPath = "/WEB-INF/check/checkBookResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			
			Connection conn = JdbcConnection.getConnection();
			BookDAO dao = BookDAO.getInstance();
			
			boolean rentalOk = false;
			boolean reserveOk = false;
			boolean returnOk = false;
			boolean cancelOk = false;
			
			BookDTO dto = dao.getBookDTO(conn, b_idx);
			int bookCnt = dto.getCount();
			
			bookCnt -= dao.checkRental(conn, b_idx);
			bookCnt -= dao.checkReserve(conn, b_idx);
			
			if(request.getSession().getAttribute("member") != null) {
				MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
				int m_idx = member.getIdx();
				
				if(bookCnt > 0) {
					rentalOk = true;
					reserveOk = true;
				} else {
					if(dao.checkRental(conn, m_idx, b_idx) > 0) {
						returnOk = true;
					}else if(dao.checkReserve(conn, m_idx, b_idx) > 0) {
						rentalOk = true;
						reserveOk = false;
						cancelOk = true;
					}
				}
			}
			
			request.setAttribute("book", dto);
			request.setAttribute("bookCnt", bookCnt);
			request.setAttribute("rentalOk", rentalOk);
			request.setAttribute("reserveOk", reserveOk);
			request.setAttribute("returnOk", returnOk);
			request.setAttribute("cancelOk", cancelOk);
			
			JdbcCloser.close(conn);
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(checkPath).forward(request, response);
			
		}
	}

}
