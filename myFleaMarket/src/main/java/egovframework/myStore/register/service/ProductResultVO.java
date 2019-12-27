package egovframework.myStore.register.service;

import java.sql.Date;

public class ProductResultVO {
	private int prodId; /* 상품 아이디 */
	private int userId; /* 유저 아이디 */
	private String cateCode; /* 카테고리 코드 */
	private String upperCateCode; /* 상위 카테고리 코드 */
	private String tradeCode; /* 거래 방식 */ 
	private String statusCode; /* 상품 상태 코드 */ 
	private String title; /* 상품 제목 */ 
	private int price; /* 상품 가격 */
	private String des; /* 상품 설명 */
	private int stock; /* 상품 수량 */
	private String statusName; /* 상품 상태 */
	private String storedFileName;
	private String tradeName;
	private Date regDate;
	private Date updDate;
	
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getUpperCateCode() {
		return upperCateCode;
	}
	public void setUpperCateCode(String upperCateCode) {
		this.upperCateCode = upperCateCode;
	}
	public String getTradeCode() {
		return tradeCode;
	}
	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public String getTradeName() {
		return tradeName;
	}
	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
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
		return "ProductResultVO [prodId=" + prodId + ", userId=" + userId + ", cateCode=" + cateCode
				+ ", upperCateCode=" + upperCateCode + ", tradeCode=" + tradeCode + ", statusCode=" + statusCode
				+ ", title=" + title + ", price=" + price + ", des=" + des + ", stock=" + stock + ", statusName="
				+ statusName + ", storedFileName=" + storedFileName + ", tradeName=" + tradeName + ", regDate="
				+ regDate + ", updDate=" + updDate + "]";
	}
}
