package com.mycompany.webapp.email.controller;

import java.sql.Date;
import java.util.Calendar;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calendar calendar = Calendar.getInstance(); 
		calendar.add(Calendar.MONTH, -10); //1년 더하기 
		java.util.Date utilDate = calendar.getTime();
		Date sqlDate = new Date(utilDate.getTime());
		System.out.println(sqlDate);

	}

}
