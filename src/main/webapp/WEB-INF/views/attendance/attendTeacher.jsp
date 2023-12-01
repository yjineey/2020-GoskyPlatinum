<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="kr.co.gugu.domain.AttendanceDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결확인</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

</head>

<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

      <c:import url="/WEB-INF/views/include/nav.jsp" />

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">
            <!-- Topbar -->
            <c:import url="/WEB-INF/views/include/top.jsp" />

            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <div
                  class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0 text-gray-800">출결 확인</h1>
               </div>
               <!-- Begin Page Content -->
               <div class="container-fluid">

                  <!-- Page Heading -->
                  <p class="mb-4">
                     강사에게 보여지는 출결확인 입니다 ${att.date} ${tdate }
                  </p>

                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                     <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">출결 확인</h6>

                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <!-- 날짜 -->
                           <div class="box-footer">
                              <div class=" form-control-group" align="center">
                                 <c:import url="/WEB-INF/views/attendance/date.jsp" />
                              </div>
                           </div>



                           <table class="table table-bordered" id="dataTable">
                              <thead>
                                 <tr>
                                    <th>번호</th>
                                    <th>이름</th>
                                    <th>출근 시간</th>
                                    <th>출결 상태</th>
                                    <th>사유</th>
                                 </tr>
                              </thead>
                              <tbody>
											<tr>
												<td>${att.ano}</td>
												<td>${att.mname}</td>
												<td>${att.adate}</td>
												<td><c:choose>
														<c:when test="${att.att == 0}">
																		결석
																	</c:when>
														<c:when test="${att.att == 1}">
																		지각
																	</c:when>
														<c:when test="${att.att == 2}">
조퇴																	</c:when>
														<c:when test="${att.att == 3}">
																		출석
																	</c:when>
														<c:when test="${att.att == 4}">
																		공결
																	</c:when>
																	
														
													</c:choose></td>
												<td>${att.acontent}</td>
											</tr>
										</tbody>
                           </table>
                           <c:if test="${msort eq 'm02'}">
                              <c:choose>
                                 <c:when test="${tdate eq 0 }">

                                    <div class="box-footer" align="right" style="float: left;">
                                       <button type="button" class="btn btn-success"
                                          id="btn-success" disabled="">출결하기</button>
                                    </div>


                                 </c:when>
                                 <c:when test="${tdate eq 1 }">

                                    <div class="box-footer" align="right" style="float: left;">
                                       <button type="button" class="btn btn-success"
                                          id="btn-success" disabled="">출결하기</button>
                                    </div>


                                 </c:when>
                                 <c:when test="${tdate eq 2 }">
                                    <div class="box-footer" align="right" style="float: left;">
                                       <button type="button" class="btn btn-success" id="btn-success"
                                          disabled="">출결하기</button>
                                    </div>

                                    <div class="box-footer" align="right" style="float: left;">
                                       <button type="button" class="btn btn-primary"
                                          id="btn-primary">사유수정</button>
                                    </div>
                                 </c:when>

                                 <c:otherwise>
                                    <div class="box-footer" align="right" style="float: left;">
                                       <button type="button" class="btn btn-success" id="btn-success"
                                          >출결하기</button>
                                    </div>


                                 </c:otherwise>
                              </c:choose>
                           </c:if>


                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
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
   //출결
   $('.btn-success').on('click', function() {
      location.href = "${ContextPath }/checkAttend?ano=" + ${att.ano};

   });

   $('.btn-primary').on('click', function() {
      location.href = "${ContextPath }/checkAttend?ano=" + ${att.ano};

   });
</script>
</html>