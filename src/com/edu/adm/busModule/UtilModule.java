package com.edu.adm.busModule;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class UtilModule {
	/**
	 * @param args
	 */
	public static final String __UI_DATE_FORMAT = "MM/dd/yyyy"; 
	public static final String __DB_DATE_FORMAT = "yyyy-MM-dd"; 
	public static final long __DAY_MILLIS = 24*60*60*1000;
	public static String displayJSPName(String name) {

		return "(" + name + ")";

	}

	public static String getPresentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat(__UI_DATE_FORMAT);
		Date d = new Date();
		return sdf.format(d);
	}
	public static String getPresentDBDate() {
		SimpleDateFormat sdf = new SimpleDateFormat(__DB_DATE_FORMAT);
		Date d = new Date();
		return sdf.format(d);
	}	
	public static String getDBDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(__DB_DATE_FORMAT);
		return sdf.format(date);
	}
	public static String getUIDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(__UI_DATE_FORMAT);
		return sdf.format(date);
	}	
	public static String replaceQuotes(String value) {
		if (value != null)
			return value.replaceAll("'", "''");
		else
			return value;
	}

	public int initiateTransaction(HttpServletRequest request) {
		Random r = new Random();
		int i = r.nextInt();
		request.getSession().setAttribute("transaction", i+"");

		return i;

	}

	public boolean inTransaction(String tranint,HttpServletRequest request) {

		String sesstranint = (String) request.getSession().getAttribute(
				"transaction");
		if ((sesstranint != null) && (tranint != null)) {
			if (sesstranint.equals(tranint)) {
				return true;
			}
		}
		return false;

	}

	public void clearTransaction(HttpServletRequest request) {

		request.getSession().setAttribute("transaction", "NULL");

	}

	public static String getUIDate(String dbDate,String format) {
		String uiDate = null;
		try {
			if ((dbDate != null) && (!("".equals(dbDate))) && (!("_".equals(dbDate)))) {
				if(format == null || "".equals(format))
					format = __DB_DATE_FORMAT;
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
				Date d = null;				
				d = simpleDateFormat.parse(dbDate);
				format = __UI_DATE_FORMAT;
				simpleDateFormat = new SimpleDateFormat(format);
				uiDate = simpleDateFormat.format(d);			
			} 
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		finally
		{
			return uiDate;
		}
	}
	
	public static String getUIDate(String date) {
		if ((date != null) && (!("".equals(date))) && (!("_".equals(date)))) {
			SimpleDateFormat sdf = new SimpleDateFormat(__UI_DATE_FORMAT);
			Date d = null;
			String uiDate = null;
			try {
				d = new Date(date);
				uiDate = sdf.format(d);
			} catch (IllegalArgumentException e) {
				return date;
			}
			if (uiDate == null) {
				return date;
			} else {
				return uiDate;
			}
		} else
			return "";
	}
	public static String getDBDate(String uiDate,String format) {
		String dbDate = null;
		try {
			if ((uiDate != null) && (!("".equals(uiDate))) && (!("_".equals(uiDate)))) {
				if(format == null || "".equals(format))
					format = __UI_DATE_FORMAT;
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
				Date d = null;				
				d = simpleDateFormat.parse(uiDate);
				format = __DB_DATE_FORMAT;
				simpleDateFormat = new SimpleDateFormat(format);
				dbDate = simpleDateFormat.format(d);			
			} 
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		finally
		{
			return dbDate;
		}
	}
	public static String getDBDate(String uiDate) {
		return getDBDate(uiDate,__UI_DATE_FORMAT);
	}
	public static String getUIcurrency(float currency) {
		// if((currency != null) && (!("".equals(currency)))&&
		// (!("_".equals(currency))))
		NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);

		String curr = nf.format(currency);
		String dec = curr.substring(curr.length() - 3,curr.length());
		if(".00".equals(dec)) 
			curr = curr.substring(0, curr.length() - 3);
		curr = curr.replace("$", "Rs.");
		return curr;

	}
}
