<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<style>
/* 미디어쿼리 all(print,screen,등등), min-width:가로크기 태블릿 이상일경우만 적용 */
@media all and (min-width: 801px) {
	.fix_height {
		height:440px;
		overflow:hidden;
		line-height:440px;
	}
}
.img_topplace { opacity:0.7; }
.img_topplace:hover {/*가상선택자 :, 가성요소 ::*/
	opacity:1.0;
}
</style>
<script>
$(function(){
	//var w = JQuery(window).width();
	//페이지 로딩시 1회만 실행
	var w = $(window).width();
	if(w>801) {
		$(".fix_height").css({"height":(w/3)+"px","line-height":(w/3)+"px"});
	}
	//창 리사이징 이벤트가 발생시 아래 반응형 코딩 추가(사용자 창크기를 마음대로 조정시 height값을 자동조정되게)
	$(window).resize(function(){
		var w = $(window).width();
		console.log("디버그: "+w);
		if(w>801) {
			$(".fix_height").css({"height":(w/3)+"px","line-height":(w/3)+"px"});
		}else{
			$(".fix_height").css({"height":"inherit","line-height":"inherit"});
		}
	});
});
//JQuery(function($){
//$(function(){});
//$(document).ready(function(){});
</script>
	<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 모바일+PC 공통슬라이드영역 -->
    	<div class="main_rolling_pc">
            <div class="visualRoll">
            	<!-- 슬라이드이미지영역 -->
                <ul class="viewImgList">
                    <li class="imglist0">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                    <li class="imglist1">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                    <li class="imglist2">
                        <div class="roll_content">
                            <a href="javascript:;">
							<p class="roll_txtline">OOOO OOOOOOOOO OOOOOOOOO OOOOO</p>
							</a>
                        </div>
                    </li>
                </ul>
                <!-- //슬라이드이미지영역 -->
                <!-- 슬라이드버튼영역 -->
                <div class="rollbtnArea">
                    <ul class="rollingbtn">
                        <li class="seq butt0"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_on.png" alt="1번" /></a></li>
                        <li class="seq butt1"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_off.png" alt="2번" /></a></li>
                        <li class="seq butt2"><a href="#butt"><img src="/resources/home/img/btn_rollbutt_off.png" alt="3번" /></a></li>
                        <li class="rollstop"><a href="#" class="stop"><img src="/resources/home/img/btn_roll_stop.png" alt="멈춤" /></a></li>
                        <li class="rollplay"><a href="#" class="play"><img src="/resources/home/img/btn_roll_play.png" alt="재생" /></a></li>
                    </ul>
                </div>
                <!-- //슬라이드버튼영역 -->
            </div>
        </div>
        <!-- //모바일+PC 공통슬라이드영역 -->
        
		<!-- 갤러리최근게시물영역 -->
		<div class="about_area">
			<h2>겔러리 최근 게시물 <b>TOP 3</b></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
				<c:forEach var="boardVO" items="${board_list}" varStatus="status">
					<c:if test="${status.count<=3}">
					<li class="opacity_hover">
						<a href="/home/board/board_view?board_type=${boardVO.board_type}&bno=${boardVO.bno}&page=1">
							<div class="fix_height">
							<c:if test="${save_file_names[status.index] eq ''}">
								<img class="img_topplace" src="/resources/home/img/no_image.png" alt="OOOO OOOOO" style="opacity:0.7;"/>
							</c:if>
							<c:if test="${save_file_names[status.index] ne '' }">
								<img src="/image_preview?save_file_name=${save_file_names[status.index]}" style="opacity:0.8;" >
							</c:if>
							</div>
							<h3 class="length_limit"><c:out value="${boardVO.title}"></c:out></h3>
							<div class="txt">
								${boardVO.content}
							</div>
							<span class="view">VIEW</span>
						</a>
					</li>
					</c:if>
				</c:forEach>
				</ul>
			</div>
		</div>
		<!-- //갤러리최근게시물영역 -->

		<!-- 카카오톡상담및최근공지사항영역 -->
		<div class="appbbs_area">
			<div class="appbbs_box box_inner clear">
				<h2 class="hdd">상담과 최근게시물</h2>
				<p class="app_line">
					<a href="javascript:;">카카오톡 1:1 상담</a>
					<a href="javascript:;">전화 상담 신청</a>
				</p>
				<div class="bbs_line">
					<h3><a href="/home/board/board_list?board_type=notice">NOTICE</a></h3>
					<ul class="notice_recent">
					<c:forEach var="boardVO" items="${notice_list}">
						<li><a href="/home/board/board_view?board_type=${boardVO.board_type}&bno=${boardVO.bno}&page=1">
						<c:out value="${boardVO.title}"></c:out>
						</a></li>
					</c:forEach>
						
					</ul>
				</div>
			</div>
		</div>
		<!-- //카카오톡상담및최근공지사항영역 -->
	</div>
	<!-- //메이콘텐츠영역 -->

<%@ include file="include/footer.jsp" %>