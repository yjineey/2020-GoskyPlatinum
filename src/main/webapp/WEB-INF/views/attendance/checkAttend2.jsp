<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결 확인2</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

</head>
<body class="bg-gradient-white" >
   <div class="container">
   <form class="people" onsubmit="return AttendForm();"
      action="${ContextPath }/checkAttend" method="post">
      <div class="form-group">
      <input type="hidden" class="form-control form-control-user" id="ano"
            name="ano" maxlength="30" value="${ano}"> 
      </div>
      <div class="form-group">
        <input type="text" class="form-control form-control-user" id="adate"
            name="adate" maxlength="30" value="${time }" readonly required> 
      </div>
      
      <div class="form-group">
         <input type="text" class="form-control form-control-user" id="acontent"
            name="acontent" placeholder="사유를 입력해주세요" maxlength="30" required>
      </div>

      <div style="margin-top: 30px;"></div>

      <input type="submit" class="btn btn-primary" style="WIDTH: 445px"  value="출석하기">

   </form>
   </div>
</body>
<script>
   $('.btn-primary').on('click', function() {
      alert("출석되었습니다")
      location.href = "checkAttend"
   })
</script>
</html>