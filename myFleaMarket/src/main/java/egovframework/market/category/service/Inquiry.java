package egovframework.market.category.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Inquiry {
	private int inqNum;
	private int prodId;
	private String email;
	private String nickname;
	private String inqContents;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date regDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date updDate;

	public int getInqNum() {
		return inqNum;
	}
	public void setInqNum(int inqNum) {
		this.inqNum = inqNum;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getInqContents() {
		return inqContents;
	}
	public void setInqContents(String inqContents) {
		this.inqContents = inqContents;
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
		return "Inquiry [inqNum=" + inqNum + ", prodId=" + prodId + ", email=" + email + ", nickname=" + nickname
				+ ", inqContents=" + inqContents + ", regDate=" + regDate + ", updDate=" + updDate + "]";
	}
}
