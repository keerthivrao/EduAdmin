package com.edu.adm.web.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

public class UserForm extends ActionForm {
	private String firstname = "";
	private String middlename = "";
	private String lastname = "";
	private String dateofbirth = "";
	private String addressid = "";
	private String roleid = "";
	private String ssn = "";
	private String userid = "";
	private String address1 = "";
	private String address2 = "";
	private String city = "";
	private String zip = "";
	private String state = "";
	private String country = "";
	private String phone = "";
	private String mobile = "";
	private String work = "";
	private String email = "";
	private boolean active = true;
	private String active1 = "";
	private String startdate = "";
	private String enddate = "";
	private String acode = "";
	private String loginid = "";
	private String pwd = "";
	private String cpwd = "";
	private String transactionnum ="";
	private String distributorid = "";
	private String self="";
	
	private List roles = new ArrayList();


	public List getRoles() {		
		return roles;
	}

	public void setRoles(List roles) {
		this.roles = roles;
	}

	public String getFirstname()
	{
		return firstname;
	}

	public void setFirstname(String firstname)
	{
		this.firstname = firstname;
	}

	public String getMiddlename()
	{
		return middlename;
	}

	public void setMiddlename(String middlename)
	{
		this.middlename = middlename;
	}

	public String getLastname()
	{
		return lastname;
	}

	public void setLastname(String lastname)
	{
		this.lastname = lastname;
	}

	public String getDateofbirth()
	{
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth)
	{
		this.dateofbirth = dateofbirth;
	}

	public String getAddressid()
	{
		return addressid;
	}

	public void setAddressid(String addressid)
	{
		this.addressid = addressid;
	}

	public String getRoleid()
	{
		return roleid;
	}

	public void setRoleid(String roleid)
	{
		this.roleid = roleid;
	}

	public String getSsn()
	{
		return ssn;
	}

	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}

	public String getTransactionnum() {
		return transactionnum;
	}

	public void setTransactionnum(String transactionnum) {
		this.transactionnum = transactionnum;
	}

	public String getActive1() {
		return active1;
	}

	public void setActive1(String active1) {
		this.active1 = active1;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCpwd() {
		return cpwd;
	}

	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}

	public String getDistributorid() {
		return distributorid;
	}

	public void setDistributorid(String distributorid) {
		this.distributorid = distributorid;
	}

	public String getSelf() {
		return self;
	}

	public void setSelf(String self) {
		this.self = self;
	}

}
