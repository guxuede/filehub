<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
    <head></head>  
    <body>  
       <h1>Login11</h1>  <span>${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message} </span>
       <form name='f' action="j_spring_security_check" method='POST'>  
       <input type="hidden" name='j_isAajx' value='true'>
          <table>  
             <tr>  
                <td>User:</td>  
                <td><input type='text' name='j_username' value=''></td>  
             </tr>  
             <tr>  
                <td>Password:</td>  
                <td><input type='password' name='j_password' /></td>  
             </tr>  
             <tr> 
             <td><input type="checkbox" name="_spring_security_remember_me"></td>
                <td><input name="submit" type="submit" value="submit" /></td>  
             </tr>  
          </table>  
      </form>  
    </body>  
    </html>  