package egovframework.market.login.service;

import java.sql.Date;

public class Authority {
	private int id;
	private String authority;
	private Date regDate;
	private Date updDate;

	public Authority() {
		super(); // TODO Auto-generated constructor stub
	}
	public Authority(int id, String authority) {
		super();
		this.id = id;
		this.authority = authority;
		this.regDate = null;
		this.updDate = null;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdDate() {
		return updDate;
	}
	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}
	@Override
	public String toString() {
		return "Authority [id=" + id + ", authority=" + authority + ", regDate=" + regDate + ", updDate=" + updDate
				+ "]";
	}
}
