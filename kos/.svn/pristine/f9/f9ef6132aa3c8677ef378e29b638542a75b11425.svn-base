package com.kos.vo.main;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

import com.kos.vo.common.PageVO;

import lombok.Data;

@Data
public class mainInfoVO extends PageVO {

	private String menuCode;
	private String menuName;
	private String categoryCode;
	private int menuPrice;
	private String menuDetail;
	private String menuSt;
	private String menuUrl;
	@JsonIgnore
	private MultipartFile menuImage;
	private String regDt;
	private String regId;
	private List<mainInfoVO> menuList;
	private String categoryName;

	private String memberPhone;

	private int point;

	private String earnYN;
	private int earnPrice;
	private String discountYN;
	private int discountPrice;
	private int orderPrice;
	private int payPrice;
	private String paymentmethodCode;
	private String orderNo;

	private List<mainInfoVO> orderlist;
	private int qty;

	private String request;

}
