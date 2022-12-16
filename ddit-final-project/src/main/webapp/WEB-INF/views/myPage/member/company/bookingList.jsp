<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="kmb-title">
		<h2>예약 현황 조회</h2>
	</div>

	<div class="container">
      <!-- Table Section -->
      <div class="table-dashboard mb-7">
         <div class="background-color">
            
            
            <div class="mcTableDiv">
               <table class="mcTable">
                  <thead>
                     <tr>
                        <th class=bookingTH>상품명</th>
                        <th class="bookingTH">상품예약자</th>
                        <th class="bookingTH">상품예약날짜</th>
                        <th class="bookingTH">상품선택</th>
                        <th class="bookingTH">예약하기</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td class="bookingTD">Suit Room</td>
                        <td class="bookingTD"><a href="#">강명범</a></td>
                        <td class="bookingTD">2022.05.23 ~ 2022.05.30</td>
                        <td class="bookingTD"><div class="bookingList">
										<select>
											<option>Suit Room</option>
											<option value="1001">1001</option>
											<option value="1002">1002</option>
											<option value="1003">1003</option>
											<option value="1004">1004</option>
										</select>
									</div></td>
                        <td class="bookingBtn"><input type="button" value="예약확정" class="btn btn-primary"></td>
                     </tr>
                    </tbody>
               </table>
            </div>

            <!-- ====================================
            ———   PAGINATION
            ===================================== -->
            <section class="pt-5 pt-md-7">
               <div class="container">
                  <nav aria-label="Page navigation">
                     <ul class="pagination justify-content-center align-items-center">
                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)" tabindex="-1"> <i
                              class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1"
                              aria-hidden="true"></i> Previous
                        </a></li>

                        <li class="page-item"><a class="page-link active"
                           href="javascript:void(0)">1</a></li>

                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)">2</a></li>

                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)">3</a></li>

                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)">...</a></li>

                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)">9</a></li>

                        <li class="page-item"><a class="page-link"
                           href="javascript:void(0)">Next <i
                              class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1"
                              aria-hidden="true"></i>
                        </a></li>
                     </ul>
                  </nav>
               </div>
            </section>
         </div>
      </div>
   </div>
