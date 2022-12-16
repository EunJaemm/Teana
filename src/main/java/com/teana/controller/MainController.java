package com.teana.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teana.domain.SHA256;
import com.teana.domain.member.MemberVO;
import com.teana.service.MainService;
import com.teana.service.MemberService;


public class MainController {
	private static final Logger log = LoggerFactory.getLogger(MainController.class);

	@Inject
	private MainService mainService;
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model, HttpSession session) throws Exception{
		log.info("/main -> main.jsp");
		session.setAttribute("isUpdate", false);
		
	}
	
	// http://localhost:8088/main/join
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public void joinGET() throws Exception{
			log.info("/main/join -> join.jsp");
		}

		@RequestMapping(value = "/join", method = RequestMethod.POST)
	    public String joinPOST(MemberVO vo, HttpServletRequest request,
	    		RedirectAttributes rttr) throws Exception {
		      log.info("joinPOST(vo) -> login.jsp");
		      String member_id = request.getParameter("member_id");
		      String member_pw = request.getParameter("member_pw");
		      log.info("비밀번호: " + member_pw);
		      // 비밀번호 암호화
		      String encryptPw = SHA256.encrypt(member_pw);
		      log.info("암호화된 비밀번호: " + encryptPw);
		      String member_name = request.getParameter("member_name");
		      int birth = Integer.parseInt(request.getParameter("birth"));
		      int phone = Integer.parseInt(request.getParameter("phone"));
		      
		      vo.setMember_id(member_id);
		      vo.setMember_pw(encryptPw);
		      vo.setMember_name(member_name);
		      vo.setBirth(birth);
		      vo.setPhone(phone);
		      
		      log.info("회원가입 정보: " + vo);
		        
		      mainService.joinMember(vo);
		      log.info("회원가입 성공");
		      
		      rttr.addFlashAttribute("msg1", "회원가입 성공!");
		      rttr.addFlashAttribute("msg2", "로그인 페이지로 이동합니다.");
		      

		      return "redirect:/main/login";
		      
		}
		
		@RequestMapping(value="/nickCheck", method=RequestMethod.POST)
		public void nickCheckGET() throws Exception {
			log.info("닉네임 체크하러 이동");
		}
		
		// 로그인 페이지 이동
		@RequestMapping(value = "/login", method = {RequestMethod.GET,})
		public String loginGET(HttpServletRequest request, Model model, 
				HttpSession session) throws Exception {
			log.info("loginGET() 호출");
			String serverUrl = request.getScheme()+"://"+request.getServerName();
			if(request.getServerPort() != 80) {
				serverUrl = serverUrl + ":" + request.getServerPort();
			}
			
			return "/main/login";
		}
		
		// http://localhost:8088/main/login
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginPOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
			log.info("loginPOST() 호출");
			// 사용자가 입력한 비밀번호 암호화
			
			String encryptPw = SHA256.encrypt(vo.getMember_pw());
			log.info("암호화된 비밀번호"+encryptPw);
			// 암호화된 비밀번호로 수정
			vo.setMember_pw(encryptPw);
			MemberVO vo2 = mainService.loginMember(vo);
			if (vo2 != null) {
				log.info("로그인 성공");
				session.setAttribute("loginID", vo2.getMember_id());
				session.setAttribute("nick", vo2.getMember_name());
				rttr.addFlashAttribute("msg", "'"+vo2.getMember_name() + "'님, 환영합니다♡");
				return "redirect:/main/main";
			} else {
				log.info("로그인 실패");
				rttr.addFlashAttribute("msg", "아이디가 없거나 <br> 아이디 또는 비밀번호가 일치하지 않습니다.");
				return "redirect:/main/login";
			}

		}


}
