package org.edu.dao;

import java.util.List;

import org.edu.vo.ChartVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.http.ResponseEntity;

/**
 * 회원관리 DAO 메서드 명세(목차) 인터페이스
 * @author 정도영
 *
 */
public interface IF_MemberDAO {
	public int countMember(PageVO pageVO) throws Exception;
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception;//jsp 향상된 forEach문 사용 jstl태그
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	//theows 스프링을 예외보내면, 나중에 예외처리 전용 error.jsp를 만들어서 에러메시지를 뿌리는 사용자단사용
	//회원상세보기에 대한 결과용, jsp 사용할때 memberVO.user_id, memberVO.user_name
	public MemberVO readMember(String user_id) throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
	public ChartVO getData();//챠트테스트용 RestAPI
	public void insertData(ChartVO chartVO);
	public void updateData(ChartVO chartVO);
	public void delData();
}
