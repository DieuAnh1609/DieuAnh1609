<%@page import="giohangmodal.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String masanpham = request.getParameter("ms");
		String tensanpham = request.getParameter("ts");
		String size = request.getParameter("size");
		String mausac = request.getParameter("mausac");
		String gia = request.getParameter("gia");
			
	giohangbo gh = null;
	if(session.getAttribute("gh")==null){
		gh = new giohangbo();
		session.setAttribute("gh", gh);
	}
	
	gh = (giohangbo)session.getAttribute("gh");
	
	gh.Them(masanpham, tensanpham, size, mausac, Long.parseLong(gia),(long) 1);
	session.setAttribute("gh", gh);
	response.sendRedirect("htgio.jsp");



%>



</body>
</html>