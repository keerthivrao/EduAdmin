package com.edu.adm.web.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import com.edu.adm.busModule.UserModule;
import com.edu.adm.busModule.UtilModule;
import com.edu.adm.model.UserDTO;
import com.edu.adm.util.CacheService;
import com.edu.adm.web.form.UserForm;

public class UserAction extends DispatchAction {

	public ActionForward createUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages error = new ActionMessages();
		try {
			
			UtilModule utilModule = new UtilModule();

			boolean dowork = utilModule.inTransaction(
					(String) request.getParameter("transactionnum"),
					request);
			//if (dowork) {
				UserModule userModule = new UserModule();
				UserForm userForm = (UserForm) form;
				if("".equals(userForm.getUserid())) {
					userForm = userModule.createUser(userForm);
					String loginId = userForm.getLoginid();
					error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"user.save.success",loginId));
					
					
				}
				else {
					userModule.updateUser(userForm);
					request.setAttribute("self",userForm.getSelf());
				error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"user.update.success"));
				}
				utilModule.clearTransaction(request);
			//}else {
				//error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("no.refresh"));
			//}

			
		} catch (Exception e) {
			e.printStackTrace();
			error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"user.save.failure"));
		} finally {
			saveMessages(request, error);
		}
		List roles = getRoles();
		request.setAttribute("roles", roles);
		((UserForm) form).setRoles(roles);
		request.setAttribute("userForm", form);

		return mapping.findForward("showUserDetails");
	}

	
	public ActionForward loginUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages error = new ActionMessages();
		UserModule userModule = new UserModule();
		UserDTO userDTO = userModule.validateUser(request.getParameter("username"),request.getParameter("password"));
		if(userDTO != null){
			request.getSession().setAttribute("user",userDTO);
			RoleModule roleModule = new RoleModule();
			RoleForm roleDTO  = roleModule.displayRole(userDTO.getRoleid());
			request.getSession().setAttribute("accessrole",roleDTO);
			String distributorid = userDTO.getDistributorid();
			if(distributorid != null || (!("".equals(distributorid)))) {
				DistributorDTO loggeddist = CacheService.getInstance().getDistributorDetails(userDTO.getDistributorid());
				request.getSession().setAttribute("loggeddist",loggeddist);
			}
			return mapping.findForward("blank");
		}
		else
		{
			error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			"user.login.failure"));
				saveMessages(request, error);
			
			return mapping.findForward("loginfail");
		}
	}
	
	public ActionForward showProfile(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserModule userModule = new UserModule();
		String userid = "";
		UserDTO user = (UserDTO)request.getSession().getAttribute("user");
		userid = user.getUserid();
		List roles = getRoles();
		request.setAttribute("roles", roles);
		request.setAttribute("self", "self");
		
		UserForm userForm = userModule.displayUser(userid);
		userForm.setRoles(roles);
		request.setAttribute("userForm", userForm);
		return mapping.findForward("showUserDetails");
		
	}
	public ActionForward showUserCreationForm(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		UtilModule utilModule = new UtilModule();
		utilModule.initiateTransaction(request);
		List roles = getRoles(); 
		request.setAttribute("roles", roles);
		((UserForm) form).setRoles(roles);
		request.setAttribute("userForm", form);
		return mapping.findForward("showUserDetails");
	}

	public ActionForward updateUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserModule userModule = new UserModule();
		String userid = request.getParameter("userId");
		List roles = getRoles();
		request.setAttribute("roles", roles);
		
		
		UserForm userForm = userModule.displayUser(userid);
		userForm.setRoles(roles);
		request.setAttribute("userForm", userForm);
		return mapping.findForward("showUserDetails");
	}

	public ActionForward addRole(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserModule userModule = new UserModule();

		return mapping.findForward("createRole");
	}

	public ActionForward showUserDetails(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		
		return mapping.findForward("showUserDetails");
	}

	public ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UtilModule utilModule = new UtilModule();
		utilModule.initiateTransaction(request);
		List roles = getRoles(); 
		request.setAttribute("roles", roles);
		((UserForm) form).setRoles(roles);
		request.setAttribute("userForm", form);
		return mapping.findForward("showUserDetails");
		//return mapping.findForward("loginfail");
	}

	public ActionForward showUsers(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("usersList", getUsers());
		request.setAttribute("rolesList", getRoles());
		return mapping.findForward("viewUsers");
	}

	public ActionForward searchUsers(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String firstName = request.getParameter("searchFirstName");
		String lastName = request.getParameter("searchLastName");
		String ssnName = request.getParameter("searchMiddleName");
		String roleId = request.getParameter("userRole");
		UserModule userModule = new UserModule();
		List userDtos = userModule.selectUser(firstName, lastName, ssnName,
				roleId);

		request.setAttribute("usersList", userDtos);
		request.setAttribute("rolesList", getRoles());
		return mapping.findForward("viewUsers");
	}

	private List getRoles() {
		List rolesList = new ArrayList();
		RoleModule roleModule = new RoleModule();
		List roleDtos = roleModule.getRoles(null);
		if (roleDtos != null)
			for (int index = 0; index < roleDtos.size(); index++) {
				RoleDTO roleDTO = (RoleDTO) roleDtos.get(index);

				GenericVO role = new GenericVO();
				role.setLabel(roleDTO.getRolename());
				role.setValue(roleDTO.getRoleid());
				rolesList.add(role);
			}
		return rolesList;
	}

	private List getUsers() {
		List usersList = new ArrayList();
		for (int index = 0; index < 10; index++) {
			UserDTO user = new UserDTO();
			user.setRole("role_" + index);
			user.setFirstname("firstname_" + index);
			user.setJoiningdate("23/12/2304");
			usersList.add(user);
		}
		return usersList;
	}

}
