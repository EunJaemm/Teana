package com.teana.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teana.domain.member.MemberVO;
import com.teana.service.MemberService;

@Controller
@RestController
@RequestMapping("/ajax/*")
public class AjaxController {
	
	private static final Logger Log = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public ResponseEntity<String> idcheck(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String member_id = request.getParameter("id");
		MemberVO  vo = service.getMember(member_id);
		Log.info(vo + "");
		String result = "";
		
		if (vo != null) {
			result = "no";
			rttr.addFlashAttribute("idflag", true);
		} else
			result = "ok";
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/namecheck", method = RequestMethod.GET)
	public ResponseEntity<String> nickcheck(HttpServletRequest request) throws Exception {
		String member_name = request.getParameter("name");
		Log.info("name :" + member_name);
		MemberVO vo = service.getMemberName(member_name);
		Log.info("vo : " + vo);
		String result = "";
		
		if (vo != null)
			result = "no";
		else if (vo == null)
			result = "ok";
		Log.info("result: " + result);
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	

}
