package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/List")
public class FriendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw=resp.getWriter();
		List<String> names=new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		pw.println("<!doctype html>");
	      pw.println("<html>");
	      pw.println("<head>");
	      pw.println("<meta charset='utf-8'>");
	      pw.println("<title>친구 목록 페이지</title>");
	      pw.println("</head>");
	      pw.println("<body>");       
	      pw.println("<h1>친구목록 입니다</h1>");
	      pw.println("<ul>");
	      for(String tmp:names) {
	    	  pw.println("<li>"+tmp+"</li>");
	      }	      		
	      pw.println("</ul>");
	      pw.println("</body>");
	      pw.println("</html>");
	      pw.close();
	}
}