<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 선택</title>
 
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

</head>

<body id="page-top">


   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">
            <!-- Topbar -->
            <c:import url="/WEB-INF/views/include/top.jsp" />

            <!-- Begin Page Content -->
            <div class="container-fluid">
               <section class="content">

                  <form role="form" method="post" action="${ContextPath}/selectsub">
                     <div class="box-body">

                        <div class="form-group">
                           <label>오전 과목</label> 
                           <select class="form-control" name="befor">
                            <c:forEach var="subject" items="${sub1}">
                              <option value="${subject.sno}">${subject.sname}(${subject.sno })</option>
                              </c:forEach>
                           </select>
                        </div>

                        <div class="form-group">
                           <label>오후 과목</label> 
                           <select class="form-control" name="after">
                            <c:forEach var="subject2" items="${sub2}">
                              <option value="${subject2.sno}">${subject2.sname}(${subject2.sno})</option>
                              </c:forEach>
                           </select>
                        </div>
                     </div>

                     <div class="box-footer">
                        <button type="submit" class="btn btn-primary">수강신청</button>
                     </div>
                  </form>
               </section>
            </div>
         </div>
         <!-- End of Main Content -->

         <!-- Footer -->
         <footer class="sticky-footer bg-white">
            <div class="container my-auto">
               <div class="copyright text-center my-auto">
                  <span>Copyright &copy; Your Website 2020</span>
               </div>
            </div>
         </footer>
         <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
   </div>
   <!-- End of Page Wrapper -->
   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>
</body>
<script>
   $('.btn-primary').on('click', function() {
      alert("선택하신 과목 수강신청이 완료되었습니다")
      location.href = "userhome"   
   })
</script>
</html>