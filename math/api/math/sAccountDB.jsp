<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ascdc.sinica.dhtext.db.DBText"%>

<%
request.setCharacterEncoding("UTF-8");
DBText a = new DBText();
String account	= request.getParameter("account");
String register = (request.getParameter("register") == null)? "" :request.getParameter("register");
String check = (request.getParameter("check") == null)? "" :request.getParameter("check");
a.connection();
boolean result = true;
if(register.equals("true")){
	String password	= request.getParameter("password");
	String email	= request.getParameter("email");
	String name	= request.getParameter("name");
	String Dept	= request.getParameter("Dept");		
	if(account != null && Dept!= null){
		a.executeSQLInsert("INSERT INTO `student-account`( `account`, `password`, `email`, `name`, `Dept`) VALUES ('"+account+"','"+password+"','"+email+"','"+name+"','"+Dept+"')");
	}
	a.closeConnection();
}else if(check.equals("true")){
	String data[][]=a.getData("SELECT  `account` FROM `student-account`");
	a.closeConnection();
	if(data != null){
		for(int i=0;i<data.length;i++){
			result = true;
			if(account.equals(data[i][0])){
				result = false;
				response.getWriter().print(result); 
				break;
			}
		}
		if(result != false){
			response.getWriter().print(result);
		}		
	}else{
		result = true;
		response.getWriter().print(result); 
	}
}

%>