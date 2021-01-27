<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>search company</title>
</head>

<body>
    <div>
        <form id="searchForm" action="/company/search" method="get">
            <select name="type">
                <option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected': ''}"/>>
                    회사명
                </option>
                <option value="B" <c:out value="${pageMaker.cri.type eq 'B' ? 'selected': ''}"/>>
                    지점명
                </option>
            </select>
            <input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }' />
            <input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
            <button>검색</button>
        </form>
    </div>
    <table>

        <tr>
            <th>고유번호</th>
            <th>상호</th>
            <th>대표자</th>
            <th>가입일</th>
            <th>지점</th>
            <th></th>
        </tr>
<c:forEach items="${companyList}" var="company">
    <c:forEach var="branchList" items="${company.branchList}">
        <tr>
            <td><c:out value='${company.id}'/></td>
            <td><c:out value='${company.name}'/></td>
            <td><c:out value='${company.ceo}'/></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${company.regDate}"/> </td>
            <c:if test="${branchList.bno != '0'}">
            <td>
                <a class="branch" href="<c:out value="${branchList.bno}"/>"><c:out value="${branchList.bname}"/></a>
            </td>
            <td style="display: none"><c:out value="${company.cno}"/></td>
            <td style="display: none"><c:out  value="${company.name}"/></td>
            <td style="display: none"><c:out  value="${branchList.bno}"/></td>
            <td style="display: none"><c:out  value="${branchList.bname}"/></td>
            <td><input type="button" class="selectBranch" value="선택"></td>
            </c:if>
        </tr>
    </c:forEach>
</c:forEach>
    </table>

    <div class="paging">
        <p>
    <c:if test="${pageMaker.prev}">
        <a href="${pageMaker.startPage-1}">Previous</a>
    </c:if>
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        <a href="${num}">${num}</a>
    </c:forEach>
    <c:if test="${pageMaker.next}">
        <a href="${pageMaker.endPage+1}">Next</a>
    </c:if>
        </p>
    </div>

    <form id="actionForm"  action="/company/search" method="get">
        <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
        <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
        <input type='hidden' name='pageNum' class='pageNum_input' value='${pageMaker.cri.pageNum }' >
        <input type='hidden' name='amount' class='amount_input' value='${pageMaker.cri.amount }' >
    </form>
</body>

</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        var actionForm = $("#actionForm");
        /* 지점 페이지 이동 */
        $('.branch').click(function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
            actionForm.attr("action", "/company/branch");
            actionForm.submit();
        })

        $('.amount').change(function () {
            var amount_value = $("option:selected", this).val();
            $('.amount_input').val(amount_value);
            $('.pageNum_input').val("1");
            actionForm.val($(this).attr("href"));
            actionForm.submit();
        })
        $('.amount option').each(function () {
            if($(this).val() == "${pageMaker.cri.amount }"){
                $(this).attr("selected", "selected");
            }
        });

        /*페이징 버튼 처리 */
        $('.paging a').click(function (e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        })

        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function(e){
            e.preventDefault();
            searchForm.find("input[name='pageNum']").val("1");
            searchForm.submit();
        });

        $(".selectBranch").click(function (e) {
            var btn = $(this);
            var tr = btn.parent().parent();
            var td = tr.children();
            opener.document.getElementById('cno').value = td.eq(5).text();
            opener.document.getElementById('cname').value = td.eq(6).text();
            opener.document.getElementById('bno').value = td.eq(7).text();
            opener.document.getElementById('bname').value = td.eq(8).text();
            window.close();
        });
    });
</script>