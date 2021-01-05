package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMember(MemberVO[] members) {// members는 레코드가 여러개=여러줄
		// 서비스 구현메서드 내용(향상된 for반복문 사용)
		int cnt = 0;
		for (MemberVO member : members) {
			// members : 여러 레코드중 1개의 레코드를 각각의 객체값으로 대입
			//ex)
			// 1번째반복 -> members[0]레코드데이터=>MemberVO member객체변수 =>출력시 member.toString();
			// 2번째반복 -> members[1]레코드데이터=>MemberVO member객체변수 =>출력시 member.toString();
			// 3번째반복 -> members[2]레코드데이터=>MemberVO member객체변수 =>출력시 member.toString();
			cnt = cnt + 1;
			System.out.println(cnt + "번째 레코드는 " + member.toString());
		}
		//비지니스 로직에서 처리하는 내용 = 데이터를 가공
		//데이터 select(가져오기), insert(입력하기), update(수정하기), delete(삭제하기) -> CRUD를 구현하는 내용
	}
}
