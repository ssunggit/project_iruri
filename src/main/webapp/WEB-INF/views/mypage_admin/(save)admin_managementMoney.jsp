<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="CONTEXT_PATH_ADMIN" value="${pageContext.request.contextPath}/mypage/admin"	
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<!-- 경로를 확인해 주세요 -->
<title>관리자페이지</title>
<!-- 페이지 이름을 적어주세요 -->
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/admin/admin_main_managementMoney.css">
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
</head>
<body>
	<div class="iruri__wrapper">
		<%@ include file="../include/headerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->
	</div>

	<div class="wrap">
		<div class="userInfoBox">
			<h2>관리자명</h2>
			<p>
				관리자명<br> iruri123@iruri.com
			</p>
		</div>
		<div id="admin_managementMenu">
			<ul>
			<li>
				<a href="${CONTEXT_PATH_ADMIN}/main">
                    회원관리<br><span></span>
                </a></li>
                <li>
                <a href="${CONTEXT_PATH_ADMIN}/trainer/list">
                    트레이너관리<br><span></span>
                </a>
                </li>
                <li >
                <a href="${CONTEXT_PATH_ADMIN}/paylist">
                    <span class="admin_active">수익관리</span><br><span class="under_line"></span>
                </a>
                </li>
			</ul>
		</div>

		<!---------------------- 수익관리 하위 메뉴 -------------------------->
		<div id="admin_memberTabMenu">
			<input type="radio" id="tap1" name="taps" onclick="loadList('all')"
				value="1"> <label for="tap1">전체수익</label> <input
				type="radio" id="tap2" name="taps" onclick="loadList('trainer')"
				value="2"> <label for="tap2">트레이너별 수익</label>
		</div>

		<!---------------------- 전체수익 탭 -------------------------->
		<div id="moneylist">
						
		</div>

	</div>
	<script type="text/javascript">
	
	$(document).ready(function(){
		loadList('all');
	});
	
	function loadList(part) {
		if(part == 'all'){
			$("#tap2").attr("checked", false);
			$("#tap1").attr("checked", true);
			$("#moneylist").html("./maypage_admin/admin_managementMoney_all.jsp");
		} else if(part == 'trainer') {
			$("#tap2").attr("checked", true);
			$("#tap1").attr("checked", false);
			$("#moneylist").load("${CONTEXT_PATH_ADMIN}/main");
		}
	}
	</script>
	
	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>