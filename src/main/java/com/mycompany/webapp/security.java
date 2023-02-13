package com.mycompany.webapp;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class security {

	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		enc.setPassword("wldusdP");
		System.out.println(enc.encrypt("oracle.jdbc.driver.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@kosa402.iptime.org:50041:orcl"));
		System.out.println(enc.encrypt("team5"));
		System.out.println(enc.encrypt("oracle"));
	}

}
