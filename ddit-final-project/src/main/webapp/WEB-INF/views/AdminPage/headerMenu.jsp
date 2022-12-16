<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- ====================================
  ——— HEADER
  ===================================== -->
  <header class="header" id="pageTop">
    <!-- Menu Zord -->
    <nav class="nav-menuzord navbar-sticky">
      <div class="container clearfix">
        <div id="menuzord" class="menuzord" style="width: 600px;">
          <a href="index.html" class="menuzord-brand">
            <img class="lazyestload" data-src="<%=request.getContextPath() %>/resources/images/logo-color-big.png" src="<%=request.getContextPath() %>/resources/images/logo-color-big.png" alt="logo-img">
          </a>

          <div class="nav-item dropdown nav-item-left me-0">
            <button class="btn btn-xs btn-primary d-none d-lg-inline-block notify-toggler">
              <i class="fa fa-search text-white me-0" aria-hidden="true"></i>
            </button>
          
            <div class="dropdown-menu dropdown-menu-end dropdown-notify rounded-0">
              <form class="mb-0" action="index.html" method="post">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control form-control-sm rounded-0" required placeholder="Search...." aria-label="Search....">
                  <button class="btn bg-primary border-0 rounded-0" type="submit">
                    <span class="text-white text-uppercase font-weight-bold">Search</span>
                  </button>
                </div>
              </form>
            </div>
          </div>
          
          <ul class="menuzord-menu menuzord-right">
            <li class="">
              <a class="" href="javascript:void(0)">Home</a>
              <ul class="dropdown drop-up">
                <li class="">
                  <a href="index.html">Home Main</a>
                </li>

                <li class="">
                  <a href="index-2.html">Home City</a>
                </li>

                <li class="">
                  <a href="index-3.html">Home Destination</a>
                </li>
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">Tours</a>
              <div class="megamenu drop-up">
                <div class="megamenu-row">
                  <div class="col4">
                    <ul class="list-unstyled">
                      <li>Tour Packages Grid View</li>
                      <li class="">
                        <a href="packages-grid-left-sidebar.html">Packages Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="packages-grid-right-sidebar.html">Packages Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="packages-grid.html">Packages 3 Columns</a>
                      </li>
                    </ul>
                  </div>

                  <div class="col4">
                    <ul class="list-unstyled">
                      <li>Tour Packages List View</li>
                      <li class="">
                        <a href="packages-list-left-sidebar.html">Packages Sidebar Left</a>
                      </li>
                      
                      <li class="">
                        <a href="packages-list-right-sidebar.html">Packages Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="packages-list.html">Packages List</a>
                      </li>
                    </ul>
                  </div>

                  <div class="col4">
                    <ul class="list-unstyled">
                      <li>Single Package</li>
                      <li class="">
                        <a href="single-package-left-sidebar.html">Packages Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="single-package-right-sidebar.html">Packages Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="single-package-fullwidth.html">Packages Fullwidth</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>

            <li class="">
              <a href="javascript:void(0)">Hotels</a>
              <div class="megamenu drop-up">
                <div class="megamenu-row">
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Hotels Grid View</li>

                      <li class="">
                        <a href="hotels-grid-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="hotels-grid-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="hotels-grid.html">Hotels 3 Columns</a>
                      </li>
                    </ul>
                  </div>
            
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Hotels List View</li>
                      <li class="">
                        <a href="hotels-list-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="hotels-list-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="hotels-list.html">Hotels List</a>
                      </li>
                    </ul>
                  </div>
            
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Single Hotel</li>
                      <li class="">
                        <a href="single-hotel-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="single-hotel-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="single-hotel-fullwidth.html">Hotels Fullwidth</a>
                      </li>
                    </ul>
                  </div>

                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Booking Steps</li>
                      <li class="">
                        <a href="booking-step-1.html">Step 1 - Personal Info</a>
                      </li>

                      <li class="">
                        <a href="booking-step-2.html">Step 2 - Payment Info</a>
                      </li>

                      <li class="">
                        <a href="booking-step-3.html">Step 3 - Confirmation</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>

            <li class="">
              <a href="javascript:void(0)">Rental</a>

              <ul class="dropdown drop-up">
                <li class=" ||
                  ">

                  <a href="javascript:void(0)">Cars</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="cars-list.html">Cars List View</a>
                    </li>

                    <li class="">
                      <a href="cars-grid.html">Cars Grid View</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                  ">

                  <a href="javascript:void(0)">Cruises</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="cruises-list.html">Cruises List View</a>
                    </li>

                    <li class="">
                      <a href="cruises-grid.html">Cruises Grid View</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">Pages</a>
              <ul class="dropdown drop-up">
                <li class="">
                  <a href="about-us.html">About Us</a>
                </li>

                <li class="">
                  <a href="contact.html">Contact Us</a>
                </li>

                <li class=" ||
                     ||
                    ">

                  <a href="javascript:void(0)">Gallery</a>
                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="gallery-grid.html">Gallery Grid</a>
                    </li>

                    <li class="">
                      <a href="gallery-masonry.html">Gallery Masonry</a>
                    </li>

                    <li class="">
                      <a href="gallery-photo-slider.html">Photo Slider</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                    ">

                  <a href="javascript:void(0)">Destinations</a>
                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="destination-cities.html">Destination Cities</a>
                    </li>

                    <li class="">
                      <a href="destination-single-city.html">Single Destination</a>
                    </li>
                  </ul>
                </li>

                <li class="">
                    
                  <a href="javascript:void(0)">Components</a>

                  <ul class="dropdown drop-sub-menu-left drop-up navComponents">
                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#accordion">Accordion</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#alerts">Alerts</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#badge">Badge</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#breadcrumb">Breadcrumb</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#buttons">Buttons</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#collapse">Collapse</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#card">Card</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#forms">Forms</a>
                    </li>

                    <li class="scrolling">
                      <a class="removeNav" href="components.html#dropdowns">Dropdowns</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#list-group">List Group</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#modal">Modal</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#navs">Navs</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#offcanvas">Offcanvas</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#pagination">Pagination</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#tooltips">Tooltips</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#spinners">Spinners</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#progress">Progress</a>
                    </li>
                  </ul>
                </li>

                <li><a href="404.html">404 Not Found</a></li>

                <li><a href="coming-soon.html">Coming Soon</a></li>
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">Blog</a>

              <ul class="dropdown drop-up">
                <li class=" ||
                  ">

                  <a href="javascript:void(0)">Blog Grid View</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-grid-three-col.html">Blog Grid 3 Col</a>
                    </li>

                    <li class="">
                      <a href="blog-grid-two-col.html">Blog Grid 2 Col</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                   ||
                  ">

                  <a href="javascript:void(0)">Blog List View</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-list-right-sidebar.html">Blog List Right Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-list-left-sidebar.html">Blog List Left Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-list-fullwidth.html">Blog List Fullwidth</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                    ">

                  <a href="javascript:void(0)">Blog Single Post</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-single-right-sidebar.html">Blog Right Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-single-left-sidebar.html">Blog Left Sidebar</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>

            <li class=" active ">
              <a href="javascript:void(0)">MyPage</a>
              <ul id="admin" class="dropdown drop-up">
                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/edit">관리자 계정 관리</a>
                </li>

                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/manageMem">회원 관리</a>
                </li>

                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/manageNotice">공지사항 관리</a>
                </li>

                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/manageCoupon">쿠폰/마일리지 관리</a>
                </li>

                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/sendingNewsletter">뉴스레터 발송</a>
                </li>

                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/manageDestination">여행지 관리</a>
                </li>
                <li class="">
                  <a href="<%=request.getContextPath()%>/mypage/admin/chartView">통계 자료</a>
                </li>
              </ul>
            </li>

            <li class="py-4">
              <form class="d-lg-none" action="index.html" method="post">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control form-control-sm rounded-0" required placeholder="Search...." aria-label="Search....">
                  <button class="btn bg-primary border-0 rounded-0" type="submit">
                    <span class="text-white text-uppercase font-weight-bold">Search</span>
                  </button>
                </div>
              </form>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>









