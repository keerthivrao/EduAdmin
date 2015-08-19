package com.edu.adm.busModule;

import java.util.ArrayList;
import java.util.List;

import com.edu.adm.model.UserDTO;
import com.edu.adm.web.form.UserForm;
import com.db.access.DBEngine;
import com.db.access.Query;
import com.db.access.QueryReader;
import com.db.access.QueryResults;

public class UserModule {

	public UserForm createUser(UserForm userForm) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		Query query = QueryReader.getInstance().getQuery("INSERT_USER");
		List data = new ArrayList(0);
		
		String firstName = userForm.getFirstname();
		String lastName = userForm.getLastname();
		int i = 1;
		String loginId = "";
		if(firstName != null && firstName.length()>4)
			loginId = firstName.substring(0,4)+i;
		else
			loginId = firstName+i;
		while(loginExists(loginId,null)) {
			if(firstName != null && firstName.length()>4)
				loginId = firstName.substring(0,4)+(++i);
			else
				loginId = firstName+(++i);
		}
		userForm.setLoginid(loginId);
		String pwd = getencryptPwd(loginId);
		userForm.setPwd(pwd);
		data.add(firstName);
		data.add(lastName);
		data.add(userForm.getLastname());
		data.add(UtilModule.getDBDate(userForm.getDateofbirth()));
		//AddressModule addressModule = new AddressModule();
		//AddressDTO addressDTO = getAddress(userForm);
		int addressId;
		String aid = userForm.getAddressid();
		if(aid == null || "".equals(aid)) {
		//	addressId = addressModule.createAddress(addressDTO);
		//	userForm.setAddressid("" + addressId);
		}

		data.add(userForm.getAddressid());
		data.add(userForm.getRoleid());
		data.add(userForm.getSsn());
		if (userForm.getActive())
			data.add("Y");
		else
			data.add("N");
		data.add("");
		data.add(UtilModule.getPresentDBDate());
		data.add(UtilModule.getPresentDBDate());
		data.add(loginId);	
		data.add(pwd);
		data.add(userForm.getDistributorid());
		try {
			results = (QueryResults) engine.execute(query, data, null);
		} catch (Exception e) {
			e.printStackTrace();
			return userForm;
		}
		
		if(results.getGeneratedNum() > 0) {
			userForm.setUserid("" + results.getGeneratedNum());
			return userForm;
		} else
			return userForm;
	}

	public int updateUser(UserForm userForm) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		Query query = QueryReader.getInstance().getQuery("UPDATE_USER");
		List data = new ArrayList(0);
		
		data.add(userForm.getFirstname());
		data.add(userForm.getMiddlename());
		data.add(userForm.getLastname());
		data.add(UtilModule.getDBDate(userForm.getDateofbirth()));
