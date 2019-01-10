<%--
  Created by IntelliJ IDEA.
  User: irina.rozhnovskaya
  Date: 1/3/2019
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
  </head>
  <body>
  <h1>Retrieving Cookie from browser</h1>
  <br>
  <%
    Cookie[] cks=request.getCookies();
    for(Cookie ck:cks)
    {
      String cn=ck.getName();
      String cv=ck.getValue();

  %>
  Cookie name : <b><%=cn %> </b><br>
  Cookie Value : <b><%=cv %> </b><br>
  <%
    }
  %>
  </body>
</html>
