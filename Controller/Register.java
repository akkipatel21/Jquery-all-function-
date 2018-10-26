package Controller;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Register extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String fn=request.getParameter("firstname");
		String ln=request.getParameter("lastname");
		String ph=request.getParameter("phone");
		System.out.println(fn);
		System.out.println(ln);
		System.out.println(ph);
		/*request.setAttribute("Msg", "Uploded Successfully");
    	getServletContext().getRequestDispatcher("/register.html").forward(request, response);	
    	*/
		
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/angular","root","root");
		PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?)");
		ps.setString(1,fn);
		ps.setString(2,ln);
		ps.setString(3,ph);
		
		
		int i=ps.executeUpdate();
		if(i>0)
		out.print("You are successfully registered...");
		
			
		}catch (Exception e2) {System.out.println(e2);}
		
		out.close();
	
	}

}

