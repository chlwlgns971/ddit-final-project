<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main-wrapper packages-list-left-sidebar">


<!-- ====================================
———   PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg13.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="">
              <h2 class="text-uppercase text-white font-weight-bold">패키지명</h2>
            </div>
            <p class="text-white mb-0">패키지간략설명</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———   PACKAGES SECTION
===================================== -->
<section class="py-10">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-lg-4 order-2">
        <form class="" action="index.html" method="GET">
          <div class="card border">
            <h2 class="card-header text-uppercase text-center bg-smoke border-bottom">
              인원선택
            </h2>

            <div class="card-body px-3 py-4">
              <div class="border-bottom mb-5">

                <div class="form-group mb-5">
                  <div class="row align-items-center">
                    <label class="control-label col-xl-5 text-center text-xl-right">성인:</label>

                    <div class="col-xl-5">
                      <div class="count-input mx-auto">
                        <a class="incr-btn" data-action="decrease" href="javascript:void(0)">–</a>
                        <input class="quantity" type="number" value="1">
                        <a class="incr-btn" data-action="increase" href="javascript:void(0)">+</a>
                      </div>
                    </div>

                    <div class="col-xl-2">
                      <p class="text-center mt-3 mt-xl-0 mb-0">￦000,000</p>
                    </div>
                  </div>
                </div>

                <div class="form-group mb-5">
                  <div class="row align-items-center">
                    <label class="control-label col-xl-5 text-center text-xl-right">아동:</label>

                    <div class="col-xl-5">
                      <div class="count-input mx-auto">
                        <a class="incr-btn" data-action="decrease" href="javascript:void(0)">–</a>
                        <input class="quantity" type="number" value="0">
                        <a class="incr-btn" data-action="increase" href="javascript:void(0)">+</a>
                      </div>
                    </div>

                    <div class="col-xl-2">
                      <p class="text-center mt-3 mt-xl-0 mb-0">￦000,000</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="d-flex justify-content-between border-bottom mb-5 pb-5">
                <span class="text-uppercase h4 mb-0">총 상품금액</span>
                <span class="font-weight-bold text-primary h3 mb-0">￦000,000</span>
              </div>

              <div class="text-center px-4">
                <button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase">
                  예약하기 <span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="col-md-7 col-lg-8">
        <div id="package-slider" class="owl-carousel owl-theme package-slider">
          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/package-slider-03.jpg" src="${pageContext.request.contextPath }/resources/images/packages/package-slider-03.jpg" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/package-slider-04.jpg" src="${pageContext.request.contextPath }/resources/images/packages/package-slider-04.jpg" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath }/resources/images/packages/package-slider-05.jpg" src="${pageContext.request.contextPath }/resources/images/packages/package-slider-05.jpg" alt="image">
          </div>
        </div>

        <div class="mt-8">
          <h2 class="text-uppercase mb-5">패키지명</h2>
          <p class="mb-6">핵심포인트</p>

          <div class="mb-5">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li class="media">
                    <div class="text-gray-color me-2">
                      <i class="far fa-dot-circle" aria-hidden="true"></i>
                    </div>
                    <div class="media-body">
                      <p>포인트1</p>
                    </div>
                  </li>
                </ul>
              </div>

              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li class="media">
                    <div class="text-gray-color me-2">
                      <i class="far fa-dot-circle" aria-hidden="true"></i>
                    </div>
                    <div class="media-body">
                      <p>포인트7</p>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="mb-8">
          <h3 class="text-uppercase mb-5">여행 일정</h3>
          <p class="mb-5"></p>

          <div class="media flex-column flex-lg-row align-items-lg-center border rounded px-6 py-7 bg-smoke mb-2">
            <div class="me-lg-5">
              <h5 class="text-uppercase mb-3">일정1</h5>
              <p class="mb-5 mb-lg-0">상세</p>
            </div>

            <div class="media-body d-flex">
              <div class="badge badge-rounded-circle border">
                <span class="d-block text-primary">1일차</span>
              </div>
            </div>
          </div>

          <div class="media flex-column flex-lg-row align-items-lg-center border rounded px-6 py-7 bg-smoke mb-2">
            <div class="me-lg-5">
              <h5 class="text-uppercase mb-3">일정2</h5>
              <p class="mb-5 mb-lg-0">상세</p>
            </div>

            <div class="media-body d-flex">
              <div class="badge badge-rounded-circle border">
                <span class="d-block text-primary">2일차</span>
              </div>
            </div>
          </div>

          <div class="media flex-column flex-lg-row align-items-lg-center border rounded px-6 py-7 bg-smoke">
            <div class="me-lg-5">
              <h5 class="text-uppercase mb-3">일정3</h5>
              <p class="mb-5 mb-lg-0">상세</p>
            </div>

            <div class="media-body d-flex">
              <div class="badge badge-rounded-circle border">
                <span class="d-block text-primary">3일차</span>
              </div>
            </div>
          </div>
        </div>

        <div class="mb-7">
          <h2 class="text-uppercase mb-6">지도??</h2>
          <p class="mb-0">???</p>
        </div>

        <div class="mb-7" id="map" style="width:100%; height:400px;"></div>

        <div class="mb-7">
          <h2 class="text-uppercase mb-6">패키지여행 이용 후기</h2>
          <p class="mb-6">???</p>

          <div class="d-flex align-items-center mb-6">
            <h3 class="text-uppercase mb-0">
              <span class="me-2">이용 후기 (3)</span>

              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fas fa-star-half-alt" aria-hidden="true"></i>
              </span>
            </h3>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-02.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
              <h5>이름</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">굿.</p>
            </div>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-01.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
              <h5>이름</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">낫베드</p>
            </div>
          </div>

          <div class="media">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" src="${pageContext.request.contextPath }/resources/images/blog/comments-03.jpg" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h5>이름</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">쏘쏘</p>
            </div>
          </div>
        </div>

        <form class="mb-9 mb-md-0">
          <h3 class="text-uppercase mb-6">이용 후기를 남겨주세요.</h3>

          <p class="rating-view d-flex align-items-center">
            <span class="content-view">평점 주기</span>
            <span class="star add-rating-default ms-2"></span>
          </p>

          <div class="form-group mb-6">
            <textarea class="form-control border-0 bg-smoke" placeholder="내용" rows="6"></textarea>
          </div>

          <div class="">
            <button type="button" onclick="location.href='javascript:void(0)';"
              class="btn btn-hover btn-outline-secondary text-uppercase">
              작성하기
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<script src='https://maps.googleapis.com/maps/api/js?key=<api키>'></script>