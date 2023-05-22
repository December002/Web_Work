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

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw=resp.getWriter();
		MemberDto dto1=new MemberDto(1, "김구라", "노량진");
		MemberDto dto2=new MemberDto(2, "해골", "행신동");
		MemberDto dto3=new MemberDto(3, "원숭이", "상도동");
		
		List<MemberDto> list=new ArrayList<>();
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
		
		pw.println("<!doctype html>");
	    pw.println("<html>");
	    pw.println("<head>");
	    pw.println("<meta charset='utf-8'>");
	    pw.println("<title>회원 목록 페이지</title>");
	    pw.println("</head>");
	    pw.println("<body>");       
	    pw.println("<h1>회원 목록 입니다</h1>");
	    pw.println("<table>");
	    	pw.println("<thaed>");
	    		pw.println("<tr>");
	    			pw.println("<th>번호</th>");
	    			pw.println("<th>이름</th>");
	    			pw.println("<th>주소</th>");
	    		pw.println("</tr>");
	    	pw.println("</thead>");
	    	pw.println("<tbody>");
	    		for(int i=0; i<list.size(); i++) {
	    			MemberDto tmp=list.get(i);
	    			pw.println("<tr>");
	    				pw.println("<td>"+tmp.getNum()+"</td>");
	    				pw.println("<td>"+tmp.getName()+"</td>");
	    				pw.println("<td>"+tmp.getAddr()+"</td>");
	    			pw.println("</tr>");
	    }
	    	pw.println("</tbody>");
	    pw.println("</table>");
	    pw.println("</body>");
	    pw.println("</html>");
	    pw.close(); 
	}
}
