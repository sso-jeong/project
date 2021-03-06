<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.sale-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.sale-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="page-wrap m-tb10">
		<div class="container">
			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">판매관리 > 판매 등록</p>
			</div>
			<div class="sale-insert m-b5 m-lr15">
				<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setSale" autocomplete="off">
					<table>
						<tr>
							<td class="td-7 under center bg-green weight700">판매번호</td>
							<td class="td-13 p-lr3"><input type="text" name="salenum" id="salenum" class="input-100" readonly></td>

							<td class="td-7 under center bg-green weight700">품목코드/품목명</td>
							<td class="td-13 p-lr3" style="position: relative;">
							<input type="text" name="itemcd" id="itemcd" class="input-40"  required readonly style="background-color: #f3f4f4"> 
							<input type="text" name="itemnm" id="itemnm" class="input-58" readonly style="background-color: #f3f4f4">
								<span id="itemnmp" onclick="popup(this)" style="cursor:pointer; position: absolute; top: 50%; transform: translateY(-50%); right: 15px; color: #000000;"> <i class="fas fa-search"></i>
								</span>
							</td>
								


							<td class="td-7 under center bg-green weight700">수량/단가</td>
							<td class="td-13 p-lr3"><input type="number" name="qty" value=0 id="qty" tabindex="2" style="width: 49%;" required> <input
								type="number" name="uprice" value=0 id="uprice" tabindex="5" style="width: 49%;"></td>

							<td class="td-7 under center bg-green weight700">판매일자</td>
							<td class="td-13 p-lr3"><input type="date" value="${sessionScope.nowdate}" name="saledt" id="saledt" class="input-100" tabindex="3"
								required></td>

							<td class="td-7 under center bg-green weight700">규격</td>
							<td class="td-13 p-lr3"><input type="text" name="std" id="std" class="input-100" tabindex="4"></td>

						</tr>

						<tr>
							<td class="td-7 under center bg-green weight700">수주번호</td>
							<td class="td-13 p-lr3" style="position: relative;">
								<input type="text" name="ordnum" id="ordnum" class="input-100" tabindex="1" autofocus required> 
								<span id="ordnump" onclick="popup(this)" style="cursor:pointer; position: absolute; top: 50%; transform: translateY(-50%); right: 15px; color: #000000;"> <i class="fas fa-search"></i>
								</span>
							</td>
							<td class="td-7 under center bg-green weight700">거래처코드/거래처명</td>
							<td class="td-13 p-lr3" style="position: relative;"><input type="text" name="comcd" id="comcd" class="input-40" tabindex="9" required readonly style="background-color: #f3f4f4"> 
								<input type="text"name="comnm" id="comnm" class="input-58" tabindex="10" readonly style="background-color: #f3f4f4">
								<span id="comnmp" onclick="popup(this)" style="cursor:pointer; position: absolute; top: 50%; transform: translateY(-50%); right: 15px; color: #000000;"> <i class="fas fa-search"></i>
								</span>	
							</td>

							<td class="td-7 under center bg-green weight700">공급가액/부가세</td>
							<td class="td-15 p-lr3"><input type="number" value=0 name="price" id="price" class="input-49 provision" tabindex="11"> <input
								type="number" value=0 name="tax" id="tax" class="input-49 surtax" readonly></td>

							<td class="td-7 under center bg-green weight700">프로젝트/담당자</td>
							<td class="td-13 p-lr3"><input type="text" name="projectnm" id="projectnm" style="width: 63%;" tabindex="7"> <input type="text"
								value="${sessionScope.empname}" name="saleperson" id="saleperson" class="input-35" tabindex="8"></td>

							<td class="td-7 under center bg-green weight700">비고</td>
							<td class="td-11 p-lr3" colspan="3"><input type="text" name="remark" id="remark" class="input-100" tabindex="12"> <input
								type="date" name="regdate" id="regdate" value="${sessionScope.nowdate}" style="display: none;" /></td>
						</tr>
					</table>
					<div class="flex flex-justify">
						<div></div>
						<div>
							<c:if test="${count eq 0}">
								<button type="reset" class="btn-on center m-t5 new" id="new1">초기화</button>	
								<button type="submit" class="btn-on center m-t5 insert">신규등록</button>													
							</c:if>
							<c:if test="${count ne 0}">
								<button type="reset" class="btn-on center m-t5 new" id="new2">초기화</button>
								<button type="submit" class="btn-on center m-t5 insert" id="insert" style="display: none;">신규등록</button>
								<button type="button" class="btn-on center m-t5 up" id="up">수정</button>							
								<button type="button" class="btn-off center m-t5 del" id="del">삭제</button>
								
							</c:if>
						</div>
					</div>

				</form>
				<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
			</div>

			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">판매관리 > 판매 목록</p>
			</div>

			<div class="search-wrap flex flex-justify">
				<div class="">
					<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
					<span class="btn-normal m-b5">검색 된 판매 건 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
				</div>
				<div class="form-wrap">
					<form method="post" action="${pageContext.request.contextPath}/SFA_sale_manage" style="margin: 0 15px;" autocomplete="off">
						<select class="" name="searchOpt">
							<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
							<option <c:if test="${searchOpt eq 'salenum'}">selected</c:if> value="salenum">판매번호</option>
							<option <c:if test="${searchOpt eq 'saledt'}">selected</c:if> value="saledt">판매일자</option>
							<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="comnm">거래처명</option>
							<option <c:if test="${searchOpt eq 'itemnm'}">selected</c:if> value="itemnm">품목명</option>
						</select> <input type="text" name="words" value="${words}" required />
						<button type="submit" class="btn-on">검색</button>
					</form>
				</div>
			</div>

			<div class="sale-list m-b5 m-lr15">
				<table class="list center" style="table-layout: fixed;">
					<tr class="weight700 center font14">
						<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>
						<td class="td-5">순번</td>
						<td class="td-5">판매번호</td>
						<td class="td-7">판매일자</td>
						<td>거래처명</td>
						<td class="td-7">품목코드</td>
						<td>품목명</td>
						<td class="td-5">품목구분</td>
						<td class="td-7">담당자명</td>
						<td class="td-5">수량</td>
						<td class="td-7">단가</td>
						<td class="td-7">공급가액</td>
						<td class="td-7">부가세</td>
						<td class="td-5">비고</td>
					</tr>

					<c:if test="${count == 0}">
						<tr>
							<td class="weight700 center font14 " colspan="14">등록된 판매 건이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${salelist}" var="sale" varStatus="status">
						<tr class="center font14" style="cursor: pointer;">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${sale.salenum}" style="width: 20px; height: 20px;" /></td>
							<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td class="td-5">${sale.salenum}</td>
							<td class="td-7">${sale.saledt}</td>
							<td class="left p-lr5">${sale.comcd}</td>
							<td class="td-7">${sale.itemcd}</td>
							<td class="left p-lr5">${sale.itemnm}</td>
							<td class="td-5">${sale.divnm}</td>
							<td class="td-7">${sale.saleperson}</td>
							<td class="td-5 right p-lr5"><fmt:formatNumber value="${sale.qty}" pattern="#,###"/></td>
							<td class="td-7 right p-lr5"><fmt:formatNumber value="${sale.uprice}" pattern="#,###"/></td>
							<td class="td-7 right p-lr5"><fmt:formatNumber value="${sale.price}" pattern="#,###"/></td>
							<td class="td-7 right p-lr5"><fmt:formatNumber value="${sale.tax}" pattern="#,###"/></td>
							<td class="td-13 center p-lr5">${sale.remark}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<!-- 맨 앞으로 -->
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/SFA_sale_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/SFA_sale_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-left"></i>
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
							<a href="${pageContext.request.contextPath}/SFA_sale_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/SFA_sale_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/SFA_sale_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-double-right"></i>
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
	})

	var td2 = $(".sale-list tr:eq(1)").children();
	var sale_num = td2.eq(2).text();
	if (sale_num != "")
		getOneSale(sale_num);

	$(".sale-list tr").click(function() {
		var tr = $(this);
		var td = tr.children();

		var salenum = td.eq(2).text();
		if (salenum != '판매번호' && salenum != "")
			getOneSale(salenum);
	});

	$("#itemcd").blur(function() {
		getItemInfS($(this).val());
	});

	$("#comcd").blur(function() {
		getCompanynmS($(this).val());
	});

	$("#qty").keyup(function() {
		var sum = $("#uprice").val() * $(this).val();
		$("#price").val(sum);
		$("#tax").val(sum / 10);
	});

	$("#price").keyup(function () {
		$("#tax").val($(this).val() / 10);
	})

	//수정버튼클릭시
	$('#up').click(function() {
		var msg = "해당 판매건을 수정하시겠습니까?";

		if (confirm(msg)) {
			$.ajax({
				url : "${pageContext.request.contextPath}/updateSaleInfo",
				type : "post",
				data : $('#frm').serialize(),
				success : function(data) {
					if (data == "success") {
						window.location.reload();
					} else
						alert("수정 오류!!\n관리자에게 문의 하세요");
				},
				error : function(request) {
					alert("message:" + request.responseText);
				},
			});
		}
	});

	//삭제버튼클릭시
	$('#del').click(function() {
		var msg = "해당 판매건을 삭제하시겠습니까?"

		if (confirm(msg)) {
			var formData = {
				salenum : $('#salenum').val()
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/deleteSaleInfo",
				type : "post",
				data : formData,
				success : function(data) {
					if (data == "success") {
						//alert("성공");
						window.location.reload();
					} else
						alert("삭제 오류!!!\n관리자에게 문의 하세요")
				},
				error : function(request) {
					alert("message:" + request.responseText);
				}
			});
		}
	});

	//선택삭제
	$("#deleteAll").click(function() {
		var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";

		if (confirm(msg)) {
			var chkArray = new Array();
			$(".chk:checked").each(function() { //each = 향상된 for
				chkArray.push($(this).attr("data-uid"));
			});

			$.ajax({
				url : "${pageContext.request.contextPath}/saleDeleteAll",
				type : "POST",
				data : {
					chkArr : chkArray
				}, //controller <- chkArr
				success : function(resData) {
					if (resData == "success") {
						window.location.reload();
					} else
						alert("선택된 판매건이 없습니다.");

				},
				error : function(request) {
					alert("message:" + request.responseText);
				}
			});
		}
	});

	function getItemInfS(itemcd) {
		var formData = {
			itemcd : itemcd
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getItemInfS",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(item) {
				if (item == null) {
					$("#itemcd").val("");
					alert("등록되어 있지 않은 품목코드입니다.");
				} else {
					$("#itemnm").val(item.itemnm);
					$("#std").val(item.std);
					$("#uprice").val(item.uprice);
				}
			},
			error : function(request, status, error) {
				if (request.status == "200") {
					alert("현재 등록된 판매건이 없습니다.");
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		});
	}

	function getCompanynmS(comcd) {
		var formData = {
			comcd : comcd
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getCompanynmS",
			type : "post",
			data : formData,
			dataType : "text", // 수신 데이터 타입
			success : function(comnm) {
				if (comnm == "zero") {
					$("#comcd").val("");
					alert("등록되어 있지 않은 업체코드입니다.");
				} else
					$("#comnm").val(comnm);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function getOneSale(salenum) {
		var formData = {
			salenum : salenum
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getOneSale",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(sale) {
				$("#salenum").val(sale.salenum);
				$("#ordnum").val(sale.ordnum);
				$("#itemcd").val(sale.itemcd);
				$("#itemnm").val(sale.itemnm);
				$("#qty").val(sale.qty);
				$("#std").val(sale.std);
				$("#saledt").val(sale.saledt);
				$("#projectnm").val(sale.projectnm);
				$("#saleperson").val(sale.saleperson);
				$("#comcd").val(sale.comcd);
				$("#comnm").val(sale.comnm);
				$("#uprice").val(sale.uprice);
				$("#price").val(sale.price);
				$("#tax").val(sale.tax);
				$("#remark").val(sale.remark);
			},
			error : function(request) {
				alert("message:" + request.responseText);
			}
		});
	}
	function popup(popup) {
		var id = popup.getAttribute('id');

		if(id == "ordnump"){
			var url = "${pageContext.request.contextPath}/salePopup";
			var name = "수주 목록";
		}else if(id == "itemnmp"){
			var url = "${pageContext.request.contextPath}/itemPopup";
			var name = "품목 목록";
		}else if(id == "comnmp"){
			var url = "${pageContext.request.contextPath}/companyPopup";
			var name = "거래처 목록";
		}else return false;
		
		window.open(url, name, "width=1200, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}
	

	var flag = false;
	function chkAll() {
		var chk = document.getElementsByName("chk");
		if (flag == false) { //선택 x
			flag = true;

			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true;
			}

		} else {
			flag = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false;
			}
		}

	}
</script>

</html>