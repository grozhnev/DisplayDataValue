<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Get data by TYPE</title>
  </head>
  <body>

  <form action = "${pageContext.request.contextPath}/searchForType"  method = "GET">
      Enter required TYPE: <input type = "text" name = "type_input">
      <br />
      <input type = "submit" value = "search" />
  </form>

  </body>
</html>
