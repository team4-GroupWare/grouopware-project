package com.mycompany.webapp.email.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.email.model.EmailDetail;
import com.mycompany.webapp.email.model.EmailFile;
import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.model.MainEmailList;
import com.mycompany.webapp.email.model.TempEmail;
import com.mycompany.webapp.email.service.IEmailService;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author LEEYESEUNG
 *
 */
@Controller
@Log4j2
@RequestMapping("/email")
public class EmailController {
	
	@Autowired
	IEmailService emailService;
	
	/**
	 * @author LEEYESEUNG
	 * @param model
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return String : 받은 메일함 페이지
	 */
	@GetMapping("/receivelist")
	public String getReceiveEmail(Model model,HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getReceiveEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getReceiveEmailList(pager, employee.getEmpId());
		log.info("list 개수: "+emailList.size());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "receive";
		model.addAttribute("type", type);
		return "email/emaillist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param model
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return String : 보낸 메일함 페이지
	 */
	@GetMapping("/sendlist")
	public String getSendEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getSendEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getSendEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String kind = "send";
		model.addAttribute("kind", kind);
		return "email/sendlist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param model
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return String : 수신 메일함 페이지
	 */
	@GetMapping("/readlist")
	public String getReadEmail(Model model, HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getReadEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getReadEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String kind = "read";
		model.addAttribute("kind", kind);
		return "email/sendlist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param model 
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return String : 미수신 메일함 페이지
	 */
	@GetMapping("/unreadlist")
	public String getUnReadEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getUnReadEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getUnReadEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String kind = "unread";
		model.addAttribute("kind", kind);
		return "email/sendlist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param model
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return 휴지통 메일함 페이지
	 */
	@GetMapping("/trashlist")
	public String getTrashEmail(Model model, HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getTrashEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getTrashEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "trash";
		model.addAttribute("type", type);
		return "email/emaillist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param model
	 * @param session : loginEmployee
	 * @param pageNo
	 * @return String : 임시보관함 페이지
	 */
	@GetMapping("/templist")
	public String getTempEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getTempEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getTempEmail(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "temp";
		model.addAttribute("type", type);
		return "email/emaillist";
		
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param session : loginEmployee
	 * @param model
	 * @return String : main에 보여줄 보낸 메일 html 조각
	 */
	@GetMapping("/sendEmailListMain")
	public String emailSendListMain(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		List<MainEmailList> emailList = emailService.getSendMainEmailList(employee.getEmpId());
		model.addAttribute("emailList", emailList);
		return "email/mainemaillist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param session : loginEmployee
	 * @param model
	 * @return String : main에 보여줄 받은 ㅁ[일 html 조각
	 */
	@GetMapping("/receiveEmailListMain")
	public String emailReceiveListMain(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		List<MainEmailList> emailList = emailService.getReceiveMainEmailList(employee.getEmpId());
		model.addAttribute("emailList", emailList);
		return "email/mainreceiveemaillist";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @return String : 이메일 작성 페이지
	 */
	@GetMapping("/write")
	public String getWriteForm() {
		log.info("실행");
		return "email/write";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param empId : 받는 사람 empId
	 * @return String : 이메일 작성 페이지
	 */
	@GetMapping("/writedirect")
	public String writeDirect(@RequestParam String empId, Model model) {
		log.info("실행");
		model.addAttribute("empId", empId);
		model.addAttribute("type", "modal");
		return "email/write";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param session
	 * @param receiveEmailId
	 * @param model
	 * @return String : 이메일 작성 페이지
	 */
	@GetMapping("/response")
	public String responseEmail(HttpSession session, @RequestParam int receiveEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.getEmailDetail(receiveEmailId);
		model.addAttribute("emailDetail", emailDetail);
		model.addAttribute("type", "response");
		return "email/write";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param session
	 * @param emailId
	 * @param model
	 * @return String : 이메일 작성 페이지
	 */
	@GetMapping("/reply")
	public String replyEmail(HttpSession session, @RequestParam int emailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.getEmailDetail(emailId);
		model.addAttribute("emailDetail", emailDetail);
		model.addAttribute("type", "reply");
		return "email/write";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailDetail : 이메일 작성 내용을 담은 DTO
	 * @return JSONObject : success을 담은 JSONObject 
	 */
	@ResponseBody
	@PostMapping(value="/write", produces="application/text")
	public String writeEmail(HttpSession session, EmailDetail emailDetail) {
		log.info("실행");
		String result = "success";
		JSONObject jsonObject = new JSONObject();
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		emailDetail.setSendId(employee.getEmpId());
		log.info(emailDetail);
		String[] receiverArr = emailDetail.getReceiveId().split(",");
		for(String receiveEmpId : receiverArr) {
			String receiver = receiveEmpId.trim();
			emailDetail.setReceiveId(receiver);
			try {
				int row = emailService.writeEmail(emailDetail);
			} catch (Exception e) {
				jsonObject.put("result", "fail");
				return "fail";
			}
		}
		
		jsonObject.put("result", result);
		return "success";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @return String : 이메일 보내기 성공한 페이지
	 */
	@GetMapping("/complete")
	public String emailComplete() {
		log.info("실행");
		return "email/complete";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param tempEmailId
	 * @param model
	 * @return String : 임시저장된 글을 수정할 수 있는 페이지
	 */
	@GetMapping("/writeTempEmail")
	public String writeTempEmail(@RequestParam int tempEmailId, Model model) {
		log.info("실행");
		TempEmail tempEmail = emailService.getTempEmailDetail(tempEmailId);
		log.info(tempEmail);
		model.addAttribute("tempEmail", tempEmail);
		return "email/temp";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param tempEmail
	 * @param session
	 * @return String : 성공을 담은 String
	 */
	//작성하던 이메일 임시저장
	@ResponseBody
	@PostMapping(value="/tempsave", produces="application/text; charset=UTF-8")
	public String tempSave(@RequestBody TempEmail tempEmail, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		tempEmail.setSentId(employee.getEmpId());
		int row = emailService.tempSaveEmail(tempEmail);
		String result = "성공";
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param tempEmail
	 * @param session
	 * @return String : 성공을 담은 String
	 */
	//임시저장하던 글을 다시 임시저장
	@ResponseBody
	@PostMapping(value="/tempupdate", produces="application/text; charset=UTF-8")
	public String tempUpdate(@RequestBody TempEmail tempEmail, HttpSession session) {
		log.info("실행");
		log.info(tempEmail);
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		tempEmail.setSentId(employee.getEmpId());
		int row = emailService.updateTempEmail(tempEmail);
		String result = "성공";
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param checkArr : check된 emailId 배열
	 * @param type : 어느 메일함에서 왔는지 구별을 위함
	 * @return String : 중요메일 판단 결과
	 */
	@ResponseBody
	@RequestMapping(value="/importantcheck")
	public String importantCheck(@RequestParam(value="checkArr") String[] checkArr, @RequestParam(value="type")String type) {
		log.info("실행");
		String result= "";
		for(String check : checkArr) {
			int emailId = Integer.parseInt(check);
			int row = emailService.checkImportant(emailId);
			if(row == 1) {
				result="important";
				break;
			}
			result="basic";
		}
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 중요도를 체크할 메일 아이디
	 * @return String : 중요메일 판단 결과
	 */
	@ResponseBody
	@PostMapping("/importantdetailcheck")
	public String importantCheckDetail(@RequestParam("emailId") int emailId) {
		log.info("실행");
		String result= "";
		int row = emailService.checkImportant(emailId);
		if(row == 1) {
			result="important";
		} else {
			result="basic";
		}
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param checkArr : 쓰레기통에 넣을 날짜를 업데이트할 emailId 배열
	 * @param type : 받은 메일인지 보낸 메일인지 구분
	 * @return String : update 성공여부 판단 text
	 */
	@ResponseBody
	@RequestMapping(value="/trashemail")
	public String throwAwayEmail(@RequestParam(value="checkArr") String[] checkArr, @RequestParam(value="type")String type) {
		log.info("실행");
		String result = "fail";
		int row = 0;
		for(String emailIdStr : checkArr) {
			int emailId = Integer.parseInt(emailIdStr);
			row = emailService.throwAwayEmail(emailId, type);
			result = "success";
		}
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param checkArr : 영구삭제 처리할 emailId 배열
	 * @param type : 받은 메일인지 보낸 메일인지 구분
	 * @return String : update 성공여부 판단 text
	 */
	@ResponseBody
	@PostMapping("/deleteemail")
	public String deleteEmail(@RequestParam(value="checkArr") String[] checkArr, @RequestParam(value="type")String type) {
		log.info("실행");
		String result = "fail";
		int row = 0;
		for(String emailIdStr : checkArr) {
			int emailId = Integer.parseInt(emailIdStr);
			row = emailService.deleteEmail(emailId, type);
			result = "success";
		}
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param checkArr : 복구할 메일 id 배열
	 * @return String : 복구 여부 판단 text
	 */
	@ResponseBody
	@PostMapping("/restore")
	public String restoreEmail(@RequestParam(value="checkArr") String[] checkArr) {
		log.info("실행");
		String result = "fail";
		int row = 0;
		for(String emailIdStr : checkArr) {
			int emailId = Integer.parseInt(emailIdStr);
			row = emailService.restoreEmail(emailId);
			result = "success";
		}
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param receiveEmailId
	 * @param model
	 * @return String : 받은 메일 상세 조회 페에지
	 */
	@GetMapping("/readReceiveEmail")
	public String readReceiveEmail(@RequestParam int receiveEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.readReceiveEmail(receiveEmailId);
		model.addAttribute("emailDetail", emailDetail);
		return "email/receivedetail";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param sendEmailId
	 * @param model
	 * @return String : 보낸 메일 상세 조회 페이지
	 */
	@GetMapping("/readSendEmail")
	public String readSendEmail(@RequestParam int sendEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.readSendEmail(sendEmailId);
		model.addAttribute("emailDetail", emailDetail);
		return "email/senddetail";
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailId
	 * @param model
	 * @param session
	 * @return String : 메일 영구 삭제 처리시 쓰레기통 목록으로 이동
	 */
	@GetMapping("/deleteDetail")
	public String deleteDetail(@RequestParam("emailId") int emailId, Model model, HttpSession session) {
		log.info("실행");
		String type = "trash";
		int row = emailService.deleteEmail(emailId, type);
		return getTrashEmail(model, session, 1);
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailId
	 * @param type : 받은 메일인지 보낸 메일인지 판단
	 * @param model
	 * @param session
	 * @return String : update 판단 결과 
	 */
	@ResponseBody
	@PostMapping("/trashemaildetail")
	public String trashEmail(@RequestParam("emailId") int emailId, @RequestParam("type") String type, Model model, HttpSession session) {
		log.info("실행");
		String result="";
		int row = emailService.throwAwayEmail(emailId, type);
		return result;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailId
	 * @param model
	 * @param session
	 * @return String : 메일을 복구하면 쓰레기통 목록 페이지로 이동
	 */
	@GetMapping("/restoreEmail")
	public String restoremail(@RequestParam int emailId, Model model, HttpSession session) {
		log.info("실행");
		int row = emailService.restoreEmail(emailId);
		return getTrashEmail(model, session, 1);
	}

	/**
	 * @author LEEYESEUNG
	 * @param emailId
	 * @param model
	 * @param session
	 * @return String : 발신취소하면 보낸 메일 목록으로 이동
	 */
	@GetMapping("/cancelEmail")
	public String cancelEmail(@RequestParam("emailId") int emailId, Model model, HttpSession session) {
		log.info("실행");
		int row = emailService.cancelEmail(emailId);
		return getSendEmail(model, session, 1);
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param emailFileId
	 * @return  ResponseEntity<byte[]>
	 * @throws UnsupportedEncodingException
	 */
	@GetMapping("/filedownload")
	public ResponseEntity<byte[]> fileDownLoad(@RequestParam("emailFileId")int emailFileId) throws UnsupportedEncodingException {
		log.info("실행");
		EmailFile emailFile = emailService.getFile(emailFileId);
		final HttpHeaders headers = new HttpHeaders();
		log.info(emailFile.getEmailFileContentType());
		String[] mtypes = emailFile.getEmailFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(emailFile.getEmailFileSize());
		String fileName = URLEncoder.encode(emailFile.getEmailFileName(), "UTF-8");
		fileName = fileName.replaceAll("\\+", "%20");
		headers.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<byte[]>(emailFile.getEmailFileData(), headers, HttpStatus.OK);
	}
	
	/**
	 *  ResponseEntity<byte[]>
	 * @param model
	 * @param session
	 * @param type : 게시판 타입
	 * @param keyword : 검색어
	 * @param pageNo
	 * @return String : 각자 보여줄 페이지
	 */
	@GetMapping("/search")
	public String searchEmail(Model model, HttpSession session, @RequestParam String type, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		//임시 보관함 검색 결과 리스트
		if(type.equals("temp")) {
			int row = emailService.getSearchTempCount(keyword, employee.getEmpId());
			Pager pager = new Pager(10, 5, row, pageNo);
			List<EmailList> emailList = emailService.getSearchTempList(pager,keyword, employee.getEmpId());
			model.addAttribute("type", type);
			model.addAttribute("emailList", emailList);
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
		//쓰레기통 검색 결과 리스트
		} else if(type.equals("trash")) {
			int row = emailService.getSearchTrashCount(keyword, employee.getEmpId());
			Pager pager = new Pager(10, 5, row, pageNo);
			List<EmailList> emailList = emailService.getSearchTrashList(pager,keyword, employee.getEmpId());
			model.addAttribute("type", type);
			model.addAttribute("emailList", emailList);
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
		//받은 메일함 검색 결과 리스트
		} else if(type.equals("receive")) {
			int row = emailService.getSearchReceiveCount(keyword, employee.getEmpId());
			Pager pager = new Pager(10, 5, row, pageNo);
			List<EmailList> emailList = emailService.getSearchReceiveList(pager,keyword, employee.getEmpId());
			model.addAttribute("type", type);
			model.addAttribute("emailList", emailList);
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
		//보낸 메일함 검색 결과 리스트
		} else if(type.equals("send")) {
			int row = emailService.getSearchSendCount(keyword, employee.getEmpId());
			Pager pager = new Pager(10, 5, row, pageNo);
			List<EmailList> emailList = emailService.getSearchSendList(pager,keyword, employee.getEmpId());
			model.addAttribute("kind", type);
			model.addAttribute("emailList", emailList);
			model.addAttribute("pager", pager);
			model.addAttribute("keyword", keyword);
			
			return "email/sendlistsearch";
		}
		
		return "email/emaillistpart";
	}
	
	
	
}
