package org.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.ChartVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		//오브젝트의 메서드를 실행할때,
		//.입력힌트가 나오지 않으면, Ctrl+Space키를 눌러서 메서드 나오게
		//매개변수를 1개로 만들어서 값을 2개 집어넣는 방식-해시데이터를 만들어서 구현.
		/*
		 * Map<String, Object> paramMap = new HashMap<String, Object>();
		 * paramMap.put("search_type", search_type); paramMap.put("search_keyword",
		 * search_keyword);
		 */
		return sqlSession.selectList("memberMapper.selectMember",pageVO);
	}	//sqlSession템플릿의 selectList메서드를 실행하면, memberMapper.selectMember

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.insert("memberMapper.insertMember", memberVO);
		
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.delete("memberMapper.deleteMember", user_id);
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래) .selectOne() sql세션 템플릿안 메서드입니다.
		return sqlSession.selectOne("memberMapper.readMember", user_id);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.update("memberMapper.updateMember", memberVO);
	}

	@Override
	   public int countMember(PageVO pageVO) throws Exception {
	      // mapper.xml에 접근하는 방법(아래)
	      return sqlSession.selectOne("memberMapper.countMember", pageVO);
	}
	
	@Override
	public ChartVO getData() {
		// mapper.xml에 접근하는 방법(아래)
		return sqlSession.selectOne("memberMapper.getData");
	}

	@Override
	public void insertData(ChartVO chartVO) {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.update("memberMapper.insertData", chartVO);
	}

	@Override
	public void updateData(ChartVO chartVO) {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.update("memberMapper.updateData", chartVO);
	}
	
	@Override
	public void delData() {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.delete("memberMapper.delData");
	}
	
}
