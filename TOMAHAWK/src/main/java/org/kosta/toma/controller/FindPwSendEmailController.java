package org.kosta.toma.controller;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.MemberVO;

public class FindPwSendEmailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO mvo = new MemberVO();
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		// mail server 설정
		String host = "smtp.naver.com";
		String user = "tomahawkboard@naver.com"; // 자신의 네이버 계정
		String password = "happyhappy!2";// 자신의 네이버 패스워드
		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		// 임시 비밀번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);
		mvo.setPassword(AuthenticationKey);
		MemberDAO.getInstance().updatePw(email, AuthenticationKey);
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		//System.out.println(to_email);
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "Tomahawk"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 메일 제목
			msg.setSubject("안녕하세요 Tomahawk 입니다.");
			// 메일 내용
			msg.setText("임시비밀 번호는 " + temp + " 입니다. \n임시비밀번호로 로그인 후 꼭 비밀번호를 바꿔주세요.");
			Transport.send(msg);
			System.out.println("이메일 전송");
			PrintWriter out = response.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		return "redirect:index.jsp";
	}
}