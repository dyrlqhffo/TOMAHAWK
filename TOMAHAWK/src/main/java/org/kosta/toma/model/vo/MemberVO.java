package org.kosta.toma.model.vo;

public class MemberVO {
	private String email;
	private String nick;
	private String name;
	private String password;
	private String tel;
	private long admin;

	public MemberVO() {
		super();
	}

	public MemberVO(String email, String nick, String name, String password, String tel, long admin) {
		super();
		this.email = email;
		this.nick = nick;
		this.name = name;
		this.password = password;
		this.tel = tel;
		this.admin = admin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public long getAdmin() {
		return admin;
	}

	public void setAdmin(long admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", nick=" + nick + ", name=" + name + ", password=" + password + ", tel="
				+ tel + ", admin=" + admin + "]";
	}
}
