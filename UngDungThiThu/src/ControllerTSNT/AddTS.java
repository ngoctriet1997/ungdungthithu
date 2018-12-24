package ControllerTSNT;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DataAccess;
import Modal.ThiSinh;

/**
 * Servlet implementation class AddTS
 */
@WebServlet(name= "AddTS",urlPatterns = {"/AddTS"})
public class AddTS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String soDienThoai=request.getParameter("SoDienThoai");
		String ten=request.getParameter("Ten");
		String matKhau=request.getParameter("MatKhau");
		DataAccess da = new DataAccess();
		da.addts(soDienThoai, ten, matKhau);
		response.sendRedirect("DanhSachThiSinh");
	}

}
