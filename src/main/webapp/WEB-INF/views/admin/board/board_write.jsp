<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시글등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시글등록</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- 본문내용 Main content -->
    <section class="content">
      <div class="container-fluid">
        
        <div class="row"><!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"><!-- 그리드시스템중 12가로칼럼 width:100% -->
          
          <!-- form start -->
          <form name="write_form" action="/admin/board/board_write" method="post" encType="multipart/form-data">
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">CREATE Board</h3>
              </div>
              <!-- /.card-header -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">title</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요." required>
                    <!-- 폼에서 input같은 입력태그에는 name속성이 반드시 필요, 이유는 DB에 입력할때,
                    	 값을 전송하게 되는데, 전송값을 담아두는 이름이 name가 되고, 위에서는 user_id 입니다. -->
                  </div>
                  <div class="form-group">
                  	<label for="content">Content</label>
                  	<textarea rows="5" name="content" id="content" class="form-control"></textarea>
                  	<!-- 필수입력 값은 html5에서 지원하는 유효성 검사중 required 속성을 사용해서 빈(null)값체크(유효성검사)를 합니다. -->
                  </div>
                  <div class="form-group">
                  	<label for="writer">writer</label>
                  	<input value="${session_userid}" type="text" class="form-control" name="writer" id="writer" placeholder="작성자를 입력해 주세요" required>
                  </div>
                  <div class="form-group" style="margin-bottom:0px;">
                  <label>attach</label>
                  </div>
                  <div class="custom-file">
                    <input type="file" name="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부</label>
                  </div>
                </div>
                <!-- /.card-body -->
              
           </div>
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="/admin/board/board_list" class="btn btn-primary float-right mr-1">LIST ALL</a>
              	<button type="submit" class="btn btn-danger float-right mr-1">SUBMIT</button>              	
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지는 못합니다. 그래서, button태그를 사용. -->
            </div>
          <!-- 버튼영역 끝 -->
          
          </form>
          <!-- 폼내부에 버튼이 있어야지만, 전송버튼이 작동 됩니다. -->
          
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<!-- 첨부파일 부트스트랩 디자인 JS -->
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 첨부파일 선택한 내용 출력 실행 -->
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
<link rel="stylesheet" href="/resources/plugins/summernote/summernote.css">
<style>
.note-editor.note-frame.fullscreen{background:white;}
</style>
<script src="/resources/plugins/summernote/summernote.js"></script>
<script>
$(document).ready(function(){
	$('#content').summernote({
		height:150,
		lang:"ko-KR",
		placeholder:'글 내용을 입력해 주세요',
		toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['link','video']],//'picture',
				    ['view', ['fullscreen', 'help']]
				],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
</script>