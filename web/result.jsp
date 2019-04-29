<%@ page import="main.java.ProcessInputServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>result</title>
</head>
<body>

<b>Query results:</b> <br>

<br> Looking for type = ${input}  <br/> <br/>
<br> TYPE_VALUE = <%= ProcessInputServlet.TYPE_VALUE == null ? "not found" : ProcessInputServlet.TYPE_VALUE %> </br>
<br> DESCRIPTION = <%= ProcessInputServlet.DESCRIPTION == null ? "not found" : ProcessInputServlet.DESCRIPTION%> </br>
<br> TYPE_ATTRIBUTE = <%= ProcessInputServlet.TYPE_ATTRIBUTE == null ? "not found" : ProcessInputServlet.TYPE_ATTRIBUTE%> </br>
<br> ALT_VALUE_1 = <%= ProcessInputServlet.ALT_VALUE_1 == null ? "not found" : ProcessInputServlet.ALT_VALUE_1%> </br>
<br> ALT_VALUE_2 = <%= ProcessInputServlet.ALT_VALUE_2 == null ? "not found" : ProcessInputServlet.ALT_VALUE_2%> </br>
<br> ALT_VALUE_3 = <%= ProcessInputServlet.ALT_VALUE_3 == null ? "not found" : ProcessInputServlet.ALT_VALUE_3%> </br> <br>

</body>
</html>
