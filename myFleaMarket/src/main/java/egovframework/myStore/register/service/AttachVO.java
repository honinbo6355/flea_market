package egovframework.myStore.register.service;

import java.util.Date;
import java.util.List;

public class AttachVO {
	private String storedFileName;
	private String origFileName;
	private int prodId;
	private double fileSize;
	private Date regDate;
	private Date updDate;
	private List<AttachVO> attachList;
	
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public String getOrigFileName() {
		return origFileName;
	}
	public void setOrigFileName(String origFileName) {
		this.origFileName = origFileName;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
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
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "AttachVO [storedFileName=" + storedFileName + ", origFileName=" + origFileName + ", prodId=" + prodId
				+ ", fileSize=" + fileSize + ", regDate=" + regDate + ", updDate=" + updDate + ", attachList="
				+ attachList + "]";
	}
}
