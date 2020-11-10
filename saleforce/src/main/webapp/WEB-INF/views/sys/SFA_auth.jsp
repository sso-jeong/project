<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.emp-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.emp-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.modal-wrapper {
	background-color: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	visibility: hidden;
	opacity: 0;
}

.modal-wrapper.open {
	visibility: visible;
	opacity: 1;
	transition: 0.3s;
}

.modal-wrapper.open .modal {
	opacity: 1;
}

.modal {
	width: 1500px;
	height: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	opacity: 0;
	border-radius: 5px;
	padding: 20px;
	box-shadow: -60px 0 100px -90px #000, 60px 0px 100px -90px #000;
}
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb15">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">권한관리 > 회사원권한 등록</p>
				</div>
				<div class="auth-insert m-b15 m-lr15">
					<form name="" method="post" autocomplete="off">
						<div class="auth-info">
							<table>
								<tr>
									<td class="under center bg-green weight700" style="width: 11%;">사원번호/사원명</td>
									<td class="p-lr3" style="width: 22%;">
										<input type="text" name="" id="empid" class="" tabindex="1" style="width: 48%;" disabled="disabled">
										<input type="text" name="" id="empnm" class="input-50" tabindex="2" readonly> 									
									</td>
									<td class="under center bg-green weight700" style="width: 11%;">부서명/직급</td>
									<td class="p-lr3" style="width: 22%;">									
									<select name="" class="dptnm" id="seldeptid" tabindex="3" autofocus style="width: 48%;"></select>
									<select name="" class="gradenm" id="selgrade" tabindex="4" style="width: 48%;"></select>
									</td>
								</tr>
							</table>
						</div>

						<div class="flex flex-justify">
							<div>
							</div>
							<div>
								<input type="button" id="up" class="btn-on center m-t15 m-l5 up" style="line-height: 0px" value="수정" />
								<input type="button" id="del" class="btn-off center m-t15 m-l5 del" style="line-height: 0px" value="삭제" />
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 10px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">권한관리 > 회사원권한 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<span class="btn-normal m-b15 m-lr15">검색 된 사원수 : ${count}명 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_auth" style="margin: 0 10px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'empnm'}">selected</c:if> value="empnm">사원명</option>
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>
			
				<div class="emp-list m-b15 m-lr15" id="empList">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">순번</td>
							<td class="td-7">부서</td>
							<td class="td-7">직위/직급</td>
							<td class="td-5">사번</td>
							<td class="td-5">사원명</td>						
							<td class="td-15">권한</td>
							<td class="td-3">승인체크</td>
							

						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="7">등록된 사원이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="emp" varStatus="status">
						<tr>						
							<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td id=buseotd>${emp.buseoname}</td>
							<td id=gradetd>${emp.gradename}</td>
							<td>${emp.empid}</td>
							<td>${emp.empnm}</td>													
							<td>
								<c:set var="pageauth" value="${emp.deptid}${emp.grade}" />
									<c:choose>
										<c:when test="${emp.deptid == 200}">영업부 권한</c:when>
										<c:when test="${pageauth > 1005}">인사부 근태 권한</c:when>
										<c:when test="${pageauth < 1006}">인사부 일반 권한</c:when>
									</c:choose>
							</td>
							<td class="td-3 center">
							<input type="checkbox" style="width: 100%" value="${emp.empauth}" onClick="confirmChange(this.value, '${emp.empid}', '${emp.empnm}');" <c:if test="${emp.empauth eq 'Y'}">checked</c:if> />
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<!--  페이징 ui -->
					<c:if test="${count > 0}">
						<div class="page-grp center m-t10">
							<!-- 맨 앞으로 -->
							<c:choose>
								<c:when test="${curPage > 1}">
									<a href="${pageContext.request.contextPath}/SFA_auth?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/SFA_auth?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
								</c:when>
								<c:otherwise>
									<span class="page" style="cursor: default"> <i class="fas fa-angle-double-left"></i>
									</span>
									<!-- 한칸 앞으로 -->
									<span class="page" style="cursor: default"> <i class="fas fa-angle-left"></i>
									</span>
									<!-- 한칸 앞으로 -->
								</c:otherwise>
							</c:choose>
							<!-- 맨 앞으로 -->
					
					
					
							<!-- 페이지 번호 출력 -->
							<c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">
								<c:if test="${selected == num}">
									<span class="page page-active"> <a href="" class="f6">${num}</a>
									</span>
								</c:if>
								<c:if test="${selected != num}">
									<a href="${pageContext.request.contextPath}/SFA_auth?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/SFA_auth?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/SFA_auth?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
									</span>
									</a>
								</c:when>
								<c:otherwise>
									<span class="page" style="cursor: default"> <i class="fas fa-angle-right"></i>
									</span>
									<span class="page" style="cursor: default"> <i class="fas fa-angle-double-right"></i>
									</span>
								</c:otherwise>
							</c:choose>
					
						</div>
					</c:if>
				<!--  페이징 ui -->
			</div>
		</div>
	</main>

