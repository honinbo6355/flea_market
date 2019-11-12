package egovframework.market.cmmn.service;

import java.util.Date;

public class Category {
	private String cateCode;
	private String cateName;
	private String upperCateCode;
	private int cateLevel;
	private Date regDate;
	private Date updDate;
	
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getUpperCateCode() {
		return upperCateCode;
	}
	public void setUpperCateCode(String upperCateCode) {
		this.upperCateCode = upperCateCode;
	}
	public int getCateLevel() {
		return cateLevel;
	}
	public void setCateLevel(int cateLevel) {
		this.cateLevel = cateLevel;
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
		return "Category [cateCode=" + cateCode + ", cateName=" + cateName + ", upperCateCode=" + upperCateCode
				+ ", cateLevel=" + cateLevel + ", regDate=" + regDate + ", updDate=" + updDate + "]";
	}
}
