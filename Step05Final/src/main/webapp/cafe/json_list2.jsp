<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한 페이지에 몇개씩 표시할 것인지
   final int PAGE_ROW_COUNT=5;
   //하단 페이지를 몇개씩 표시할 것인지
   final int PAGE_DISPLAY_COUNT=5;
   
   //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
   int pageNum=1;
   
   //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
   String strPageNum=request.getParameter("pageNum");
   //만일 페이지 번호가 파라미터로 넘어 온다면
   if(strPageNum != null){
      //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
      pageNum=Integer.parseInt(strPageNum);
   }   
   
   //보여줄 페이지의 시작 ROWNUM
   int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
   //보여줄 페이지의 끝 ROWNUM
   int endRowNum=pageNum*PAGE_ROW_COUNT;
   
   //하단 시작 페이지 번호 
   int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   //하단 끝 페이지 번호
   int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
   //전체 글의 갯수
   int totalRow=CafeDao.getInstance().getCount();
   //전체 페이지의 갯수 구하기
   int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
   //끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
   if(endPageNum > totalPageCount){
      endPageNum=totalPageCount; //보정해 준다. 
   }
   
   //CafeDto 객체를 생성해서 
   CafeDto dto=new CafeDto();
   //위에서 계산된 startRowNum 과 endRowNum 을 담고
   dto.setStartRowNum(startRowNum);
   dto.setEndRowNum(endRowNum);
   
   //CafeDto 를 인자로 전달해서 글목록 얻어오기
   List<CafeDto> list=CafeDao.getInstance().getList(dto);

   //JSONObject 객체를 생성해서 
   JSONObject obj=new JSONObject();
   //특정 키값으로 저장할 값을 담는다. 
   obj.put("list", list);
   obj.put("pageNum", pageNum);
   obj.put("startPageNum", startPageNum);
   obj.put("endPageNum", endPageNum);
   obj.put("totalPageCount", totalPageCount);
   
   //JSONWriter 클래스의 static 메소드를 이용해서 JsonCafeDto 를 JSON 문자열로 변환해서 
   String json = JSONWriter.valueToString(obj);
   //클라이언트에게 json 문자열 응답하기(fetch 요청에 대한 응답) 
   
%>
<%=json%>