</body>
<script>
	$(function() {
		$("tr:nth-child(n)").addClass("tr-even");
		load();
		var td2 = $(".emp-list tr:eq(1)").children();
		var emp_id = td2.eq(3).text();		
		getOneEmp(emp_id); 

		$(".emp-list tr").click(function() {
	        var tr = $(this);
	        var td = tr.children();

	        var empid = td.eq(3).text();

	        if(empid != '사번') getOneEmp(empid);
	        else return false;

		});

		

		$('#up').click(function() {		
			var msg = $("#empnm").val() + "의 권한을 변경하시겠습니까?";
			var empid = $("#empid").val();
			var deptid = $("#seldeptid").val();
			var grade = $("#selgrade").val();  
			
			if(confirm(msg)) {
				var formData = { empid : empid, deptid : deptid, grade : grade};
				$.ajax({
					url: "${pageContext.request.contextPath}/updateEmpAuth",
			        type: "post",
			        data: formData,
			        success : function(emp) {
				        window.location.reload();
			        	getOneEmp(emp.empid);
			        },
			        error: function() {
			            alert("시스템 에러");
			        },
				});
			}
		});

		$('#del').click(function(){
			var msg = $("#empnm").val() + "의 정보를 삭제하시겠습니까?"
			var empid = $('#empid').val();

			if(confirm(msg)) {
				var formData = { empid : empid};
				$.ajax({
					url: "${pageContext.request.contextPath}/deleteEmpAuth",
			        type: "post",
			        data: formData,
			        success : function(data) {
				        if(data == "success") window.location.reload();
				        else alert("삭제 오류!!!\n관리자에게 문의 하세요")
			        },
			        error: function(request) {
			            alert("message:"+request.responseText);
			        }
				});
			}
		});
	})
	
	function getOneEmp(empid) {
		var formData = {empid : empid};
		
		$.ajax({
	        url: "${pageContext.request.contextPath}/getOneEmp",
	        type: "post",
	        data: formData,
	        //contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function(emp) {
	        	$("#empnm").val(emp.empnm);
	        	$("#empid").val(emp.empid);
	        	$("#seldeptid").val(emp.deptid);
	        	$("#selgrade").val(emp.grade);	        	     
	        },
	        error: function(request) {
	            alert("message:"+request.responseText);
	        }
	    });
	}

	function confirmChange(empauth, empid, empnm){
		var msg = empnm + "의 승인여부를 변경하시겠습니까?";
		if(confirm(msg)) {
			var auth;
			if(empauth == 'Y'){
				auth = 'N';
			} else auth = 'Y';
		}
		
		var formData = {empauth : auth, empid : empid};

		$.ajax({
			url : "${pageContext.request.contextPath}/updateAuth",
			type : "post",
			data : formData,
			success : function(resData){
				if( resData == "success")
				alert(empnm + "의 승인여부가 변경되었습니다.");
			},
			error : function(){
				alert("변경오류\n관리자에게 문의하세요.");
			},
			complete : function() {
				window.location.reload();
			}
		});
		
	}

	function load() {
	    $.ajax({
	        url: "/saleforce/getBuseoList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#seldeptid").append("<option value="+ value.buseo_id + ">"+value.buseo_name+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	     $.ajax({
	        url: "/saleforce/getGradeList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	            $.each(resData, function(key, value){
	            	$("#selgrade").append("<option value="+ value.grade_id + ">"+value.grade_name+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	}	
</script>

</html>