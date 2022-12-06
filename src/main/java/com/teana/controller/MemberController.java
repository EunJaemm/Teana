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
	   


}
