<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(1);
	dto.setEndRowNum(10);

	//글목록 얻어오기
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	//JSONWriter 클래스의 static 메소드를 이용해서 List<CafeDto> 를 JSON 문자열로 변환해서
	String json = JSONWriter.valueToString(list);
	//클라이언트에게 json 문자열 응답하기(fetch 요청에 대한 응답)
%>
<%=json%>