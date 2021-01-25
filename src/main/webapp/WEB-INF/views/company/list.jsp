<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp" %>
    <%-- search--%>
    <div>
        <form id="searchForm" action="/company/list" method="get">
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
    <hr>

    <%-- table list --%>
    <table>

        <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>상호</th>
            <th>대표자</th>
            <th>가입일</th>
            <th>지점</th>
        </tr>
        <c:forEach items="${companyList}" var="company">
        <tr>
            <td><c:out value='${company.cno}'/></td>
            <td><c:out value='${company.id}'/> </td>
            <td><c:out value='${company.name}'/> </td>
            <td><c:out value='${company.ceo}'/> </td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${company.regDate}"/> </td>
            <td>
            <c:forEach items="${company.branchList}" var="branch">
                <a class="branch" href="<c:out value="${branch.bno}"/>">
                    <c:out value="${branch.bname}"/>
                </a>
            </c:forEach>
            </td>
        </tr>
        </c:forEach>
    </table>

    <%--페이징--%>
    <hr>
    <p>
        total : <c:out value="${pageMaker.total}"/>,
        page: <c:out value="${pageMaker.cri.pageNum}"/>,
        amount :
    <select class="amount">
        <option name="amount" value="10">10</option>
        <option name="amount" value="20">20</option>
        <option name="amount" value="50">50</option>
        <option name="amount" value="100">100</option>
    </select>
    </p>
    <div class="paging">
        <p>
            <c:if test="${pageMaker.prev}">
                    <a href="${pageMaker.startPage-1}">Previous</a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <a href="${num}" >${num}</a>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                    <a href="${pageMaker.endPage+1}" >Next</a>
            </c:if>
        </p>
    </div>

<form id="actionForm"  action="/company/list" method="get">
    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
    <input type='hidden' name='pageNum' class='pageNum_input' value='${pageMaker.cri.pageNum }' >
    <input type='hidden' name='amount' class='amount_input' value='${pageMaker.cri.amount }' >
</form>

<%@include file="../includes/footer.jsp" %>

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
    });
</script>