//		AddressModule addressModule = new AddressModule();
//		AddressDTO addressDTO = getAddress(userForm);
//		int addressId = addressModule.updateAddress(addressDTO);
		userForm.setAddressid(userForm.getAddressid());

		data.add(userForm.getAddressid());
		data.add(userForm.getRoleid());
		data.add(userForm.getSsn());
		if ("on".equals(userForm.getActive1()))
			data.add("Y");
		else
			data.add("N");

		data.add("");
		data.add(UtilModule.getPresentDBDate());
		data.add(UtilModule.getPresentDBDate());
		String pwd = "";
		if("-99999".equals(userForm.getCpwd()))
			pwd = userForm.getPwd();
		else
			pwd = getencryptPwd(userForm.getCpwd());
		data.add(pwd);
		data.add(userForm.getDistributorid());
		data.add(userForm.getUserid());
		
		
		try {
			results = (QueryResults) engine.execute(query, data, null);
			return results.getAffectedRows();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List deleteUser(String Id) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		Query query = QueryReader.getInstance().getQuery("DELETE");
		List data = new ArrayList(0);
		data.add(Id);
		try {
			results = (QueryResults) engine.execute(query, data, null);
			return results.getResults();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public UserForm displayUser(String Id) {
		List users = (List) selectUser(Id);
		UserForm userForm = new UserForm();
		if (users.size() == 1) {
			UserDTO userDTO = (UserDTO) users.get(0);
			if ("Y".equals(userDTO.getActive()))
				userForm.setActive1("on");
			else
				userForm.setActive1("");
			userForm.setAddressid(userDTO.getAddressid());
			userForm.setAddress1(userDTO.getAddress1());
			userForm.setAddress2(userDTO.getAddress2());
			userForm.setCity(userDTO.getCity());
			userForm.setCountry(userDTO.getCountry());
			userForm.setUserid(userDTO.getUserid());
			userForm.setDateofbirth(UtilModule.getUIDate(userDTO.getDateofbirth(),UtilModule.__DB_DATE_FORMAT));
			userForm.setEmail(userDTO.getEmail());
			userForm.setFirstname(userDTO.getFirstname());
			userForm.setLastname(userDTO.getLastname());
			userForm.setMiddlename(userDTO.getMiddlename());
			userForm.setMobile(userDTO.getMobile());
			userForm.setZip(userDTO.getZip());
			userForm.setState(userDTO.getState());
			userForm.setPhone(userDTO.getPhone());
			userForm.setWork(userDTO.getWork());
			userForm.setRoleid(userDTO.getRoleid());
			userForm.setSsn(userDTO.getSsn());
			userForm.setLoginid(userDTO.getLoginid());
			userForm.setPwd(userDTO.getPwd());
			userForm.setDistributorid(userDTO.getDistributorid());
			
			return userForm;
		}
		return null;
	}

	public List selectUser(String Id) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		Query query = QueryReader.getInstance().getQuery("SELECT_USER");
		List data = new ArrayList(0);
		data.add(Id);
		try {
			results = (QueryResults) engine.execute(query, data,
					"UserDTO");
			return results.getResults();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List selectUser(String firstName, String lastName, String ssnName,
			String roleId) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		Query query = QueryReader.getInstance().getQuery("SEARCH_USER");
		List data = new ArrayList(0);
		String queryString = query.getQuery();
		if (firstName != null && (!("".equals(firstName))))
			queryString += " AND FIRST_NAME LIKE '%" + firstName + "%'";
		if (lastName != null && (!("".equals(lastName))))
			queryString += " AND LAST_NAME LIKE '%" + lastName + "%'";

		if (ssnName != null && (!("".equals(ssnName))))
			queryString += " AND SSN LIKE '%" + ssnName + "%'";
		if (roleId != null && (!("".equals(roleId))))
			queryString += " AND U.ROLE_ID = " + roleId + "";

		// data.add(Id);
		try {
			results = (QueryResults) engine.execute(queryString, query, data,
					"UserDTO");
			return results.getResults();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	
	private boolean loginExists(String loginId, String userId) {
		DBEngine engine = new DBEngine();
		Query query = QueryReader.getInstance().getQuery();
		query.setQuery("SELECT user_id ID from user_details where LOWER(LOGIN_ID) ='"
						+ UtilModule.replaceQuotes(loginId.toLowerCase()) + "'");
		String queryString = query.getQuery();
		if ((userId != null) && (!("".equals(userId)))&&(!("-1".equals(userId)))) {
			queryString+=" AND  USER_ID != " + userId;
		}
		query.setMode("SELECT");
		List data = new ArrayList(0);
		try {
			QueryResults results = (QueryResults) engine.execute(queryString,query, data,
					"UtilDTO");
			if (results != null) {
				if (results.getSize() > 0) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	public String getencryptPwd(String pwd) {
		DBEngine engine = new DBEngine();
		Query query = QueryReader.getInstance().getQuery();
		query.setQuery("SELECT MD5('" + UtilModule.replaceQuotes(pwd) + "') encryptpwd");
		query.setMode("SELECT");
		List data = new ArrayList(0);
		String pswd = "";
		try {
			QueryResults results = (QueryResults) engine.execute(query, data,
					"UtilDTO");
			if (results != null) {
				System.out.println(results.getSize());
				for (int index = 0; index < results.getSize(); index++) {
//					pswd = (((UtilDTO) results.getBeanData(index))
//							.getEncryptpwd());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return pswd;
		}
		return pswd;
	}
	
	public UserDTO validateUser(String userName, String pwd) {
		DBEngine engine = new DBEngine();
		QueryResults results = null;
		pwd = getencryptPwd(pwd);
		Query query = QueryReader.getInstance().getQuery("VALIDATE_USER");
		System.out.println("QUERY : [" + query.getQuery() + "]");
		System.out.println("userName : [" + userName + "]");
		System.out.println("pwd : [" + pwd + "]");
		List data = new ArrayList(0);
		data.add(userName);
		data.add(pwd);
		try {
			results = (QueryResults) engine.execute(query, data,
					"UserDTO");
			
			if (results != null) {
				if (results.getSize() > 0) {
					return (UserDTO) results.getBeanData(0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}


}