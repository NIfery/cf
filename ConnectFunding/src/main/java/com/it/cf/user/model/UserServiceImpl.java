package com.it.cf.user.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserDAO userDao;

	@Override
	public int insertUser(UserVO vo) {
		return userDao.insertUser(vo);
	}

	@Override
	public UserVO selectByEmail(String userEmail) {
		return userDao.selectByEmail(userEmail);
	}

	@Override
	public int loginCheck(String userEmail, String userPwd) {
		String dbPwd = userDao.selectPwd(userEmail);
		
		int result=0;
		if(dbPwd.equals(userPwd)) {
			result=LOGIN_OK;
		}else {
			result=NO_PWD;
		}//
		
		return result;
	}

	@Override
	public int updateProfile(UserVO vo) {
		return userDao.updateProfile(vo);
	}

	@Override
	public UserVO selectByNo(int userNo) {
		return userDao.selectByNo(userNo);
	}
	
	@Override
	public int updatePwd(UserVO vo) {
		return userDao.updatePwd(vo);
	}//

	//비밀번호 변경 전에 현재 비밀번호 입력, 일치여부 확인
	@Override
	public int checkPwd(String userEmail, String pwd) {
		String dbPwd = userDao.selectPwd(userEmail);
		
		int result=0;
		if(pwd.equals(dbPwd)) {
			result= PWD_OK;
		}else {
			result= PWD_NO;
		}
		return result;
	}

	@Override
	public int checkEmail(String userEmail) {
		int result=0;
		
		int count = userDao.checkEmail(userEmail);
		if(count>0) {
			result=UNUSABLE_EMAIL;	//2
		}else {
			result=USABLE_EMAIL;	//1
		}
		
		return result;
	}

	@Override
	public int checkNickname(String userNickname) {
		int result=0;
		
		int cnt = userDao.checkNickname(userNickname);
		if(cnt>0) {
			result=UNUSABLE_NICKNAME;	//2
		}else {
			result=USABLE_NICKNAME;	//1
		}
		
		return result;
	}

	@Override
	public int outUser(String userEmail) {
		return userDao.outUser(userEmail);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(UserVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "아이디";
		String hostSMTPpwd = "비밀번호";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "connectFunding@gmail.com";
		String fromName = "connectFunding";
		String subject = "";
		String msg = "";

		if(div.equals("findPw")) {
			subject = "connectFunding 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587, gmail 이용시 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, vo.getUserName());
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, UserVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		vo=userDao.selectByEmail(vo.getUserEmail());
		// 가입된 이메일이 아니면
		if(userDao.checkEmail(vo.getUserEmail()) ==0) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserPwd(pw);
			// 비밀번호 변경
			userDao.updatePwd(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findPw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}//

}