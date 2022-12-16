<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath }/resources/images/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">Complete Booking</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	BOOKING SECTION
===================================== -->
<section class="py-8 py-md-10">
  <div class="container">
    <div class="mb-8">
      <div class="row progress-wizard">
        <div class="col-7 progress-wizard-step complete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <div class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-user" aria-hidden="true"></i>
              <span class="d-block">1. 주문자 정보</span>
            </div>
          </div>
        </div>
      
        <div class="col-3 progress-wizard-step active">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <div class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-check" aria-hidden="true"></i>
              <span class="d-block">2. 예약완료</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="alert alert-success alert-dismissible alert-confirm fade show mb-7" role="alert">
      <a href="javascript-void(0)" class="close" data-bs-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">Dismiss</span>
      </a>
      <i class="fa fa-check" aria-hidden="true"></i>
      <span><strong>Thank you!</strong> Your booking is confirmed. Invoice Sent in your email address</span>
    </div>

    <h2 class="text-capitalize mb-5">Booking details</h2>

    <div class="card mb-6 mb-md-0">
      <img class="card-img-top rounded lazyestload" data-src="${prod.prodImg }" src="${prod.prodImg }" alt="상품 이미지">
      <div class="card-body px-6">
        <h3 class="text-capitalize mb-5">${prod.prodNam }</h3>
        <p class="mb-0">${company.cinfoInfo }</p>
      </div>

      <div class="card-footer bg-transparent">
        <div class="row">
          <div class="col-md-4">
            <ul class="list-unstyled">
              <li class="mb-2">
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="far fa-calendar-alt" aria-hidden="true"></i></span>
                      <span>From:</span>
                    </dt>
                  </div>
                
                  <div class="col-7 col-md-6 ps-0">
                    <span class="text-gray-color">${resv.resSdate }</span>
                  </div>
                </div>
              </li>

              <li class="mb-2">
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="far fa-calendar-alt" aria-hidden="true"></i></span>
                      <span>To:</span>
                    </dt>
                  </div>
                
                  <div class="col-7 col-md-6 ps-0">
                    <span class="text-gray-color">${resv.resEdate }</span>
                  </div>
                </div>
              </li>

              <li>
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="fa fa-user" aria-hidden="true"></i></span>
                      <span>Guests:</span>
                    </dt>
                  </div>
              
                  <div class="col-7 col-md-6 ps-0">
                    <span class="text-gray-color">${resv.resQty } Person</span>
                  </div>
                </div>
              </li>
            </ul>
          </div>

          <div class="col-md-4">
            <ul class="list-unstyled">
              <li class="mb-2">
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="fas fa-map-marker-alt" aria-hidden="true"></i></span>
                      <span>Address:</span>
                    </dt>
                  </div>
            
                  <div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
                    <span class="text-gray-color">${company.comAddr }</span>
                  </div>
                </div>
              </li>
              <li class="mb-2">
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="far fa-envelope"></i></span>
                      <span>Email:</span>
                    </dt>
                  </div>
            
                  <div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
                    <span class="text-gray-color">${company.comMail }</span>
                  </div>
                </div>
              </li>
              <li class="mb-2">
                <div class="row">
                  <div class="col-5 col-md-6 col-lg-5 col-xl-4">
                    <dt>
                      <span class="me-1"><i class="fas fa-phone-alt"></i></span>
                      <span>Phone:</span>
                    </dt>
                  </div>
            
                  <div class="col-7 col-md-6 col-lg-7 ps-0 pe-md-0 pe-xl-5">
                    <span class="text-gray-color">${company.comHphon }</span>
                  </div>
                </div>
              </li>
            </ul>
          </div>

          <div class="col-md-4">
            <h2 class="text-center text-xl-left mb-0">
              <span>Total:</span>
              <span class="text-primary font-weight-bold">&#8361;<fmt:formatNumber value="${resv.prodPrice }"/></span>
            </h2>
          </div>
        </div>
      </div>
  </div>
</section>