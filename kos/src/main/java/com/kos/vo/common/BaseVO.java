package com.kos.vo.common;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseVO {
	
	private String regDt;		//등록일 ( Timestamp : 년월일 시분초 )
	private String updDt;		//수정일 ( Timestamp : 년월일 시분초 )
	private String delYn="N";
	
	private int shopHh;		//UTC 세션시간
	private int shopMm;		//UTC 세션분
	
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getUpdDt() {
		return updDt;
	}
	public void setUpdDt(String updDt) {
		this.updDt = updDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public int getShopHh() {
		return shopHh;
	}
	public void setShopHh(int shopHh) {
		this.shopHh = shopHh;
	}
	public int getShopMm() {
		return shopMm;
	}
	public void setShopMm(int shopMm) {
		this.shopMm = shopMm;
	}
	
	
}
