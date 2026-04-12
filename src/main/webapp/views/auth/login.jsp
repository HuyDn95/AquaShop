<%--
  Created by IntelliJ IDEA.
  User: huykan
  Date: 4/12/2026
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<form action="login" method="post">
    <input name="username" placeholder="Username"/>
    <input name="password" type="password" placeholder="Password"/>
    <button type="submit">Login</button>

    <p style="color:red">${error}</p>
</form>