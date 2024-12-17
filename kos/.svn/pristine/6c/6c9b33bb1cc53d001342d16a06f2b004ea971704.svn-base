package com.kos.main.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kos.main.service.mainService;
import com.kos.vo.main.mainInfoVO;

@Controller
public class mainController {

	@Autowired
	mainService service;

	@RequestMapping("/home")
	public String home() throws Exception {
		return "/home";
	}

	@RequestMapping("/main")
	public String main() throws Exception {
		return "/main";
	}

	@RequestMapping("/main/setlist")
	@ResponseBody
	public mainInfoVO getMenuList(@ModelAttribute mainInfoVO vo) throws Exception {

		int totalPage = service.selectTotalMenuPageCnt(vo);

		List<mainInfoVO> list = service.selectMenuList(vo);

		mainInfoVO menuvo = new mainInfoVO();
		menuvo.setMenuList(list);
		menuvo.setTotal(totalPage);
		menuvo.setStartPage(vo.getStartPage());
		menuvo.setCurrentPage(vo.getCurrentPage());

		return menuvo;
	}

	@RequestMapping("/main/getInfo")
	@ResponseBody
	public mainInfoVO getInfo(@ModelAttribute mainInfoVO vo) throws Exception {
		vo = service.selectMenuInfo(vo);
		return vo;
	}

	@RequestMapping("/main/serchMember")
	@ResponseBody
	public mainInfoVO getMemberInfo(@ModelAttribute mainInfoVO vo) throws Exception {
		vo = service.selectMemberInfo(vo);
		if (vo == null) {
			vo = new mainInfoVO();
			vo.setPoint(0);
		}
		return vo;
	}

	@RequestMapping("/main/joinMember")
	@ResponseBody
	public boolean memberSave(@ModelAttribute mainInfoVO vo) throws Exception {
		int cnt = 0;
		int cnt1 = 0;
		cnt = service.insertMember(vo); // TBL_MEMBER_INFO에 회원정보 입력하는
		cnt1 = service.insertPoint(vo); // TBL_POINT에 포인트 사용 이력 입력하는
		if (cnt > 0 && cnt1 > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/main/usePoint") // 포인트 사용
	@ResponseBody
	public boolean usePoint(@ModelAttribute mainInfoVO vo) throws Exception {
		int cnt = 0;
		int cnt1 = 0;
		cnt = service.useMemberPoint(vo); // 멤버테이블 포인트 사용
		cnt1 = service.usePoint(vo); // 포인트테이블 포인트 사용
		if (cnt > 0 && cnt1 > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/main/earnpoint") // 포인트 적립
	@ResponseBody
	public boolean earnPoint(@ModelAttribute mainInfoVO vo) throws Exception {
		int cnt = 0;
		int cnt1 = 0;
		cnt = service.earnMemberPoint(vo); // 멤버테이블 포인트 적립
		cnt1 = service.earnPoint(vo); // 포인트테이블 포인트 적립
		if (cnt > 0 && cnt1 > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/main/insertOrder") // 포인트 적립
	@ResponseBody
	public boolean insertOrder(@ModelAttribute mainInfoVO vo) throws Exception {

		String newOrderNo = service.createNewOrderNo(vo); // 새로운 주문번호 생성
		vo.setOrderNo(newOrderNo);

		int cnt = 0;
		cnt = service.insertOrder(vo);

		for (int i = 0; i < vo.getOrderlist().size(); i++) {
			if (vo.getOrderlist().get(i).getMenuCode() != null && !vo.getOrderlist().get(i).getMenuCode().equals("")) {
				vo.getOrderlist().get(i).setOrderNo(vo.getOrderNo());
				service.insertOrderMenu(vo.getOrderlist().get(i)); // orderNo, menuCode, qty
			}
		}
		if (cnt > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/order/getSpeech")
	@ResponseBody
	public String getSpeechFromPython() throws Exception {
		// 파이썬 스크립트 실행 경로 설정
		String pythonScriptPath = "C:\\Users\\SAMSUNG\\eclipse-workspace\\kos\\src\\main\\webapp\\assets\\python\\test.py";

		// ProcessBuilder 객체로 파이썬 스크립트 실행
		ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);

		// 프로세스 시작
		Process process = processBuilder.start();

		// 파이썬에서 출력된 결과를 읽을 InputStream, 파이썬에서 print된 값을 읽어줌
		InputStream inputStream = process.getInputStream();
		// 언어 설정 EUC-KR
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "EUC-KR"));

		String line;
		StringBuilder output = new StringBuilder();

		// 파이썬 스크립트에서 출력된 내용을 한 줄씩 읽어 StringBuilder에 저장
		while ((line = reader.readLine()) != null) {
			output.append(line); // 각 줄을 StringBuilder에 추가
		}

		// 프로세스 종료 대기
		process.waitFor();
		// 파이썬에서 반환된 결과 반환
		// System.out.println(output.toString());
		return output.toString(); 
	}

}
