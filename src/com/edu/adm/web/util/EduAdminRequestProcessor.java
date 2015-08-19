package com.edu.adm.web.util;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.tiles.TilesRequestProcessor;
import org.omg.CORBA.Request;

public class EduAdminRequestProcessor extends TilesRequestProcessor {
	protected boolean processPreprocess(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String login = request.getParameter("acode");
		if((session.getAttribute("user") == null || session.getAttribute("accessrole") == null)||(session.getAttribute("user") == null && !"99999".equals(login) && (!("loginUser".equals(login)))))
		{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			try {
				rd.forward(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}		
		return true;
	}	
}
