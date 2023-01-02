import javax.annotation.Resource;
import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teana.domain.member.MemberVO;
import com.teana.persistence.MainDAO;
import com.teana.persistence.MemberDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberDAOTest {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private MainDAO mainDAO;
	
	@Inject
	@Resource(name = "bcryptPasswordEncoder")
	private BCryptPasswordEncoder encoder;

//	@Bean
//	BCryptPasswordEncoder encoder() {
//		return new BCryptPasswordEncoder();
//	}
	
//	@Test
	public void 테스트확인() {
		log.info("♡♡♡♡♡♡♡테스트 확인");
	}
	
//	@Test 
	public void 회원가입() throws Exception{
		log.info("회원가입()");
		MemberVO vo = new MemberVO();
		vo.setMember_id("member_id");
		vo.setMember_pw("member_pw");
//		vo.setPw(pwEncoder.encode("1234"));
		vo.setMember_name("member_name");
//		vo.setBirth(birth);
//		vo.setPhone(phone);
		
		mainDAO.joinMember(vo);
		
		log.info("vo: "+vo);
	} 
	
//	@Test 완료
	public void 로그인() throws Exception {
		log.info("로그인() 호출");
		MemberVO vo = new MemberVO();
		vo.setMember_id("member_id");
		vo.setMember_pw("member_pw");
		MemberVO vo2 = mainDAO.loginMember(vo);
		if(vo2 != null) log.info("로그인 성공: "+vo);
		else log.info("로그인 실패");
	}
	
//	@Test 완료
	public void login() throws Exception {
		log.info("login() 호출");
		MemberVO vo = dao.getMember("admin");
		log.info(""+vo.getMember_id()+"의 개인정보 : "+vo);
	}
	
//	@Test 완료
	public void getMember() throws Exception {
		log.info("getMember() 호출");
		MemberVO vo = dao.getMember("admin");
		if(vo != null) log.info("♡♡♡♡♡♡♡개인정보 가져오기 성공 : "+vo);
		else log.info("개인정보 가져오기 실패");
	}
	
//	@Test
	public void 암호화() throws Exception {
//		log.info(encoder()+"");
		log.info(encoder+"");
	}
	
	
	
	

}
