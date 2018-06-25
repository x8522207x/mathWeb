<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ascdc.sinica.dhtext.db.DBText"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Set"%>
<%@ page import ="java.util.TreeSet"%>
<%
request.setCharacterEncoding("UTF-8");
String partNumber = request.getParameter("partNumber");
String watch = (request.getParameter("watch") == null)? "" :request.getParameter("watch");
String delete = (request.getParameter("delete") == null)? "" :request.getParameter("delete");
String add = (request.getParameter("add") == null)? "" :request.getParameter("add");
DBText a = new DBText();
a.connection();
if(watch.equals("true")){	
	ArrayList<String>question = new ArrayList<String>();
	ArrayList<String>answer = new ArrayList<String>();
	String partChapter	= request.getParameter("partChapter");
	String b[][] =a.getData("SELECT `question`, `answer` FROM `practiceq` WHERE `partNumber`='"+partNumber+"' and `partChapter`= '"+partChapter+"'");
	
	if(b != null){
		for(int i=0;i<b.length;i++){
			question.add(b[i][0]);
			answer.add(b[i][1]);
		}
		response.getWriter().print(question+"="+answer);
	}
}else if(delete.equals("true")){
	a.updateData("DELETE FROM `practiceq` WHERE `partNumber` = '"+partNumber+"'");
}else if(add.equals("true")){
	String partChapter	= request.getParameter("partChapter");
	String question	= request.getParameter("question");
	String answer	= request.getParameter("answer");
	a.executeSQLInsert("INSERT INTO `practiceq`( `partNumber`,`partChapter`, `question`, `answer`) VALUES ('"+partNumber+"','"+partChapter+"','"+question+"','"+answer+"')");
}
a.closeConnection();
%>