package com.model2.mvc.service.domain;

import java.sql.Date;


public class Purchase {
	
	private User buyer;								//user 객체 이용 -> 구매자
	private String dlvyAddr;						//배송지
	private String dlvyDate;						//배송일
	private String dlvyRequest;					//요청사항
	private Date orderDate;						//주문일
	private String paymentOption;			//지불법
	private Product purchaseProd;			//product 객체 이용 -> 구매상품
	private String receiverName;				//받는 사람
	private String receiverPhone;				//받는 사람 연락처
	private String tranCode;						//배송코드
	private int tranNo;									//배송번호
	private int orderNo;								//주문번호
	private int purchaseCount;					//구매개수(수량)
	
	public Purchase(){
	}
	
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public String getDlvyAddr() {
		return dlvyAddr;
	}
	public void setDlvyAddr(String dlvyAddr) {
		this.dlvyAddr = dlvyAddr;
	}
	public String getDlvyDate() {
		return dlvyDate;
	}
	public void setDlvyDate(String dlvyDate) {
		this.dlvyDate = dlvyDate;
	}
	public String getDlvyRequest() {
		return dlvyRequest;
	}
	public void setDlvyRequest(String dlvyRequest) {
		this.dlvyRequest = dlvyRequest;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public Product getPurchaseProd() {
		return purchaseProd;
	}
	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getTranCode() {
		return tranCode;
	}
	public void setTranCode(String tranCode) {
		if(tranCode != null){
			this.tranCode = tranCode.trim();
		}
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getPurchaseCount() {
		return purchaseCount;
	}
	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Purchase [");
		if (buyer != null)
			builder.append("buyer=").append(buyer).append(", ");
		if (dlvyAddr != null)
			builder.append("dlvyAddr=").append(dlvyAddr).append(", ");
		if (dlvyDate != null)
			builder.append("dlvyDate=").append(dlvyDate).append(", ");
		if (dlvyRequest != null)
			builder.append("dlvyRequest=").append(dlvyRequest).append(", ");
		if (orderDate != null)
			builder.append("orderDate=").append(orderDate).append(", ");
		if (paymentOption != null)
			builder.append("paymentOption=").append(paymentOption).append(", ");
		if (purchaseProd != null)
			builder.append("purchaseProd=").append(purchaseProd).append(", ");
		if (receiverName != null)
			builder.append("receiverName=").append(receiverName).append(", ");
		if (receiverPhone != null)
			builder.append("receiverPhone=").append(receiverPhone).append(", ");
		if (tranCode != null)
			builder.append("tranCode=").append(tranCode).append(", ");
		builder.append("tranNo=").append(tranNo).append(", orderNo=").append(orderNo).append(", purchaseCount=")
				.append(purchaseCount).append("]");
		return builder.toString();
	}


}