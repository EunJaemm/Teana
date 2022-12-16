package com.teana.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teana.domain.SHA256;
import com.teana.domain.member.MemberVO;
import com.teana.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	   private MemberService service;
	   
	   String loginID;

	   private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	   
	   // http://localhost:8088/member/mypage
	   @RequestMapping(value="/mypage", method=RequestMethod.GET)
	   public void mypageGET(String loginID, HttpSession session, Model model) throws Exception{
		  log.info("mypageGET(loginID) 호출");
	      loginID = (String)session.getAttribute("loginID");
	      MemberVO vo = service.getMember(loginID);
	      model.addAttribute("vo", vo);
	   }
	   
	   @RequestMapping(value="/password", method=RequestMethod.GET)
	   public void mypagePasswordGET() throws Exception{
		  log.info("mypagePasswordGET() 호출");  
	   }
	   
	   @RequestMapping(value="/password", method=RequestMethod.POST)
	   public String mypagePasswordPOST(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception{
		   log.info("mypagePasswordPOST() 호출");
		   String encryptPw= SHA256.encrypt(request.getParameter("member_pw"));
		   loginID = (String)session.getAttribute("loginID");
		   MemberVO vo = service.getMember(loginID);
		   if(vo.getMember_pw().equals(encryptPw)) {
			   return "redirect:/member/update";
		   } else {
			   rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			   return "redirect:/member/password";
		   }
		   
	   }
	   
	   @RequestMapping(value="/update", method = RequestMethod.GET)
	   public void updateGET(HttpSession session, Model model) throws Exception{
	      log.info("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡updateGET() 호출");
	      String id = (String)session.getAttribute("loginID");
	      MemberVO vo = service.getMember(id);
	      model.addAttribute("vo", vo);
//	      return "/member/update";
	   }
	   
	   @RequestMapping(value="/update", method = RequestMethod.POST)
	   public String updatePOST(HttpSession session, HttpServletRequest requset,
			   RedirectAttributes rttr) throws Exception{
		   log.info("updatePOST() 호출");
		   String member_id = (String)session.getAttribute("loginID");
		   String member_pw = requset.getParameter("pw");
		   String member_name = requset.getParameter("nick");
		   int birth = Integer.parseInt(requset.getParameter("birth"));
		   int phone = Integer.parseInt(requset.getParameter("phone"));
		   
				  
		   // 로그인한 회원의 기존 정보 불러오기
		   MemberVO vo = service.getMember(member_id);
		   
		   vo.setMember_pw(SHA256.encrypt(member_pw));
		   vo.setMember_name(member_name);
		   vo.setBirth(birth);
		   vo.setPhone(phone);
		  
		   
		   int result = service.updateMember(vo);
		   if(result == 1) {
			   rttr.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
			   return "redirect:/member/mypage";
		   } else {
			   rttr.addFlashAttribute("msg", "알 수 없는 이유로 회원정보 수정에 실패했습니다.");
			   return "/member/update";
		   }
	   }

	   // http://localhost:8088/member/logout  완료
	   @RequestMapping(value="/logout", method=RequestMethod.GET)
	   public String logoutGET(HttpSession session) throws Exception{
	      log.info("logoutGET() 호출");
//	      session.setAttribute("loginID", "admin");
	      session.invalidate();
	      log.info("로그아웃 성공");
	      return "redirect:/main/main";
	   }
	   
	   @RequestMapping(value="/delete", method=RequestMethod.GET)
	   public void deleteGET() throws Exception {
	      log.info("deleteGET() 호출");
	      
	   }
	   
	   @RequestMapping(value="/deletePop", method=RequestMethod.GET)
	   public void deletePopGET() throws Exception {
	      log.info("deletPopGET() 호출");
	      
	   }
	   
	   @RequestMapping(value="/delete", method=RequestMethod.POST)
	   public String deletePOST(HttpServletRequest reqeust, HttpSession session,
			   RedirectAttributes rttr) throws Exception {
		   log.info("비밀번호 일치 여부 확인 후 deletePOST() 호출");
		   // 로그인한 회원의 아이디 불러온 뒤 아이디값으로 탈퇴하기
		   
		   	   String member_id = (String)session.getAttribute("loginID");
			   int result = service.deleteMember(member_id);
			   if(result == 1 ) {
				   rttr.addFlashAttribute("msg", "탈퇴되었습니다.");
				   session.invalidate();
				   return "redirect:/main/main";
			   }
			   else {
				   rttr.addFlashAttribute("msg", "탈퇴에 실패했습니다.");
				   return "redirect:/member/delete";
			   }
	   }


}
