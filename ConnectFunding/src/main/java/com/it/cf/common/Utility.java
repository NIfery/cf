package com.it.cf.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {  //detail view에서 첨부파일 내용 보여주기
	public static String getFileInfo(String originalFileName, HttpServletRequest request,
									long fileSize) {
		String result ="";
		if(originalFileName != null && !originalFileName.isEmpty()) {
			double dFileSize = fileSize/1000.0;
			dFileSize = Math.round(dFileSize*10)/10.0;
			result ="<img src='"+request.getContextPath() +"/resources/images/file.gif'>";
			
			result += originalFileName + "("+dFileSize+"KB)";
		}
		return result;
	}
	
	public static String secretAcc(String accountNo) {
		String accNo=accountNo.substring(accountNo.length()-4, accountNo.length());
		
		return accNo;
	}
}
