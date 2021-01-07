package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) throws IOException {
		// 실행 메서드
		MemberVO memberVO = new MemberVO();
		memberVO.setName("정도영");
		memberVO.setAge(45);
		memberVO.setPhoneNum("000-0000-0000");
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("정도영");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("정도영");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		
		if(memberVO2 == memberVO3) {
			System.out.println("동일객체=인스턴스");
		}else {
			System.out.println("다른오브젝트");
		}
		
		// 각 레코드마다 담을 수 있는 클래스오브젝트를 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;
		// 좀더 개선된 방식으로 출력(↓) 서비스전용 클래스(MemberService)를 만들어서 처리.
		MemberService memberService = new MemberService();// 자바 오브젝트객체를 생성하는 방법(함수)
		memberService.printMember(members);// 서비스클래스의 메서드호출
		
		//서버시간 가져오기 코딩
		//서버시간을 가져올 수 있는 commns-net
		//실행시 메이븐 디펜던시 사용 라이브러리를 추가.
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(1000);
		//네트워크로 서버시간을 가져올때, 접속 시간이 1초를 넘기면 재접속. ex) 2000 = 2초?
		timeClient.open();
		//pool.ntp.org는 서버시간을 보내줄 실제 서버 주소.
		InetAddress address = InetAddress.getByName("pool.ntp.org");
		TimeInfo timeInfo = timeClient.getTime(address);
		//서버시간을 담은 timeinfo 객체변수를 사용
		//TimeStamp 1970년부터 초단위로 계산된 현재까지의 초를 합친 결과값
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		//위 반환받은 타임스탬프 초 값을 알아볼수 있는 시간으로 변환(아래)
		Date nowDate = new Date(returnTime);
		//System.out.println("현재 서버시간은-영어 " + nowDate);
		//Wed Dec 09 11:24:03 KST 2020 -> 2020/12/09 11:24:03 AM
		//SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println("현재 서버시간은-한국 " + formatDate.format(nowDate));
		LocalDateTime localDateTime = nowDate.toInstant().
				atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		System.out.println("Server 시간: " + localDateTime);
		System.out.println("로컬PC 시간: " + localDateTime.now());
	}

}
