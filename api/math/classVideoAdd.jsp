<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ascdc.sinica.dhtext.db.DBText"%>

<%
request.setCharacterEncoding("UTF-8");
DBText a = new DBText();
String partNumber	= request.getParameter("partNumber");
String partName	= request.getParameter("partName");
String video	= request.getParameter("video");
a.connection();
a.executeSQLInsert("INSERT INTO `classvideo`( `partNumber`, `partName`, `video`) VALUES ('"+partNumber+"','"+partName+"','"+video+"')");

a.closeConnection();
%>