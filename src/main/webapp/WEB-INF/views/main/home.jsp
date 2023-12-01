<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>홈화면</title>

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

               </div>
                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                     <div class="card-body">
                        <div class="table-responsive">

                           <!--CSS: 센터소개-->
                           <link rel="stylesheet" href="http://www.theheritage.kr/theme/s007/index/company_02.css">

                           <!--센터소개-->
                           <div id="company_02">
                              <div class="clearfix">
                                 <div class="col-md-12 p-none">
                                    <p class="top_ment">
                                       "부모님들이 우리의 어린 시절을 꾸며주셨으니<br> 이제, 우리가 <span
                                          class="under_pen_effec">부모님의 인생을 더 아름답게</span> 꾸며드리고자
                                       합니다."
                                    </p>
                                    <img src="${ContextPath }/resources/imgUpload/intro.jpg"
                                       width="1000" height="400">
                                    <p>
                                       <b>안녕하십니까?<br> 저희 "GoSky플레티넘스쿨" 홈페이지를 찾아 주신 여러분께
                                          진심으로 감사드립니다.
                                       </b>
                                    </p>
                                    <p>
                                       OECD 주요 국가들 중 가장 빠른 고령화 추세를 보이고 있는 우리나라는 2020년 현재 전체 인구의 약
                                       17% 이상이 만 65세 이상으로 2025년에는 전체 인구의 20% 이상이 노령인구에 속하는 초 고령사회로
                                       진입할 것으로 예상되고 있습니다. 어르신들에 대한 부양 문제는 비단 가족들만의 문제가 아닌 국가와
                                       지역사회에서도 함께 고민해야 하는 사회적 과제로 인식되고 있으며 이를 해결하기 위한 실질적 대안으로는
                                       요양원과 노인복지시설에 대한 대안이 절실할 때입니다.<br>
                                       <br> 이러한 시대적 요구에 발맞춰 GoSky플레티넘스쿨은 대한민국 대표 요양보호센터로
                                       자리매김하겠다는 각오로 어르신 한 분 한 분께 정성과 사랑으로 참된 효(孝)를 실천하고 있습니다.
                                    </p>

                                    <p>
                                       <b>저희 GoSky플레티넘스쿨은 <br>전문 요양보호사들이 어르신들을 위해 쾌적하고
                                          청결한 상태를 유지하고 있으며, <br>사회복지사는 프로그램의 다양화로 즐겁고 활기찬 생활을
                                          드리고, <br> 영양사는 기호도 및 선호도에 따른 건강한 식단을 준비하여 <br>항상
                                          어르신들께 기쁨과 만족을 드리고자 최선을 다하고 있습니다

                                       </b>
                                    </p>
                                    <p>어린 왕자로 유명한 프랑스 작가 생텍쥐페리(1900~1944)는 “부모님들이 우리의 어린 시절을
                                       꾸며 주셨으니 우리는 그들의 말년을 아름답게 꾸며드려야 한다.”라는 말과 같이 저희 GoSky플레티넘스쿨은
                                       생텍쥐페리가 남긴 명언처럼 부모님을 모시는 따뜻하고 정성된 마음으로 어르신들의 말년을 진정 아름답게 꾸며
                                       드릴 것을 약속드립니다. 편안하고 쾌적한 환경에서 즐겁고 건강한 생활을 누리시도록 최선을 다하겠습니다.</p>
                                    <p>감사합니다.</p>

                                    <p class="m-none col-md-12 p-none text-right">
                                       GoSky플레티넘스쿨(주) <span class="sign">대표 이권희</span>
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

</html>