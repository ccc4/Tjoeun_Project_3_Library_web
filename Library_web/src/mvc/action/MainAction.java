package mvc.action;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;
import mvc.dao.BookDAO;
import mvc.dto.MemberDTO;
import mvc.dto.RentalListDTO;
import mvc.util.JdbcCloser;
import mvc.util.JdbcConnection;

public class MainAction implements Action{

	private static final String viewPath = "/index.jsp";
	private static final String checkPath = "/WEB-INF/check/checkBoardResult.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			
			if(request.getSession().getAttribute("member") != null) {
				MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
				int m_idx = member.getIdx();
				
				Connection conn = JdbcConnection.getConnection();
				BookDAO dao = BookDAO.getInstance();
				
				ArrayList<RentalListDTO> rentalList = dao.rentalList(conn, m_idx);
				
				request.setAttribute("rentalList", rentalList);
				
				JdbcCloser.close(conn);
			}
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} else if(request.getMethod().equals("POST")) {
			
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		}
	}

}
