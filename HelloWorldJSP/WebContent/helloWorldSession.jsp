<%@ page import="java.io.*,java.util.*"%>
<%
// Getting session creation time.
Date createTime=new Date(session.getCreationTime());

//Getting last access time of this webpage
Date lastAccessTime = new Date(session.getLastAccessedTime());
String title="Welcome Back to my website";
Integer visitCount = new Integer(0);
String visitCountKey = new String("visitCount");
String userIDKey=new String("userID");
String userID=new String("ABCD");
//Checking if this is a new comer of the webpage.
if(session.isNew())
{
title="Welcome to my website";
session.setAttribute(userIDKey, userID);
session.setAttribute(visitCountKey, visitCount);
}

visitCount=(Integer)session.getAttribute(visitCountKey);
visitCount=visitCount+1;
userID=(String)session.getAttribute(userIDKey);
session.setAttribute(visitCountKey, visitCount);
session.invalidate(); 
%>

<html>
<head>
<title>Session Tracking</title>
</head>

<body>
	<center>
		<h1>Session Tracking</h1>
	</center>
	<table border="1" align="center">
		<tr bgcolor="#949494">
			<th>Session info</th>
			<th>Value</th>
		</tr>
		<tr>
			<td><center>id</center></td>
			<td>
				<% out.print(session.getId()); %>
			</td>
		</tr>
		<tr>
			<td><center>Creation Time</center></td>
			<td>
				<% out.print(createTime); %>
			</td>
		</tr>
		<tr>
			<td>Time of Last Access</td>
			<td>
				<% out.print(lastAccessTime); %>
			</td>
		</tr>
		<tr>
			<td><center>User ID</center></td>
			<td>
				<% out.print(userID); %>
			</td>
		</tr>
		<tr>
			<td><center>Number of visits</center></td>
			<td>
				<% out.print(visitCount); %>
			</td>
		</tr>
	</table>
</body>