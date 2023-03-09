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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.Pager;
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
	 * @return String : 이메일 작성 페이지
	 */
	@GetMapping("/write")
	public String getWriteForm() {
		log.info("실행");
		return "email/write";
	}
	
	@GetMapping("/writedirect")
	public String writeDirect(@RequestParam String empId, Model model) {
		log.info("실행");
		log.info("empId: "+ empId);
		model.addAttribute("empId", empId);
		model.addAttribute("type", "modal");
		return "email/write";
	}
	
	/**
	 * 
	 * @return
	 */
	
	@ResponseBody
	@PostMapping(value="/write", produces="application/json")
	public JSONObject writeEmail(HttpSession session, EmailDetail emailDetail) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		emailDetail.setSendId(employee.getEmpId());
		String[] receiverArr = emailDetail.getReceiveId().split(",");
		for(String receiveEmpId : receiverArr) {
			String receiver = receiveEmpId.trim();
			emailDetail.setReceiveId(receiver);
			int row = emailService.writeEmail(emailDetail);
		}
		
		String result = "success";
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("uri", result);
		return jsonObject;
	}
	
	@GetMapping("/complete")
	public String emailComplete() {
		log.info("실행");
		return "email/complete";
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
	 * @param checkArr : check된 emailId 배열
	 * @param type : 어느 메일함에서 왔는지 구별을 위함
	 * @return String : 메일 update 결과
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
	 * @param checkArr : check된 emailId 배열
	 * @param type : 어느 메일함에서 왔는지 구별을 위함
	 * @return String : 메일 delete 결과
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
	
	
	@GetMapping("/readReceiveEmail")
	public String readReceiveEmail(@RequestParam int receiveEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.readReceiveEmail(receiveEmailId);
		model.addAttribute("emailDetail", emailDetail);
		return "email/receivedetail";
		
	}
	
	@GetMapping("/readSendEmail")
	public String readSendEmail(@RequestParam int sendEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.readSendEmail(sendEmailId);
		model.addAttribute("emailDetail", emailDetail);
		return "email/senddetail";
	}
	
	@GetMapping("/writeTempEmail")
	public String writeTeampEmail(@RequestParam int tempEmailId, Model model) {
		log.info("실행");
		TempEmail tempEmail = emailService.getTempEmailDetail(tempEmailId);
		model.addAttribute("tempEmail", tempEmail);
		return "email/temp";
	}
	
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
	
	
	
	@GetMapping("/restoreEmail")
	public String restoremail(@RequestParam int emailId, Model model, HttpSession session) {
		log.info("실행");
		int row = emailService.restoreEmail(emailId);
		return getTrashEmail(model, session, 1);
	}
	
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
	
	@GetMapping("/deleteDetail")
	public String deleteDetail(@RequestParam("emailId") int emailId, Model model, HttpSession session) {
		log.info("실행");
		String type = "trash";
		int row = emailService.deleteEmail(emailId, type);
		return getTrashEmail(model, session, 1);
	}
	
	@ResponseBody
	@PostMapping("/trashemaildetail")
	public String trashEmail(@RequestParam("emailId") int emailId, @RequestParam("type") String type, Model model, HttpSession session) {
		log.info("실행");
		String result="";
		int row = emailService.throwAwayEmail(emailId, type);
		return result;
	}
	
	@GetMapping("/cancelEmail")
	public String cancelEmail(@RequestParam("emailId") int emailId, Model model, HttpSession session) {
		log.info("실행");
		int row = emailService.cancelEmail(emailId);
		return getSendEmail(model, session, 1);
	}
	
	@GetMapping("/filedownload")
	public ResponseEntity<byte[]> fileDownLoad(@RequestHeader("User-Agent") String userAgent,@RequestParam("emailFileId")int emailFileId) throws UnsupportedEncodingException {
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
	
	@GetMapping("/sendEmailListMain")
	public String emailSendListMain(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		List<MainEmailList> emailList = emailService.getSendMainEmailList(employee.getEmpId());
		model.addAttribute("emailList", emailList);
		return "email/mainemaillist";
	}
	
	@GetMapping("/receiveEmailListMain")
	public String emailReceiveListMain(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		List<MainEmailList> emailList = emailService.getReceiveMainEmailList(employee.getEmpId());
		model.addAttribute("emailList", emailList);
		return "email/mainreceiveemaillist";
	}
	
	@GetMapping("/response")
	public String ResponseEmail(HttpSession session, @RequestParam int receiveEmailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.getEmailDetail(receiveEmailId);
		log.info("emailDetail: "+ emailDetail);
		model.addAttribute("emailDetail", emailDetail);
		model.addAttribute("type", "response");
		return "email/write";
	}
	
	@GetMapping("/reply")
	public String ReplyEmail(HttpSession session, @RequestParam int emailId, Model model) {
		log.info("실행");
		EmailDetail emailDetail = emailService.getEmailDetail(emailId);
		log.info("emailDetail: "+ emailDetail);
		model.addAttribute("emailDetail", emailDetail);
		model.addAttribute("type", "reply");
		return "email/write";
	}
	
}
