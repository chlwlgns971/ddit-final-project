<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/resources/images/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">Booking step 1</h2>
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
        <div class="col-7 progress-wizard-step active">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="javascript:void(0)" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-user" aria-hidden="true"></i>
              <span class="d-block">1. 주문자 정보</span>
            </div>
          </a>
        </div>
      
        <div class="col-3 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="booking-step-3.html" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-check" aria-hidden="true"></i>
              <span class="d-block">2. 예약완료</span>
            </div>
          </a>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-7 col-lg-8 order-1 order-md-0">
        <h3 class="text-capitalize mb-5">주문자 정보</h3>

        <form:form action="${pageContext.request.contextPath }/booking/step2" modelAttribute="resd" method="post" target="_blank" id="resForm">
          <div class="row">
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">First Name(이름)</label>
                <form:input path="rdeFnam" type="text" class="form-control border-0 bg-smoke" value="${member.memEfn }" id="firstName"/>
                <form:errors path="rdeFnam"/>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">Last Name(성)</label>
                <form:input path="rdeLnam" type="text" class="form-control border-0 bg-smoke" value="${member.memEln }" id="lastName"/>
                <form:errors path="rdeLnam"/>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">주소</label>
                <form:input path="rdeAdd1" type="text" class="form-control border-0 bg-smoke" value="${member.memAddr }" id="addr"/>
                <form:errors path="rdeAdd1"/>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">상세 주소</label>
                <form:input path="rdeAdd2" type="text" class="form-control border-0 bg-smoke" value="${member.memDaddr }" />
                <form:errors path="rdeAdd2"/>
              </div>
            </div>
            
            <div class="col-lg-6">
              <div class="form-group">
              	<label for="inputName">거주국가</label>
                	<form:select path="rdeNat" class="form-control" id="country">
				        <option value="0" label="Select a country ... " selected="selected">Select a country ... </option>
				        <optgroup id="country-optgroup-Africa" label="Africa">
			            <option value="DZ" label="Algeria">Algeria</option>
			            <option value="AO" label="Angola">Angola</option>
			            <option value="BJ" label="Benin">Benin</option>
			            <option value="BW" label="Botswana">Botswana</option>
			            <option value="BF" label="Burkina Faso">Burkina Faso</option>
			            <option value="BI" label="Burundi">Burundi</option>
			            <option value="CM" label="Cameroon">Cameroon</option>
			            <option value="CV" label="Cape Verde">Cape Verde</option>
			            <option value="CF" label="Central African Republic">Central African Republic</option>
			            <option value="TD" label="Chad">Chad</option>
			            <option value="KM" label="Comoros">Comoros</option>
			            <option value="CG" label="Congo - Brazzaville">Congo - Brazzaville</option>
			            <option value="CD" label="Congo - Kinshasa">Congo - Kinshasa</option>
			            <option value="CI" label="Côte d’Ivoire">Côte d’Ivoire</option>
			            <option value="DJ" label="Djibouti">Djibouti</option>
			            <option value="EG" label="Egypt">Egypt</option>
			            <option value="GQ" label="Equatorial Guinea">Equatorial Guinea</option>
			            <option value="ER" label="Eritrea">Eritrea</option>
			            <option value="ET" label="Ethiopia">Ethiopia</option>
			            <option value="GA" label="Gabon">Gabon</option>
			            <option value="GM" label="Gambia">Gambia</option>
			            <option value="GH" label="Ghana">Ghana</option>
			            <option value="GN" label="Guinea">Guinea</option>
			            <option value="GW" label="Guinea-Bissau">Guinea-Bissau</option>
			            <option value="KE" label="Kenya">Kenya</option>
			            <option value="LS" label="Lesotho">Lesotho</option>
			            <option value="LR" label="Liberia">Liberia</option>
			            <option value="LY" label="Libya">Libya</option>
			            <option value="MG" label="Madagascar">Madagascar</option>
			            <option value="MW" label="Malawi">Malawi</option>
			            <option value="ML" label="Mali">Mali</option>
			            <option value="MR" label="Mauritania">Mauritania</option>
			            <option value="MU" label="Mauritius">Mauritius</option>
			            <option value="YT" label="Mayotte">Mayotte</option>
			            <option value="MA" label="Morocco">Morocco</option>
			            <option value="MZ" label="Mozambique">Mozambique</option>
			            <option value="NA" label="Namibia">Namibia</option>
			            <option value="NE" label="Niger">Niger</option>
			            <option value="NG" label="Nigeria">Nigeria</option>
			            <option value="RW" label="Rwanda">Rwanda</option>
			            <option value="RE" label="Réunion">Réunion</option>
			            <option value="SH" label="Saint Helena">Saint Helena</option>
			            <option value="SN" label="Senegal">Senegal</option>
			            <option value="SC" label="Seychelles">Seychelles</option>
			            <option value="SL" label="Sierra Leone">Sierra Leone</option>
			            <option value="SO" label="Somalia">Somalia</option>
			            <option value="ZA" label="South Africa">South Africa</option>
			            <option value="SD" label="Sudan">Sudan</option>
			            <option value="SZ" label="Swaziland">Swaziland</option>
			            <option value="ST" label="São Tomé and Príncipe">São Tomé and Príncipe</option>
			            <option value="TZ" label="Tanzania">Tanzania</option>
			            <option value="TG" label="Togo">Togo</option>
			            <option value="TN" label="Tunisia">Tunisia</option>
			            <option value="UG" label="Uganda">Uganda</option>
			            <option value="EH" label="Western Sahara">Western Sahara</option>
			            <option value="ZM" label="Zambia">Zambia</option>
			            <option value="ZW" label="Zimbabwe">Zimbabwe</option>
			        </optgroup>
			        <optgroup id="country-optgroup-Americas" label="Americas">
			            <option value="AI" label="Anguilla">Anguilla</option>
			            <option value="AG" label="Antigua and Barbuda">Antigua and Barbuda</option>
			            <option value="AR" label="Argentina">Argentina</option>
			            <option value="AW" label="Aruba">Aruba</option>
			            <option value="BS" label="Bahamas">Bahamas</option>
			            <option value="BB" label="Barbados">Barbados</option>
			            <option value="BZ" label="Belize">Belize</option>
			            <option value="BM" label="Bermuda">Bermuda</option>
			            <option value="BO" label="Bolivia">Bolivia</option>
			            <option value="BR" label="Brazil">Brazil</option>
			            <option value="VG" label="British Virgin Islands">British Virgin Islands</option>
			            <option value="CA" label="Canada">Canada</option>
			            <option value="KY" label="Cayman Islands">Cayman Islands</option>
			            <option value="CL" label="Chile">Chile</option>
			            <option value="CO" label="Colombia">Colombia</option>
			            <option value="CR" label="Costa Rica">Costa Rica</option>
			            <option value="CU" label="Cuba">Cuba</option>
			            <option value="DM" label="Dominica">Dominica</option>
			            <option value="DO" label="Dominican Republic">Dominican Republic</option>
			            <option value="EC" label="Ecuador">Ecuador</option>
			            <option value="SV" label="El Salvador">El Salvador</option>
			            <option value="FK" label="Falkland Islands">Falkland Islands</option>
			            <option value="GF" label="French Guiana">French Guiana</option>
			            <option value="GL" label="Greenland">Greenland</option>
			            <option value="GD" label="Grenada">Grenada</option>
			            <option value="GP" label="Guadeloupe">Guadeloupe</option>
			            <option value="GT" label="Guatemala">Guatemala</option>
			            <option value="GY" label="Guyana">Guyana</option>
			            <option value="HT" label="Haiti">Haiti</option>
			            <option value="HN" label="Honduras">Honduras</option>
			            <option value="JM" label="Jamaica">Jamaica</option>
			            <option value="MQ" label="Martinique">Martinique</option>
			            <option value="MX" label="Mexico">Mexico</option>
			            <option value="MS" label="Montserrat">Montserrat</option>
			            <option value="AN" label="Netherlands Antilles">Netherlands Antilles</option>
			            <option value="NI" label="Nicaragua">Nicaragua</option>
			            <option value="PA" label="Panama">Panama</option>
			            <option value="PY" label="Paraguay">Paraguay</option>
			            <option value="PE" label="Peru">Peru</option>
			            <option value="PR" label="Puerto Rico">Puerto Rico</option>
			            <option value="BL" label="Saint Barthélemy">Saint Barthélemy</option>
			            <option value="KN" label="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
			            <option value="LC" label="Saint Lucia">Saint Lucia</option>
			            <option value="MF" label="Saint Martin">Saint Martin</option>
			            <option value="PM" label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
			            <option value="VC" label="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
			            <option value="SR" label="Suriname">Suriname</option>
			            <option value="TT" label="Trinidad and Tobago">Trinidad and Tobago</option>
			            <option value="TC" label="Turks and Caicos Islands">Turks and Caicos Islands</option>
			            <option value="VI" label="U.S. Virgin Islands">U.S. Virgin Islands</option>
			            <option value="US" label="United States">United States</option>
			            <option value="UY" label="Uruguay">Uruguay</option>
			            <option value="VE" label="Venezuela">Venezuela</option>
			        </optgroup>
			        <optgroup id="country-optgroup-Asia" label="Asia">
			            <option value="AF" label="Afghanistan">Afghanistan</option>
			            <option value="AM" label="Armenia">Armenia</option>
			            <option value="AZ" label="Azerbaijan">Azerbaijan</option>
			            <option value="BH" label="Bahrain">Bahrain</option>
			            <option value="BD" label="Bangladesh">Bangladesh</option>
			            <option value="BT" label="Bhutan">Bhutan</option>
			            <option value="BN" label="Brunei">Brunei</option>
			            <option value="KH" label="Cambodia">Cambodia</option>
			            <option value="CN" label="China">China</option>
			            <option value="GE" label="Georgia">Georgia</option>
			            <option value="HK" label="Hong Kong SAR China">Hong Kong SAR China</option>
			            <option value="IN" label="India">India</option>
			            <option value="ID" label="Indonesia">Indonesia</option>
			            <option value="IR" label="Iran">Iran</option>
			            <option value="IQ" label="Iraq">Iraq</option>
			            <option value="IL" label="Israel">Israel</option>
			            <option value="JP" label="Japan">Japan</option>
			            <option value="JO" label="Jordan">Jordan</option>
			            <option value="KZ" label="Kazakhstan">Kazakhstan</option>
			            <option value="KW" label="Kuwait">Kuwait</option>
			            <option value="KG" label="Kyrgyzstan">Kyrgyzstan</option>
			            <option value="LA" label="Laos">Laos</option>
			            <option value="LB" label="Lebanon">Lebanon</option>
			            <option value="MO" label="Macau SAR China">Macau SAR China</option>
			            <option value="MY" label="Malaysia">Malaysia</option>
			            <option value="MV" label="Maldives">Maldives</option>
			            <option value="MN" label="Mongolia">Mongolia</option>
			            <option value="MM" label="Myanmar [Burma]">Myanmar [Burma]</option>
			            <option value="NP" label="Nepal">Nepal</option>
			            <option value="NT" label="Neutral Zone">Neutral Zone</option>
			            <option value="KP" label="North Korea">North Korea</option>
			            <option value="OM" label="Oman">Oman</option>
			            <option value="PK" label="Pakistan">Pakistan</option>
			            <option value="PS" label="Palestinian Territories">Palestinian Territories</option>
			            <option value="YD" label="People's Democratic Republic of Yemen">People's Democratic Republic of Yemen</option>
			            <option value="PH" label="Philippines">Philippines</option>
			            <option value="QA" label="Qatar">Qatar</option>
			            <option value="SA" label="Saudi Arabia">Saudi Arabia</option>
			            <option value="SG" label="Singapore">Singapore</option>
			            <option value="KR" label="South Korea" selected="selected">South Korea</option>
			            <option value="LK" label="Sri Lanka">Sri Lanka</option>
			            <option value="SY" label="Syria">Syria</option>
			            <option value="TW" label="Taiwan">Taiwan</option>
			            <option value="TJ" label="Tajikistan">Tajikistan</option>
			            <option value="TH" label="Thailand">Thailand</option>
			            <option value="TL" label="Timor-Leste">Timor-Leste</option>
			            <option value="TR" label="Turkey">Turkey</option>
			            <option value="TM" label="Turkmenistan">Turkmenistan</option>
			            <option value="AE" label="United Arab Emirates">United Arab Emirates</option>
			            <option value="UZ" label="Uzbekistan">Uzbekistan</option>
			            <option value="VN" label="Vietnam">Vietnam</option>
			            <option value="YE" label="Yemen">Yemen</option>
			        </optgroup>
			        <optgroup id="country-optgroup-Europe" label="Europe">
			            <option value="AL" label="Albania">Albania</option>
			            <option value="AD" label="Andorra">Andorra</option>
			            <option value="AT" label="Austria">Austria</option>
			            <option value="BY" label="Belarus">Belarus</option>
			            <option value="BE" label="Belgium">Belgium</option>
			            <option value="BA" label="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
			            <option value="BG" label="Bulgaria">Bulgaria</option>
			            <option value="HR" label="Croatia">Croatia</option>
			            <option value="CY" label="Cyprus">Cyprus</option>
			            <option value="CZ" label="Czech Republic">Czech Republic</option>
			            <option value="DK" label="Denmark">Denmark</option>
			            <option value="DD" label="East Germany">East Germany</option>
			            <option value="EE" label="Estonia">Estonia</option>
			            <option value="FO" label="Faroe Islands">Faroe Islands</option>
			            <option value="FI" label="Finland">Finland</option>
			            <option value="FR" label="France">France</option>
			            <option value="DE" label="Germany">Germany</option>
			            <option value="GI" label="Gibraltar">Gibraltar</option>
			            <option value="GR" label="Greece">Greece</option>
			            <option value="GG" label="Guernsey">Guernsey</option>
			            <option value="HU" label="Hungary">Hungary</option>
			            <option value="IS" label="Iceland">Iceland</option>
			            <option value="IE" label="Ireland">Ireland</option>
			            <option value="IM" label="Isle of Man">Isle of Man</option>
			            <option value="IT" label="Italy">Italy</option>
			            <option value="JE" label="Jersey">Jersey</option>
			            <option value="LV" label="Latvia">Latvia</option>
			            <option value="LI" label="Liechtenstein">Liechtenstein</option>
			            <option value="LT" label="Lithuania">Lithuania</option>
			            <option value="LU" label="Luxembourg">Luxembourg</option>
			            <option value="MK" label="Macedonia">Macedonia</option>
			            <option value="MT" label="Malta">Malta</option>
			            <option value="FX" label="Metropolitan France">Metropolitan France</option>
			            <option value="MD" label="Moldova">Moldova</option>
			            <option value="MC" label="Monaco">Monaco</option>
			            <option value="ME" label="Montenegro">Montenegro</option>
			            <option value="NL" label="Netherlands">Netherlands</option>
			            <option value="NO" label="Norway">Norway</option>
			            <option value="PL" label="Poland">Poland</option>
			            <option value="PT" label="Portugal">Portugal</option>
			            <option value="RO" label="Romania">Romania</option>
			            <option value="RU" label="Russia">Russia</option>
			            <option value="SM" label="San Marino">San Marino</option>
			            <option value="RS" label="Serbia">Serbia</option>
			            <option value="CS" label="Serbia and Montenegro">Serbia and Montenegro</option>
			            <option value="SK" label="Slovakia">Slovakia</option>
			            <option value="SI" label="Slovenia">Slovenia</option>
			            <option value="ES" label="Spain">Spain</option>
			            <option value="SJ" label="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
			            <option value="SE" label="Sweden">Sweden</option>
			            <option value="CH" label="Switzerland">Switzerland</option>
			            <option value="UA" label="Ukraine">Ukraine</option>
			            <option value="SU" label="Union of Soviet Socialist Republics">Union of Soviet Socialist Republics</option>
			            <option value="GB" label="United Kingdom">United Kingdom</option>
			            <option value="VA" label="Vatican City">Vatican City</option>
			            <option value="AX" label="Åland Islands">Åland Islands</option>
			        </optgroup>
			        <optgroup id="country-optgroup-Oceania" label="Oceania">
			            <option value="AS" label="American Samoa">American Samoa</option>
			            <option value="AQ" label="Antarctica">Antarctica</option>
			            <option value="AU" label="Australia">Australia</option>
			            <option value="BV" label="Bouvet Island">Bouvet Island</option>
			            <option value="IO" label="British Indian Ocean Territory">British Indian Ocean Territory</option>
			            <option value="CX" label="Christmas Island">Christmas Island</option>
			            <option value="CC" label="Cocos [Keeling] Islands">Cocos [Keeling] Islands</option>
			            <option value="CK" label="Cook Islands">Cook Islands</option>
			            <option value="FJ" label="Fiji">Fiji</option>
			            <option value="PF" label="French Polynesia">French Polynesia</option>
			            <option value="TF" label="French Southern Territories">French Southern Territories</option>
			            <option value="GU" label="Guam">Guam</option>
			            <option value="HM" label="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
			            <option value="KI" label="Kiribati">Kiribati</option>
			            <option value="MH" label="Marshall Islands">Marshall Islands</option>
			            <option value="FM" label="Micronesia">Micronesia</option>
			            <option value="NR" label="Nauru">Nauru</option>
			            <option value="NC" label="New Caledonia">New Caledonia</option>
			            <option value="NZ" label="New Zealand">New Zealand</option>
			            <option value="NU" label="Niue">Niue</option>
			            <option value="NF" label="Norfolk Island">Norfolk Island</option>
			            <option value="MP" label="Northern Mariana Islands">Northern Mariana Islands</option>
			            <option value="PW" label="Palau">Palau</option>
			            <option value="PG" label="Papua New Guinea">Papua New Guinea</option>
			            <option value="PN" label="Pitcairn Islands">Pitcairn Islands</option>
			            <option value="WS" label="Samoa">Samoa</option>
			            <option value="SB" label="Solomon Islands">Solomon Islands</option>
			            <option value="GS" label="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option>
			            <option value="TK" label="Tokelau">Tokelau</option>
			            <option value="TO" label="Tonga">Tonga</option>
			            <option value="TV" label="Tuvalu">Tuvalu</option>
			            <option value="UM" label="U.S. Minor Outlying Islands">U.S. Minor Outlying Islands</option>
			            <option value="VU" label="Vanuatu">Vanuatu</option>
			            <option value="WF" label="Wallis and Futuna">Wallis and Futuna</option>
			        </optgroup>
			    </form:select>	
			    <form:errors path="rdeNat"/>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">이메일</label>
                <form:input type="email" path="rdeMail" class="form-control border-0 bg-smoke" value="${member.memMail }" id="email" />
                <form:errors path="rdeMail"/>
              </div>
            </div>
			<input type="hidden" name="resSdate" value="${resv.resSdate }"/>
			<input type="hidden" name="resEdate" value="${resv.resEdate }"/>
			<input type="hidden" name="resQty" value="${resv.resQty }"/>
			<input type="hidden" name="prodNum" value="${resv.prodNum }"/>
			<input type="hidden" name="prodPrice" value="${resv.prodPrice }"/>
			<input type="hidden" name="prodNam" value="${prod.prodNam }"/>
			<input type="hidden" name="comId" value="${prod.comId }"/>
			<input type="hidden" name="prodImg" value="${prod.prodImg }"/>
			<input type="hidden" name="cinfoNum" value="${prod.cinfoNum }"/>
			<input type="hidden" name="charCode" value=""/>
			<input type="hidden" name="charPrice" value=""/>
			<input type="hidden" name="resCode" value=""/>
			<input type="hidden" name="coupon" value=""/>
			<input type="hidden" name="mileage" value=""/>
          </div>
    	</form:form>
        <div class="form-group mb-5">
          <label for="exampleFormControlTextarea1">Requirements</label>
          <textarea class="form-control border-0 bg-smoke" rows="7" disabled="disabled">
전자결제서비스 이용 약관
제 1 장 [총 칙]
제 1 조 (목적)
이 약관은 “회사”가 “고객사” 에게 제공하는 “서비스”의 이용조건 및 절차에 관한 사항을 규정하는데 있습니다.

제 2 조 (용어의 정의)
이 약관에 공통적으로 적용되는 용어의 정의는 다음과 같습니다.

① 서비스: “고객사”가 전자적 방법으로 “이용자”에게 “상품”을 판매하거나 제공할 때 “이용자”가 “결제기관”으로부터 발급받은 “결제수단”을 “회사”와 “결제기관”과의 계약 등에 따라 “회사”가 제공하는 시스템을 이용하여 사용·조회·관리할 수 있도록 하고, “결제정보”를 송·수신하거나 “거래승인”·”매입”·”대금정산”을 대행하거나 매개하는 행위 또는 이에 관련된 행위 일체를 말하며, 다음 각 호의 서비스 및 기타 부가서비스를 포함합니다.

전자지급결제대행서비스: 전자적 방법으로 “상품”의 구매 또는 이용에 있어서 “결제정보”를 송·수신하는 것, “거래승인”·”매입”·”대금정산”을 대행하거나 매개하는 서비스를 말합니다.
간편결제서비스: “고객”이 “결제기관”으로부터 발급받은 “결제수단”을 “회사”의 시스템에 사전 등록하는 등의 방법으로 사용·조회·관리할 수 있도록 하는 서비스 또는 이와 관련된 서비스 일체를 말합니다.
결제운영 관리서비스: “회사”가 “고객사”에게 제공하는 결제CS, 관리자시스템, 기술지원, 서비스 운영지원 등 결제운영 관련 관리서비스를 말합니다.
특약서비스: “고객사”와 별도 합의하여 제공하는 서비스를 말합니다.
② 결제기관: “이용자”가 “회사”의 “서비스”를 통하여 “결제수단”별로 “결제승인”을 요청한 사항에 대하여 “거래승인” 여부를 결정하는 기관(신용카드사, 은행, 통신과금사업자, 이동통신사, 상품권발행업자, 간편결제사 등)을 말합니다.

③ 결제수단: “상품”을 구매하기 위해 “이용자”가 이용하고자 하는 신용카드, 계좌이체, 가상계좌, 휴대폰결제, 상품권 등의 지불방법을 말하고, 이 계약의 “결제수단”은 상점관리자 또는 별도 서비스 “수수료”율 표에 명시되며, “회사”의 정책에 따라 추가, 변경될 수 있습니다.

④ 해외신용카드: “해외신용카드” 라 함은 해외 신용카드 발급사에서 발행된 신용카드를 말합니다.⑤ 결제정보: “이용자”가 “상품” 구매를 위하여 “회사”의 “서비스”를 통해 제공하는 “결제수단”의 세부 정보를 말합니다.

⑥ 거래승인: “결제기관”이 “이용자”가 제공한 “결제정보”가 “결제기관”에 등록된 정보와 일치함을 확인하고 해당 “결제수단”의 결제능력을 확인하는 행위를 말합니다.

⑦ 매입: “결제기관”의 “거래승인”을 얻은 “상품” 판매 건의 대금 결제를 위하여 “회사”가 “고객사”를 대행하여 “결제기관” 등에게 그 대금의 지급을 청구하는 행위를 말합니다.

⑧ 대금정산: “회사”의 “서비스”를 이용하여 발생한 거래에 대하여 “회사”가 “결제기관” 등으로부터 결제금액을 지급받고, 해당 결제금액에서 “회사”와 “고객사”가 상호 약정한 제반 “수수료” 등을 공제한 후 “고객사”에게 지급하는 행위를 말합니다.

⑨ 이용자: “고객사”가 운영하는 “쇼핑몰”에서 “회사”의 “서비스”를 이용하여 “상품”을 구매하고자 하는 자를 말합니다.

⑩ 상품: “고객사”가 “회사”의 “서비스”를 이용하여 “이용자”에게 판매하고자 하는 유, 무형의 재화 또는 서비스 등을 말합니다.

⑪ 쇼핑몰: “고객사”가 컴퓨터 등과 정보통신설비를 이용하여 “상품”을 거래할 수 있도록 설정된 가상의 영업장 또는 사업장을 말합니다.

⑫ 접근매체: “회사”의 “서비스”를 이용하여 “상품”을 구매함에 있어 거래지시를 하거나 “이용자” 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 “이용자”의 인증서, 전화번호, 결제비밀번호, 단말기, 아이디, 비밀번호 등을 말합니다.

⑬ 비정상거래: “결제수단”의 본인 미사용(분실, 도난, 허위발급, 도용, 위조, 변조 등을 포함합니다) 등 “결제수단”을 부정사용하여 이루어진 거래와, 실제 “상품”의 구매없이 “상품” 구매를 가장하여 자금을 융통하기 위해 이루어진 거래 등을 말합니다.

⑭ 거래정보: 여신전문금융업법, 전자금융거래법 등에 따른 “이용자”의 인적 사항, 계좌, “접근매체”, 배송내역, 수령증 등 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 말합니다.

⑮ 월 지급한도액: “회사”가 “고객사”에게 매월 지급하는 “대금정산” 금액의 한도금액을 말합니다. “회사”는 “고객사”가 “회사”에게 제출한 이행보증보험증권상의 보험가입금액 또는 기타 담보설정증서를 통한 담보금액과 동일한 금액으로 이를 설정할 수 있습니다.

⑯ 수수료: “고객사”가 “서비스” 이용 대가로 “회사”에 지급하는 금액을 말하며, 결제”수수료”, 등록비, 연회비 등이 포함됩니다.


제 3 조 (약관 외 준칙)
① 이 약관에 정하지 아니한 사항 및 이 약관상 문구의 해석에 관해서는 관련 법령, 신용카드 가맹점 규약, 전자상거래 표준약관, 이 약관에 우선하는 특약 또는 부칙(신청서 포함), “결제기관” 또는 “회사”의 정책 및 상관례에 따릅니다.

② 체크카드와 직불카드에 관하여, 그 성질에 반하거나 명시적으로 분리하여 정하지 않는 한 이 약관 및 특약, 부칙 기타 관련 계약서 상 신용카드에 관한 규정이 동일하게 적용됩니다.

③ “회사”는 개별 “서비스” 별로 별도의 이용약관 및 정책(이하 “개별 약관 등”)을 둘 수 있으며, 해당 내용이 이 계약과 상충할 경우에는 “개별 약관 등”이 우선하여 적용됩니다.

④ 이 약관과 관련하여 “회사”의 정책 변경, 관련 법령의 제/개정 또는 공공기관의 고시나 지침 등에 의하여 “회사”가 “서비스” 또는 상점관리자의 화면 등을 통해 공지하는 내용도 이 약관의 일부를 구성합니다.

제 4 조 (약관의 명시 및 효력변경)
① “회사”는 이 약관의 내용을 “고객사”가 쉽게 알 수 있도록 “서비스”또는 상점관리자의 화면 내 또는 링크로 연결된 화면에 게시합니다.

② “회사”는 약관의 규제에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다.

③ “회사”가 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 제1항의 방식에 따라 그 개정약관을 적용일자 7일 전부터 공지합니다. 다만, “고객사”에 불리하거나 중요한 사항을 변경하는 경우에는 적용일자 30일 이전에 공지하며, 공지 외에 제5조에 따라 전자적 수단을 통해 별도로 통지합니다.

④ “회사”가 “고객사”가 명시적으로 거부의사를 표명하지 않으면 개정약관에 동의한 것으로 본다는 뜻을 전항의 방식에 따라 공지 또는 통지하였음에도, “고객사”가 개정약관 적용일자 전까지 명시적으로 거부의사를 표명하지 아니한 경우 “고객사”는 개정약관에 동의한 것으로 봅니다.

⑤ “고객사”가 개정약관의 내용에 동의하지 않는 경우, “회사”는 해당 “고객사”에 대하여 개정약관의 내용을 적용할 수 없습니다. 이 경우 “고객사”는 이용계약을 해지할 수 있고, “회사”가 해당 “고객사”에게 기존 약관을 적용할 수 없는 경우에는 “회사”는 해당 “고객사”와의 이용계약을 해지할 수 있습니다.

제 5 조 (고객사에 대한 통지)
① “회사”가 “고객사”에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 “고객사”의 전자우편, SNS, 문자메시지 또는 전화 등의 방법으로 할 수 있습니다.

② “회사”는 “고객사” 전체에 대한 통지의 경우 7일 이상 “서비스” 또는 상점관리자의 화면 등에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.

제 6 조 (분쟁처리 및 관할법원)
① “회사”와 “고객사” 간 제기된 소송은 대한민국법을 준거법으로 합니다.

② 이 약관과 관련하여 분쟁이 발생한 경우 각 당사자는 관련 법령 및 상관례에 따라 서로 협의하여 호혜적 차원에서 해결합니다. 협의가 성립되지 아니하여 분쟁해결을 위한 소송이 제기된 경우 민사소송법 상의 관할규정에 따릅니다.

③ 전항에도 불구하고 해외에 주소가 거소가 있는 “고객사”의 경우 대한민국 서울중앙지방법원을 관할법원으로 합니다.

제2장 [서비스 이용계약]
제 7 조 (이용계약의 성립)
① “서비스” 이용계약은 “서비스”를 이용하고자 하는 자(이하 “이용신청자”라 합니다)가 이 약관에 동의하고 “서비스” 이용에 대한 “수수료” 등의 계약조건 확인 후 “회사”가 요청한 서류 또는 정보 등을 “회사”에 제출하는 방식으로 이용신청을 하고 “회사”가 이를 승낙함으로써 성립됩니다. “회사”는 이용승낙의 의사표시를 “서비스” 화면에 게시하거나 개별 통지합니다.

② 타인의 명의를 도용하거나 허위의 정보를 제출하여 이용계약이 성립되거나, 이 약관에 반하여 이용계약이 성립된 경우 이용계약은 무효가 되며, “고객사”는 이로 인해 발생한 “회사”의 손해를 부담해야 합니다.

③ 이용계약의 성립시기는 “회사”의 승낙이 “이용신청자”에게 도달한 시점으로 합니다.

④ “고객사”와 “회사”는 “서비스” 이용에 대한 “수수료” 등과 관련한 별도의 합의를 할 수 있습니다.

⑤ “고객사”는 “특약서비스”를 이용하고자 할 경우 “회사”와 별도 특약(이하 “신청서”라 합니다)을 체결해야 합니다.

제 8 조 (이용신청에 대한 승낙의 유보 및 제한)
“회사”는 다음 각호에 해당하는 경우 “서비스” 이용신청에 대한 승낙을 거부하거나 유보할 수 있습니다.

“이용신청자”가 만 14세 미만인 경우
“이용신청자”가 이 약관에 의하여 “서비스” 이용자격 또는 “고객사” 자격을 상실한 적이 있는 경우
“이용신청자”가 제출 또는 기입한 서류 또는 정보에 허위 기재, 누락, 오기, 또는 미비사항이 있는 경우
제출한 서류 또는 정보에 기재된 대표자명과 홈페이지 상의 대표자명이 상이한 경우
이 약관에서 정한 보증보험증권을 제출하지 않거나 “등록비”를 지급하지 아니한 경우
신규신청으로 접수하였으나 사업자 또는 상호명만 변경하여 재 신청한 것으로 확인되는 경우
“회사”로부터 이용 제한 등의 조치를 받은 자가 그 조치기간 중에 이용계약을 임의 해지하고 재이용신청을 하는 경우
“고객사”의 “쇼핑몰”, “상품” 등에 관련하여 법령, 이 약관 또는 “회사”의 정책 위반이 확인되는 경우
설비에 여유가 없거나 기술상 지장이 있는 경우
기타 위 각 호의 사유가 있는 것으로 의심되거나 이 약관에 위배되거나 위법 또는 부당한 이용신청인 경우 또는 “회사”가 합리적인 판단에 의하여 필요하다고 인정하는 경우
제 9 조 (고객사정보의 제공 및 변경)
① “고객사”는 이 약관에 의하여 “회사”에 정보를 제공하여야 하는 경우에는 진실된 정보를 제공하여야 하며, 허위정보 제공으로 인해 발생한 불이익에 대해서는 보호받지 못합니다.

② “고객사”는 이용신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 “회사”에 대하여 그 변경사항을 알려야 합니다.

③ 전항의 변경사항을 “회사”에 알리지 않아 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.

제 10 조 (고객사 ID 및 비밀번호의 관리)
① “회사”는 한 “고객사”에 한 개의 ID를 발급함을 원칙으로 합니다. 다만, “고객사”의 요청이 있을 경우 수 개의 ID를 발급할 수 있으며, 이에 따라 발급된 수 개의 ID를 통합 관리하는 등 적절한 조치를 취할 수 있습니다.

② ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경하고자 하는 경우는 기존 ID를 해지 또는 유지하고 ID를 추가로 발급받아야 합니다.

③ “고객사”는 ID 및 비밀번호 등에 대한 관리책임이 있으며, 어떠한 경우에도 본인의 ID 또는 비밀번호를 타인에게 양도하거나 대여할 수 없습니다.

④ “고객사”는 “회사”의 귀책사유 없이 ID 또는 비밀번호의 유출, 양도, 대여로 인하여 발생하는 손실이나 손해에 대한 책임을 부담합니다.

제 11 조 (계약기간)
① 이용계약은 계약체결일로부터 2년 동안 유효하며, 어느 일방이 이용계약의 종료 1개월 전까지 서면으로 계약 종료의 의사표시를 하지 않는 경우, 이용계약은 동일한 조건으로 2년씩 자동 연장됩니다.

② “고객사”는 이용계약 종료 후 계약기간 중 “서비스”를 이용하여 발생한 “상품” 구매에 대해 “이용자”가 민원을 제기할 경우, 신의성실의 원칙에 따라 해결하여야 하며, 그에 대한 결과를 “회사”와 “이용자”에게 통지하여야 합니다.

③ “회사”는 이용계약 종료 이후에도 계약기간 중 “서비스”를 이용하여 발생한 “상품” 구매에 대하여 민원발생의 요소가 완전히 해소되었다는 상호 합의가 있을 때까지 “대금정산” 및 “고객사”가 제공한 손해담보물의 반환을 보류할 수 있습니다.

제 12 조 (이용계약의 승계)
① 일방 당사자에 대하여 합병, 현물출자, 법인전환, 영업양도 등 계약상 지위변동사유가 발생할 경우, 해당 당사자는 사유발생 30일 전에 발생사유, 발생내용, 제3자사이에 발생한 법률관계를 명확히 하여 상대방에게 서면으로 통지하고 동의를 얻어야 합니다.

② 전항의 통지를 소홀히 하여 발생한 손해에 대하여는 통지의무를 태만히 하거나 불확실한 통지를 한 당사자가 배상책임을 부담합니다.

③ 본 조 제1항에 의한 동의가 있거나, 통지 도달 후 7일 내에 “회사”가 반대의 의사를 표시함이 없이 계속 “서비스”를 제3자(권리의무 양수인을 포함)에게 제공하는 때에는 잔존의 계약기간 동안 이용계약은 “회사”와 제3자와의 관계에서 계속 존속하는 것으로 봅니다.

④ 개인인 “고객사”가 계약기간 중 법인사업자로 전환할 경우, “고객사”의 “회사”에 대한 채권, 채무는 소멸되지 아니하며 법인은 “고객사”의 채무를 중첩적으로 승계합니다.

제3장 [고객사 및 회사의 책임과 의무]
제 13 조 (고객사의 책임과 의무) ① “고객사”는 “서비스”를 이용함에 있어서 “회사”에 “수수료”를 지급하여야 하며, 이를 “이용자”로 하여금 부담하게 하여서는 아니됩니다.

② “고객사”는 “회사”가 원활한 “서비스” 제공을 위하여 이행하거나 요청하는 사항에 대하여 관련 법령을 준수하는 범위 내에서 이에 응하여야 합니다.

③ “고객사”는 “이용자”가 “상품”을 구매함에 있어 “서비스”를 이용할 수 있도록 하여야 합니다.

④ “고객사”는 다음 각 호에 해당하는 행위를 하여서는 아니됩니다.

“상품”의 제공 없이 “결제수단”에 의한 거래를 한 것으로 가장하는 행위
실제 “상품”의 금액을 초과하여 “결제수단”에 의한 거래를 하는 행위
“고객사”가 아닌 다른 가맹점의 이름으로 “결제수단”에 의한 거래를 하는 행위
“고객사”의 이름을 타인에게 빌려주는 행위
“결제수단”에 의한 거래를 대행하는 행위
⑤ “고객사”는 “이용자”에게 “회사”의 “서비스”를 이용하여 “상품”의 구매가 이루어지고 이에 대한 대금의 청구가 “회사”의 명의로 이루어질 수 있다는 사실에 대해 “이용자”가 명확하게 이해할 수 있도록 “쇼핑몰”의 약관 및 주요화면을 통해 명시적이고 완전한 방법에 의한 고지를 하여야 합니다.

⑥ “고객사”는 선량한 관리자로서 주의의무를 다하여 불법이용자(타인의 개인정보를 도용하거나 신용카드, 은행계좌, 주민등록번호, 계좌비밀번호 등을 오용하여 “고객사”의 회원으로 등록하거나 “상품”을 결제하고자 하는 자 등)가 “서비스”를 이용하지 못하도록 조치하여야 하고, “비정상거래”, “이용자”의 본인사용, 신용카드거래의 진위성, 적법성, 유효성 여부를 확인해야 합니다.

⑧ “고객사는” “서비스”를 통하여 이루어진 “이용자”와의 거래에 대해 “이용자” 또는 “회사”의 정당한 민원, 청약철회, 구매취소, 반품, 환불 요구가 있는 경우, 이를 자신의 책임 하에 처리하여야 하며, 이에 대한 처리를 하여야 합니다.

⑨ “회사”가 “고객사”에 제공한 “서비스”의 모든 구성요소(결제모듈 포함)는 “회사”의 소유이며 “고객사”는 “회사”의 서면동의 없이, 제3자에게 이에 대한 매매, 임대, 증여, 담보물 제공, 타 용도 전용 등을 할 수 없습니다.

⑩ “고객사”는 “회사”가 제공한 “서비스”를 임의로 수정할 수 없고, 임의 수정으로 인해 발생한 손실에 대해서는 “고객사”가 책임을 집니다.

⑪ “이용자”가 “상품”을 주문하고 결제를 완료한 후 “고객사”가 “거래승인”을 받은 경우 “고객사”는 “이용자”에게 해당 “상품”의 배송 또는 전달을 책임지며 이에 따른 증빙자료를 보관하여야 하고, “회사”의 요구가 있을 시 지체 없이 이를 제시하여야 합니다. 만일 “고객사”가 해당 증빙자료를 제시하지 못할 경우 “회사”는 차기 정산대금에서 해당 금액을 차감한 후 지급할 수 있습니다. 다만, 차기 정산대금이 동 대금에 미치지 못하거나 이용계약이 해지 또는 종료된 경우 “고객사”는 “회사”가 정하는 방법으로 반환하기로 합니다.

⑫ “고객사”가 “이용자” 민원을 원만히 해결하지 않아 “회사”의 “서비스” 운영, 관리에 있어 문제가 발생하거나 “회사”에게 손실이 발생될 경우에는 “고객사”에게 통지하고 차기 정산대금에서 차감, 승인 취소 또는 제공한 손해 담보물의 실행을 할 수 있습니다.

⑬ “고객사”는 여신전문금융업법, 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자금융거래법 등 소비자보호 관련 법령상의 제반 의무 및 “회사”의 정책을 준수하여야 합니다.

제 14 조 (회사의 책임과 의무)
① “회사”는 “이용자”가 “상품” 구매를 위해 입력한 “결제정보”에 대해서는 다른 용도로 사용하거나 제3자에게 제공 및 유출하지 않습니다. 단, 다음 각 호에 해당하는 경우는 예외로 합니다.

수사기관, 조세기관 등 관계기관으로부터 적법하고 정당하게 수사, 조세 등에 필요한 서류의 열람이나 제출을 서면으로 통지받아 이에 응할 경우
“회사”가 정한 기간 동안 미수금 등을 체납하여 신용정보사업자 또는 신용정보집중기관에 제공하고자 하는 경우
정보통신윤리위원회의 요청이 있는 경우
기타 이 약관 또는 관련 법령에서 정한 경우
② “회사”는 “고객사”가 “서비스”를 이용할 수 있도록 “고객사”의 “쇼핑몰” 운영시스템과 “회사”의 전자결제시스템을 연동할 수 있는 소프트웨어 설치 매뉴얼 및 기술적 자문을 제공하여야 합니다.

③ “회사”는 “서비스” 제공에 필요한 시스템을 구축 및 보안시스템 개발 구축을 하여야 하며, 악의를 가진 해킹, 피싱 등에 의한 범죄에 준하는 행위로 인해 보안시스템의 문제가 발생할 경우 신속히 대처해야 합니다.

④ “회사”는 전자금융거래법 및 동법 시행령 상의 제반 사항, 전자상거래 등에서의 소비자보호에 관한 법률 및 전자상거래 등에서의 소비자보호 지침, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 행정기관의 행정지침을 준수합니다.

제 15 조 (개인정보, 거래정보 및 영업비밀 보호 등)
① “고객사”와 “회사”는 계약 기간 동안 취득한 “이용자” 정보 및 “거래정보”, 상대방의 영업정보를 제3자에게 누설해서는 안 되며, 위반 시 이로 인하여 발생되는 손해에 대해 민, 형사상의 책임을 져야 합니다.

② “회사”는 관련 법령이 정하는 바에 따라 “고객사”의 개인정보를 보호하기 위해 노력합니다. “고객사” 개인정보의 보호 및 사용에 대해서는 관련 법령 및 “회사”의 개인정보처리방침이 적용됩니다.

③ “회사”는 “서비스”를 통해 생성∙수집된 행태정보를 포함한 데이터를 “회사”의 고유 사업 목적으로 관련 법령 및 정부기관의 가이드를 준수하는 범위 내에서 활용할 수 있습니다.

④ “회사”의 “서비스” 화면, 상점관리자 이외의 단순히 링크된 제3자의 사이트 및 서비스에서는 “회사”의 개인정보처리방침이 적용되지 않습니다.

⑤ “회사”는 “고객사”의 귀책사유로 인하여 노출된 “고객사”의 계정정보를 포함한 모든 정보에 대해서 일체의 책임을 지지 않습니다.

⑥ “고객사”는 “서비스”를 이용한 “이용자”의 “결제정보”를 “거래승인” 이후에는 별도로 보유하거나 유출하는 행위를 하여서는 아니됩니다.

⑦ “고객사”는 “회사”의 “서비스”를 이용하여 발생한 거래에 대하여 채권환수가 가능하도록 “거래정보”를 최소 5년간 보관하여야 하며, “회사”의 제출요구가 있을 경우 “고객사”는 이를 “회사”에 3영업일 이내에 제출해야 합니다.

⑧ “회사”는 결제기관, 수사기관, 금융감독기관 등이 여신정보금융업법, 전자금융거래법 등 관련 법령에 의거하여 “고객사”의 “거래정보” 또는 “이용자” 정보를 요청할 때에는 이를 제공할 수 있습니다.

⑨ 본 조에 따라 “회사”의 “거래정보” 제출 요청이 있을 경우, “고객사”는 3영업일 이내에 이를 “회사”에게 제출하여야 하며, 만약 “거래정보”를 제출하지 않아 “회사”에게 손해가 발생할 경우 이에 대한 모든 책임은 “고객사”에게 있습니다.

⑩ “회사”는 “서비스”의 제공을 위해 필요하다고 판단할 경우, “회사”가 보유하고 있는 “고객사”의 정보(대표자 개인정보 및 신용정보 포함)를 신용정보사업자 또는 신용정보집중기관에 제공하여 “고객사”의 신용정보를 조회할 수 있습니다.

제 16 조 (상품의 판매 제한·금지 등)
① 건전한 전자상거래와 “이용자” 보호를 위하여, “고객사”가 판매하는 “상품”이 전자금융거래법, 여신전문금융업법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령, 금융당국·결제기관 또는 “회사”의 정책에 위반될 경우, “서비스”를 이용한 “상품”의 판매가 금지 혹은 제한될 수 있습니다.

② 본 조에 따라 “서비스”를 이용한 판매가 금지되는 “상품”은 아래와 같습니다.

[판매금지 상품 목록] 주류, 담배, 전자담배, 순금, 원석, 다이아몬드, 마약류, 음란물, 성인용품, 가짜명품, 대출정보제공, 경마경륜권, 경품입찰대행, 복권, 도박, 애완동물분양, 휴대폰 개통서비스, 인터넷 경매, 펜션 분양, 골프, 회원권, 스키 시즌권, 자동차 판매, 중고차 판매, 성인유료 서비스 제공, 유흥업소, 만남주선, 채팅, 폰팅, 유흥구인구직, 도수 있는 안경, 콘텍트렌즈 및 선글라스, 의약품, 게르마늄 팔찌, 게르마늄 목걸이, 모의총포, 로또번호, 생성서비스, 피규어, SNS 팔로워증가, 장례서비스, 저작권 침해 물품, 카드사 등록불가 업종, 랜덤박스(랜덤상품, 럭키박스 등) 등

③ 본 조에 따라 “상품”의 가치가 손쉽게 현금화될 수 있는 환금성 “상품”은 “서비스”를 이용한 판매가 제한됩니다. “고객사”가 환금성 “상품”을 “서비스”를 이용해 판매하고자 할 때에는, 1)필수적으로 인증강화를 하고, 2)”회사”에게 사전 신청을 하여 승인을 받아야 합니다.

[환금성 상품 예시] 상품권, 기프티콘, 포인트 충전, 게임 아이템, SMS충전, 웹하드 등

④ 본 조에 따라 “서비스”를 이용한 판매가 금지 또는 제한되는 “상품” 목록은 관련 법령의 변경, 금융당국·“결제기관” 또는 “회사”의 정책 변경 등의 사유로 변경될 수 있으며, 이 경우 “회사”는 이 사실을 “고객사”에게 통지합니다.

⑤ “고객사”가 본 조를 위반하여 “서비스”를 이용한 판매가 금지 또는 제한되는 “상품”을 판매한 경우, 이로 인하여 “회사” 또는 제3자에게 발생하는 모든 손해를 배상하여야 합니다. “회사”는 손해배상 청구와 별도로 해당 거래 건을 직권으로 취소하거나, “서비스” 제공의 중지, 제한, 이용계약의 해지 등의 조치를 취할 수 있고, 이에 대하여 어떠한 책임도 “고객사”에 부담하지 않습니다.

제 17 조 (손해담보물 제공)
① “고객사”는 “서비스”를 통하여 “이용자”에게 판매한 “상품”에 관한 반품처리, 비정상거래 등을 “회사”가 대신 처리하는 과정에서 발생할 수 있는 “회사”에 대한 채무의 이행을 담보하기 위하여 “회사”가 지정한 지급한도 금액을 이행보험금으로 하는 이행보증보험증권을 “회사”가 정한 기한까지 “회사”에게 제출해야 합니다. 이 때 보험가입금액은 “회사”의 “서비스”를 통하여 발생할 것으로 예상되는 월 결제금액, 업종, “고객사”의 재무상태 등을 고려하여 “회사”가 결정하며, “회사”는 이행보증보험증권 등 담보의 면제가 가능하다고 판단되는 “고객사”에 대해서는 이를 면제할 수 있습니다.

② 보증보험증권의 제출이 불가능한 경우, “고객사”는 “회사”의 동의 하에 예금질권, 현금담보 등 타 담보를 제공함으로써 이를 갈음할 수 있습니다.

③ “고객사”가 본 조에 따라 제출한 이행보증보험증권상의 보험가입금액 또는 기타 담보설정증서를 통한 담보금액은 “대금정산”을 위한 “월 지급한도액”으로 설정되며, “회사”와 “고객사”는 사전 서면 합의하여 “월 지급한도액”을 변경할 수 있습니다.

④ 계약기간 중 본 조에 따라 제공된 담보의 기간이 만료된 경우 “고객사”는 이행보증보험증권 등 담보를 갱신하여 제공하여야 하며, 갱신이 지연될 경우 “회사”는 “서비스”의 제공 및 “대금정산”을 제한 또는 중지할 수 있습니다.

⑤ “회사”는 “고객사”의 신용상태 및 월 결제금액의 규모에 따라 이행보증보험가입금액 및 보증보험대체비의 증액을 요청할 수 있습니다.

⑥ “회사”는 “고객사”를 대신하여 “고객사”를 피보증인으로 하고 보험한도가 최대 500만원인 이행(신용)보증보험에 가입할 수 있고, 이를 위해 “고객사”의 정보(대표자명, 가맹점ID, 가맹점명, 전화번호, 생년월일 등)를 보험사에 제공할 수 있습니다.

제 18 조 (특정금융거래정보의 보고 및 이용에 관한 의무)
① “회사”는 특정금융거래정보의 보고 및 이용에 등에 관한 법률 및 동법 시행령(이하 “특정금융정보법”) 상의 제반 사항과 행정기관의 행정지침을 준수합니다.

② “회사”는 위 법령에서 정하는 바에 따라 “고객사”의 신원정보(법인명, 실명번호, 사업장 소재지 및 대표자 성명, 대표자 성별, 대표자 실명번호 등) 및 실제소유자 정보를 확인할 수 있고 신뢰할 수 있는 문서, 자료, 정보 등을 통하여 정확성을 검증할 수 있으며, 관련 내용을 금융정보분석원에 신고할 수 있습니다.

③ “고객사”가 “특정금융정보법”에서 정하는 바에 따라 요구받은 정보의 제공을 거절할 경우, “회사”는 “서비스” 이용신청의 승인을 유보할 수 있습니다.

④ “특정금융정보법”에 따라 “고객사”에게 “회사”의 “서비스”를 제공하는 것이 부적절한 경우 “회사”는 “대금정산”을 제한하거나 “서비스” 이용 제한 또는 계약해지 등의 조치를 취할 수 있으며, 이에 대하여 어떠한 책임도 지지 않습니다.

제4장 [서비스의 제공, 중지, 변경 등]
제 19 조 (서비스의 제공 등)
① “회사”는 “서비스”를 연중 24시간 제공함을 원칙으로 합니다. 다만, 이 약관 또는 “결제수단” 별 “결제기관”의 업무환경에 따라 제공시간을 달리 할 수 있습니다.

② 전자결제시스템의 정기점검, 보수점검, 교체 또는 고장, 통신두절, 기술상의 필요, “결제수단”별 “결제기관”의 시스템 점검 또는 운영상 상당한 이유 등에 의해 “서비스” 중단이 불가피한 경우에는 “고객사”에게 사전 통지 후 일시 중지할 수 있습니다. 다만, “회사”가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.

제 20 조 (서비스의 변경)
① “회사”는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 “서비스”를 변경할 수 있습니다.

② “서비스”의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 “서비스” 화면에 게시하여야 합니다.

③ “회사”는 무료로 제공되는 “서비스”의 일부 또는 전부를 “회사”의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련 법령에 특별한 규정이 없는 한 “고객사”에게 별도의 보상을 하지 않습니다.

제 21 조 (서비스 이용제한 등)
① 다음의 각 호에 해당하는 경우 “회사”는 “고객사”의 “서비스”을 제한하거나 이용계약을 해지할 수 있습니다.

“고객사”가 관련 법령 또는 이 약관의 의무를 위배하거나 “서비스”의 정상적인 운영을 방해한 경우, 고의 또는 중대한 과실로 “회사”에 손해를 입힌 경우
“고객사”의 “쇼핑몰” 또는 “상품”이 관련 법령, 이 약관, 공공질서 또는 미풍양속을 위반한 경우
“고객사”에게 압류, 가압류, 가처분, 소송, 부도, 워크아웃, 파산신청, 회생절차 개시신청 등의 사유가 발생하여, “고객사”가 이 약관상 업무수행을 지속적으로 성실히 할 것을 기대하기 곤란하거나, 정상적인 영업활동을 할 수 없게 되었다고 판단되는 경우
“고객사”가 이용계약 체결 시 “쇼핑몰” 또는 “상품”을 허위로 등록하거나, “회사”의 사전 동의 없이 체결 시 등록한 “상품”과 다른 “상품”을 판매할 경우
“고객사”에 대한 민원이 다량으로 접수된 경우
“고객사”가 등록한 연락처로 연락이 되지 않거나 “쇼핑몰”이 운영되지 않음이 명백한 경우
“고객사”가 특별한 사정없이 15일 이상 “거래승인” 요청을 하지 않거나, “고객사”의 결제취소 금액이 “거래승인” 금액보다 큰 경우
기타 “고객사”가 이 약관상 의무를 성실히 이행하지 않은 경우
② 전항 각 호의 사유가 발생할 경우, “회사”는 “대금정산”의 일부나 전부에 대한 보류, “거래승인” 요청에 대한 제한, “거래승인” 완료된 건에 대한 취소제한 등의 “서비스” 이용 제한 조치를 취할 수 있고, “회사”에게 손해가 발생할 경우 “고객사”는 이를 배상해야 합니다.

③ “회사”는 “고객사”의 신용도, 매출유형, “이용자”의 이의신청 및 비정상거래의 발생 빈도, 민원해결을 위한 협조성 등 “회사”의 리스크 관리, 운영 방침에 따라 “고객사”에 대하여 일정기간 “결제수단” 별로 승인한도 및 할부거래 개월 수를 제한하는 등 “서비스” 이용을 제한할 수 있습니다.

④ “고객사”가 “서비스” 이용을 일시적으로 중지하여야 하는 불가피한 사유(“쇼핑몰”의 이전, 폐점, 시스템 점검 등)가 있을 경우, 이에 대하여 사전에 “회사”와 서면합의하여야 하며, 서면합의 시 다음 각 호의 내용이 반드시 포함되어야 합니다.

일시중지 사유
“서비스” 이용 재개 예정일
일시중지 기간 동안 “비정상거래”, 미해결 민원, “결제기관”의 차감 지급 보류 등에 대하여 “회사”의 손실을 보전할 수 있는 해결방안
제5장 [대금정산]
제 22 조 (수수료의 지급)
① “고객사”는 “서비스” 이용의 대가로 “회사”에게 ”수수료”를 이 약관에서 정한 바에 따라 “대금정산”시 “회사”가 “고객사”에 지급해야 하는 결제금액에서 차감하는 방식으로 지급합니다.

② “회사”는 “고객사”에게 이 약관에 따라 매월 발생한 “수수료”에 대하여 해당월 말일자를 발행일자로 하여 익월 초까지 세금계산서를 발행합니다.

③ “회사”는 “수수료” 및 정산 주기를 변경할 수 있으며, 변경시 “고객사”에 변경 사항을 통지합니다. 다만 “수수료”가 인하되는 경우에는 별도 통지하지 아니할 수 있습니다.

④ “고객사”의 “회사”에 대한 “수수료” 지급 의무는 이용계약이 해지 또는 종료되더라도 지급할 “수수료”가 존재하는 한 계속되는 것으로 봅니다.

제 23 조 (영세중소가맹점 우대수수료)
① 신용카드 결제에 한하여, “고객사”가 여신전문금융업법 상 영세한 중소신용카드가맹점(이하 “영세중소가맹점”이라 합니다)에 해당할 경우, “회사”는 이 약관상 결제수수료에도 불구하고 “회사”의 정책에 따라 “고객사”에게 신용카드 결제수수료에 대하여 우대수수료를 적용할 수 있습니다.

② “영세중소가맹점” 해당 여부는 여신전문금융업법 및 관련 고시 등에 의거하여, “고객사”의 국세청 신고 매출액을 기준으로 변경될 수 있으며, 변경 사항은 “서비스” 화면 또는 “상점관리자” 등을 통해 고지합니다.

③ “회사”는 “고객사”에게 본 조를 적용하기 위해 필요한 경우, 신용카드사에게 “고객사”에 대한 관련 정보를 제공할 수 있습니다.

④ “고객사”는 금융위원회에 전자금융업 등록을 하고 하위 결제대행사업자로서 다른 사업자의 결제를 대행하려는 경우 최소 5영업일 이전에 “회사”에게 하위 결제대행사업자 등록 예정 사실을 알려야 합니다.

제 24 조 (거래승인)
① “거래승인”을 얻기 위하여 제공되는 “결제정보”는 “회사”의 사전 허락 또는 별도의 합의가 없는 이상 “이용자”가 직접 입력하여야 하며, “고객사”는 “이용자”에게 “결제정보”를 요구하거나 “결제정보”를 대신 입력하여서는 아니 됩니다.

② “거래승인”은 당해 “결제수단”의 유효성 및 결제능력의 확인을 의미하는 것이므로 해당 거래의 진위성 및 본인 사용 여부의 확인은 “고객사”의 책임으로 하며, 불법이용자, “비정상거래” 등 “결제수단”의 부정사용의 경우 “거래승인”의 사실로 “고객사”가 면책되는 것은 아닙니다.

제 25 조 (매입)
① 이 약관에 의한 "매입" 대상 거래는 "결제기관"의 "거래승인" 주체로부터 승인번호를 받은 "거래승인" 건에 한합니다.

② “고객사”는 “거래승인”일로부터 30일 이내에 “회사”에게 “매입”하도록 요청하여야 하며, “회사”는 동 기간이 경과하거나 “상품” 배송 또는 제공이 이루어지지 않은 건에 대하여 “매입” 요청을 거절할 수 있습니다. 다만, 자동 “매입”이 이루어지는 신용카드의 경우에는 그러하지 아니합니다.

③ “회사”의 “결제기관”에 대한 “매입” 청구의 주기는 “결제기관”의 지급주기에 따라 변경될 수 있습니다.

제 26 조 (대금정산)
① “회사”는 “서비스”를 통해 발생한 “거래승인” 건 중 “회사”가 “결제기관” 등으로부터 대금을 지급받은 “거래승인” 건을 대상으로 “월 지급한도액” 내에서 “대금정산”을 하며, 그 구체적인 기준은 상점관리자 또는 별도 서비스 “수수료”율 표에 명시되거나 별도 합의한 바와 같습니다.

② “회사”는 “고객사”가 “상점관리자” 등을 통하여 결제 및 “대금정산” 내역을 확인할 수 있도록 지원하여야 하며, “회사”와 “고객사”가 확인한 내역이 서로 상이할 경우 상호 보유한 자료를 비교하여 정산금액을 합의할 수 있습니다. “고객사”와 “회사”간 이견이 상호 협의로 해결되지 않을 경우에는, “결제기관”에서 제공하는 자료 등을 기준으로 실제 내역을 확인하여 정산금액을 산정하기로 합니다.

③ 이 약관에서 언급된 지급일이 토요일, 공휴일인 경우 각각 그 직후에 돌아오는 첫 번째 영업일을 의미하는 것으로 봅니다.

④ “회사”와 “고객사”는 “대금정산”과 관련하여 과오납이 있음을 발견한 때에는 이를 지체 없이 상대방에게 통지하고 재정산해야 합니다.

⑤ “회사”의 “대금정산”의 의무는 이용계약이 해지 또는 종료되더라도 정산대금이 존재하는 한 계속되는 것으로 봅니다.

⑥ “대금정산”시 “회사”는 정산대금에서 “고객사”로부터 지급받을 “수수료”를 상계한 후 그 잔액을 “고객사”에게 지급합니다.

⑦ “대금정산” 후 거래취소 및 “고객사”의 기타사유로 인해 차감금액이 발생한 경우, “회사”는 “고객사”의 차기 정산금액에서 해당 금액을 차감하여 지급합니다. 단, “회사”가 필요하다고 판단하는 경우, 당기 정산금액에서 해당 금액을 차감한 뒤 지급할 수 있습니다. 해당 차감금액이 차기 또는 당기 정산금액보다 클 경우, “회사”는 당해 정산금액을 “고객사”에 지급하지 않고, 아울러 “고객사”는 해당 차감금액에서 당해 정산금액을 감한 나머지 금액을 “회사”의 지정은행계좌로 5영업일 이내에 입금합니다.

⑧ “회사”가 본 계약에 따라 “고객사”에게 지급하는 모든 금액은, 해당 금액이 0원을 초과될 경우에만 지급되며, 정산결과 마이너스(-) 금액인 경우에는, 차기 정산대금에서 해당 금액만큼 차감한 후 지급됩니다. 이 경우 “회사”는 “고객사”에게 차감 사유 및 내역을 고지합니다.

⑨ “고객사”가 정산대금을 지급받은 후 취소 금액 발생시 “회사”가 차기 정산금액에서 차감할 금액이 없는 경우 “고객사”는 “회사”로부터 취소 금액에 대한 입금요청을 받은 7일 이내에 “회사”에 해당금액을 지급하여야 하며, “고객사”는 “회사”에 대하여 청구할 결제대금채권 이외의 채권으로 취소금액 지급채무와 상계할 수 없습니다.

⑩ “고객사”가 “대금정산” 관련 계좌를 변경하고자 할 때는 7일전 서면으로 “회사”와 협의를 진행해야 합니다. 협의 미진행으로 인해 발생한 손해에 대하여 “회사”는 어떠한 책임도 부담하지 않습니다.

⑪ “고객사”가 “회사”의 “서비스”를 이용하여 발생한 정산대금을 제3자에게 양도하고자 하는 경우에는 “회사”의 동의를 받아야 하며, 동의 없는 채권양도 행위는 “회사” 에게 대항할 수 없습니다.

⑫ “회사”가 “결제기관”의 사유로 정산대금의 입금이 지연 또는 불가능한 경우에 “고객사”는 “회사”에게 책임을 물을 수 없습니다.

제 27 조 (지급보류)
① 다음 각 호의 어느 하나에 해당하는 사유가 발생하는 경우 “회사”는 정산대금의 일부 또는 전부의 지급을 보류할 수 있으며, 정산대금의 지급보류시 “고객사”에게 그 사실을 통지하여야 합니다.

“서비스”를 이용하여 현금할인 및 재판매 등의 행위를 한 경우
“고객사”가 회원제, 다단계, 상품권, 선불제, 전표유통 등의 사업을 불법적으로 영위하거나 그 사업의 결과, 장래 거래 취소의 우려가 있는 경우
“이용자”가 본인 미사용 또는 “상품” 미배송 등의 이의를 제기한 경우
“고객사”의 “매입” 요청내역이 “결제기관”의 지급내역과 상이한 경우
“고객사”가 약관에서 정한 손해배상 및 담보제공을 이행하지 아니한 경우
“고객사”의 정산예정금액의 비정상적 증대 또는 감소, 정산된 “이용자”의 거래가 민원, 이의제기 등으로 취소될 개연성이 있는 경우
“고객사”가 제3자로부터 보전처분(가압류, 가처분 등) 또는 강제집행 등을 받는 경우
“고객사”가 “서비스” 이용을 중단하고자 할 때 “회사”가 “고객사” 에게 지급할 정산대금에 대해 “이용자”의 취소 및 민원제기 등을 대비하여 일정 금액을 보류해야 하는 경우
정산금액이 월 지급 한도액을 초과하는 경우
이용계약 무효 사유가 존재하거나 이용신청에 대한 “회사”의 승낙이 이루어지기 전 정산대금이 발생한 경우
“비정상거래”로 확인되거나 의심되는 경우
“고객사”가 이 약관, 관련 법령, “회사”의 정책을 위반하거나 위반한 것으로 의심되는 경우
② 본 조 또는 본 계약에 따라 지급보류 된 정산대금은 보류 3달 후 전항 각 호의 사유 해결 여부 또는 지급보류된 정산대금에 상응하는 담보의 추가 제공 등에 따라 차감 후 "고객사"에게 분할 지급합니다.

③ 제1항 제10호의 경우 기 발생한 정산대금에 관하여는 “수수료” 상당의 비용이 발생할 수 있으며, “회사”는 전항에 따라 “고객사”에 지급되어야 하는 정산대금에서 상기 비용 및 손해배상액을 상계할 수 있습니다.

④ 제1항의 정산대금이 이미 "고객사"에게 지급된 경우 "회사"는 "고객사"에 지급할 예정인 차기 정산대금의 지급을 보류할 수 있습니다.

⑤ 지급보류 된 정산대금이 지급보류 사유의 해소 또는 지급보류된 정산대금에 상응하는 담보의 추가 제공 등의 사유로 “고객사”에게 지급될 경우 특별한 사정이 없는 한 지급보류 된 정산대금의 원금만 지급되며, “회사”는 고의, 중과실이 없는 한 지급보류로 인한 손해배상책임이 면제됩니다.

제 28 조 (비정상거래의 처리)
① “회사”가 “비정상거래”로 확인 또는 의심되는 거래에 대한 취소를 요청하는 경우 “고객사”는 즉시 취소 처리를 진행해야 하며, “고객사”의 처리가 영업일 7일이 경과되도록 지연되는 경우 “회사”가 이를 취소할 수 있습니다.

② “비정상거래”로 인하여 “회사”에 손해가 발생한 경우 “고객사”는 “회사”가 지정한 방법에 따라 “회사”에 손해를 배상해야 합니다.

③ “비정상거래” 등을 포함한 “이용자”와의 “상품” 거래와 관련한 모든 미회수 채권에 대한 회수 책임은 “고객사”에게 있고, 이로 인하여 “회사”에게 손해가 발생할 경우에는 이를 배상하여야 합니다.

제 29 조 (거래취소 및 환불)
① “고객사”는 원칙적으로 “이용자”가 “회사”가 제공하는 “서비스”를 통해 “고객사”의 “쇼핑몰”에서 물품 등을 구입한 최초 거래(이하 “원 거래”)으로 에 대해 거래일로부터 1년 내에 거래취소 및 환불 요청이 가능합니다. 단, 위 환불 기관이 초과된 건에 대한 환불 요청은 발생 건 별로 양 당사자간 협의에 의하여 정합니다.

② 이 약관에 따라 “고객사”에 거래취소 등 처리 의무가 있는 거래에 대해 “고객사”가 이를 7 영업일 이내에 처리하지 않을 경우, “결제기관” 혹은 “회사”는 이를 직접 처리하고 그 결과를 “고객사”에 통지할 수 있습니다.

③ “결제기관” 또는 “회사”가 직접 취소 처리한 거래 건이 발생한 경우, “회사”는 “이용자”에게 해당 결제금액을 환불합니다. 해당 건이 “회사”와 “고객사” 간 이미 정산된 경우에 “회사”는 우선 “이용자”에게 해당 거래대금을 환불하고, 차기 정산대금에서 해당 대금과 결제수수료를 합산한 금액을 차감합니다. 차감할 금액이 없을 경우 “회사”는 취소매입요청을 거부할 수 있으며, 이용계약이 해지된 후라도 해당 금액을 “고객사”에게 청구할 수 있으며 “고객사”는 “회사”의 청구일로부터 7영업일 이내에 “회사”에 청구금액을 지급해야 합니다.

④ 제33조의 계좌이체 거래에 대한 환불은 반드시 “회사”의 환불서비스를 이용하여야 하며, “회사”는 “이용자”가 계좌이체 서비스 이용 시 제공한 계좌로만 환불을 진행합니다.

⑤ 환불이 정상적으로 완료된 건은 일체의 수정 및 번복을 할 수 없습니다.

⑥ “고객사”의 요청으로 “회사”가 처리한 환불에 대한 모든 책임 및 “회사”가 제공하는 환불 기능을 이용하지 않아 발생하는 모든 책임은 “고객사”에 있습니다.

⑦ “고객사”는 “회사에”에 대한 환불 요청 전에 해당 건이 환불 대상에 적합한지 반드시 확인해야 하며, 사전에 “이용자”가 부당이득을 취할 수 없는 정책을 수립하고 “이용자” 동의를 받아야 합니다.

⑧ “고객사”는 환불을 위하여 “회사”가 요청하는 정보를 전달하여야 하며, “고객사”는 정보의 적합성을 보장하고, 해당 정보의 오류로 인하여 발생한 민원에 대해 “회사”는 일체의 책임을 지지 않습니다.

⑨ 제33조의 계좌이체 거래에 대한 환불 시, “고객사”는 안전한 환불기능 이용을 위해 환불비밀번호를 사용해야 하고, 최초 환불 비밀번호는 “고객사”의 사업자등록번호로 제공할 수 있습니다. 단, “고객사”는 “회사”가 제공하는 관리자메뉴에서 환불비밀번호를 변경할 수 있습니다. “고객사” 또는 “고객사”의 고용인의 환불 비밀번호 관리 소홀로 인해 발생한 모든 사고에 대해 “회사”는 일체의 책임을 지지 않습니다.

⑩ “회사”는 “고객사”의 환불신청을 접수 받은 경우 신속하고 정확하게 환불처리를 합니다. 단, “고객사” 또는 은행 등 “결제기관”의 시스템의 장애 등, “회사”의 귀책이 아닌 사유로 환불처리가 지연되거나 오류가 발생한 건에 대해, “고객사”는 “회사”에게 일체의 책임을 물을 수 없습니다.

⑪ “회사”는 “고객사”의 거래규모, 환불처리 규모, 결제수단의 특성 및 고객 민원수준 등을 고려하여 “고객사”의 월간 환불 가능 한도액을 지정할 수 있고, “고객사”의 고의, 과실 등에 의하여 환불과 관련한 사고가 발생한 경우 “회사”는 “고객사”에 환불기능의 제공을 중단하거나 기능의 제한을 할 수 있습니다. 단, 환불 가능 한도액은 양 당사자의 협의 또는 “고객사”의 담보(환불증거금)제출에 의해 조정이 가능합니다.

제6장 [결제수단별 서비스 규정(특칙)]
제 30 조 (신용카드 서비스)
① “회사”의 “서비스”를 이용하여 발생한 “고객사”의 할부거래는 “할부거래에 관한 법률”이 정한 바에 따릅니다.

② “화사”는 “고객사”에게 신용카드사에서 인정한 할부판매 개월 수를 제공하는 것을 원칙으로 합니다.

③ “고객사”가 할부판매 시 “이용자”에게 회원가입비(영업수당 제공을 통한 회원제 형태의 다단계 영업으로 물품을 판매하는 거래, 현실적으로 이행이 어렵고 민원제기 가능성이 많은 “상품”의 제공을 거래의 목적으로 하는 경우 포함)를 징구하는 경우에는 할부거래중지 또는 할부거래 개월 수를 제한할 수 있습니다.

④ “고객사”는 “이용자”로부터 할부 항변의 사유가 발생할 경우를 대비하여 “회사”가 정한 방법에 따라 담보를 제공하여야 합니다.

⑤ “고객사”가 신용카드 서비스 이용과 함께 신용카드사가 발행하는 신용카드 포인트 서비스도 이용할 경우 이용료는 서비스이용료 신청서 상의 신용카드 포인트 서비스 이용료에 따라 지급하기로 하되, 신용카드 포인트 서비스 이용료의 정산은 “고객사”의 판매대금 입금 시 “수수료”외에 추가로 서비스이용료 신청서 상에서 정한 “신용카드 포인트 이용료”를 추가하여 선 공제 하는 것을 원칙으로 합니다. “회사”와 “고객사”는 “프로모션”이 진행되는 경우, 다음 사항을 이행하기로 합니다.

양 당사자는 매월 상세한 “프로모션” 내용 및 분담 비용에 대해 협의하고, “회사”는 매월 “고객사”에게 협의내용을 전자문서, 전자우편, 공문 등의 방법(이하 “공문 등”이라 한다)으로 통지하고, “고객사”는 “회사”에게 협의내용에 관한 최종 동의 여부를 “공문 등”으로 통지합니다.
“회사”는 “고객사”에게 해당 “프로모션” 결과 데이터를 “프로모션” 시행 완료 후에 전달합니다. “고객사”는 전달받은 데이터를 근거로 “프로모션” 비용을 지급하는 것을 원칙으로 하며, 신용카드대금 결제 취소 데이터를 반영하기 위해 “회사”에 데이터 추출을 다시 요청하는 것은 허용하지 않습니다.
“고객사”는 프로모션 결과 데이터 전달일이 속한 월(M)의 익월(M+1) 25일까지 “회사”에게 프로모션 비용을 지급합니다.
“고객사”가 본 항 제3호 기한까지 “프로모션” 비용을 지급하지 않는 경우, “회사”는 익월(M+1) 30일 까지 “회사”가 “고객사”에게 지급해야하는 가맹점 정산대금에서 “프로모션” 비용을 공제할 수 있습니다.
“고객사”가 “회사”에 “프로모션” 비용 지급을 완료한 이후에 발생하는 취소 데이터에 대한 “프로모션” 비용은 환불되지 않습니다.
제 31 조 (해외신용카드 서비스 특칙)
① “회사”는 “해외신용카드” 소지자 본인에 의한 거래의 진위를 확인 관련하여 별도의 시스템을 지원할 의무가 없습니다.

② 본 서비스와 관련하여 사용부인 등과 같은 민원이 발생한 경우 “회사”는 해당 카드사 또는 해당 민원인과의 중재가 불가능하므로 “해외신용카드” 발행사 또는 해당 카드 매입카드사로부터 확인된 사기결제 또는 도난 신용카드 등의 거래(이하 “사고결제 건”) 건의 정보를 “고객사”에게 제공하는 것으로 모든 의무를 다하며, 해당 거래 건에 대한 정상거래건의 입증의무는 전적으로 “고객사”가 부담합니다.

③ “회사”는 “해외신용카드” 관련기관으로부터 “사고결제 건”으로 판명되어 “고객사”의 쇼핑몰에서 발생한 결제대금의 지급이 이루어지지 않은 경우 “고객사”에 해당 정산금액을 지급하지 아니하며, 대금 정산 이후에 발생하는 “해외신용카드” 사고 건에 대하여는 해당 금액만큼을 차기 정산금액에서 차감하여 지급합니다.

④ “고객사”는 “회사”가 지정하는 방식으로 자동매입을 신청하여야 하며, 이를 지키지 않아 발생되는 손해에 대하여 “회사”는 일체의 책임을 부담하지 않습니다.

⑤ “고객사”는 환차익(손) 발생가능성을 “이용자”에게 사전 고지를 하여야 하며 환차손익으로 인한 손해에 대하여 “회사”는 일체의 책임을 부담하지 않습니다.

⑥ 환차익(손)의 기준이 되는 환율은 “회사”가 지정한 금융기관의 환율표로 합니다.

⑦ “고객사” 이용자의 이의제기가 빈번히 발생하는 경우 “고객사”의 카드거래액의 전부 또는 일부를 “회사”가 대금지급보류를 통하여 “고객사”에 대한 “회사”의 특약담보금으로 처리할 수 있으며, 만약 해당 매출이 “고객사”에게 기 지급된 경우에는 기 정산금액 분 만큼 차기 정산금액 분에서 차감합니다.

⑧ “회사”는 “고객사”의 판매신용도 및 신용판매실적, 민원접수 실적 등을 고려하여 본 조 제7항의 특약담보금의 증액 또는 새로운 담보를 추가 요구할 수 있으며 “고객사”가 이를 이행하지 않는 경우 본 계약을 해지할 수 있습니다.

⑨ 제7항 및 제8항의 특약담보금은 약관의 담보금과 별도로 요구할 수 있습니다.

⑩ 환불(Chargeback)은 신용카드 사용자의 “해외신용카드” 발행사로부터 이뤄지며 카드 사용자가 'notice of dispute(환불 요청)'을 신청할 시에 적용된다. “회사”는 “고객사”를 보호하기 위해 구매 건에 대한 별도 정보를 요청할 수 있다. 단, “사고결제건”으로도 발생되는 환불은 즉시 처리됩니다.

⑪ “이용자”의 이의신청으로 “회사”에 환불요청이 접수되면 “회사”는 “고객사”에게 추가정보를 요청(RFI = Request For Information)을 하고 RFI가 접수된 거래에 대해서 “고객사”는 상품을 배송 시 배송송장(Delivery Confirmation), 구매내역 또는 고객 정보 등을 “회사”에게 보내며 “회사”는 위 전송 받은 내용을 카드사에 전달하여 사고결제가 아님을 증명하기 위해 최선을 다한다. 이러한 절차를 통해서도 카드소유자에게 본인이 승인한 거래임을 입증할 수 없을 시에는 “사고결제 건”으로 처리합니다다.

⑫ “사고결제 건”이 발생하면 “고객사”는 물품 거래대금 전액의 강제 환불조치를 당하게 되며, 전액 환불 및 결제승인 당시에 적용된 서비스 수수료까지 부담하게 된다. 또한 정당한 거래임을 증명하기 위해 Arbitration(중재위원회)까지 중재가 재기되어 정당한 거래가 아님이 확정되면 “해외신용카드” 발행사 규정에 의해 페널티(벌금) $500.00/건이 부과됩니다.

⑬ “해외신용카드” 비인증결제(“해외신용카드” 발행사가 인정하는 인증절차(3-D SECURE 등) 없이 카드번호, 유효기간 입력만으로 결제)의 경우, “사고결제 건”이 발생하여 “고객사”가 환불(Chargeback)조치를 당하게 되면 “해외신용카드” 발행사 정책에 따라 “고객사”에게 Fraud Chargeback 건당 수수료가 부과될 수 있습니다. (VISA의 경우 Fraud Chargeback 건당 $5 부과) 이 경우 “회사”는 차기 정산대금에서 해당 금액을 차감한 후 지급할 수 있습니다.

제 32 조 (신용카드 ARS 서비스 특칙)
① “고객사”는 “회사”에 대한 별도 신청을 통하여, ARS 전화 회선망을 이용하여 신용카드 승인을 얻는 방식으로 신용카드 결제를 할 수 있도록 하는 “회사”의 서비스(이하 “신용카드 ARS 서비스”)를 이용할 수 있습니다.

② “고객사”는 “신용카드 ARS 서비스” 이용에 대한 대가로, 별도 “수수료”를 “회사”에게 지급하여야 하며, 해당 “수수료” 및 정산주기는 “신청서”에 따릅니다.

③ “고객사”는 제2항의 이용 “수수료”와 별개로 “신용카드 ARS 서비스” 운영에 있어 이용되는 SMS수수료 및 ARS운영 수수료를 “회사”에 지급하여야 합니다.

④ 기타 “고객사”와 “회사”는 “신용카드 ARS 서비스”와 관련하여 다음 사항을 약정합니다.

“고객사”는 신용카드사에서 지정한 업종(여행, 꽃배달 등) 이외의 사업에 “신용카드 ARS 서비스”를 사용할 경우, “회사”는 이를 즉각 중단할 수 있습니다.
“회사”는 “신용카드 ARS 서비스”의 변동이 있을 시 해당 “서비스” 관련 화면에 전체 공지함을 원칙으로 합니다.
“회사”는 “신용카드 ARS 서비스” 도중 전화회선의 장애가 발생하여 ARS 연결이 되지 않는 경우는 별도 통보를 하지 않을 수 있습니다.
원칙적으로 국내 신용카드 결제를 지원하며, 해외카드 및 일부 계열카드는 이용이 불가할 수 있습니다.
신용카드사 정책이 변경될 경우 “회사”는 “고객사”에게 즉시 이를 통보합니다.
⑤ “신용카드 ARS서비스”와 관련하여 이 계약의 다른 조항과 본 조항이 상충될 경우, 본 조항이 우선 적용됩니다.

제 33 조 계좌이체 서비스 특칙
① 실시간 계좌이체

실시간 계좌이체 서비스는 금융결제원이 제공하는 금융기관 공동의 '뱅크페이 PG서비스'를 활용하여 제공됩니다.
실시간 계좌이체 서비스를 이용하여 성립된 거래에 대하여는 “회사”가 제공하는 서비스 시스템을 이용하여 취소가 가능합니다. 당일 전체 취소에 한하여는 취소관련 지불수단 "수수료"를 고객사에 환급하되, 당일 부분 취소 및 당일 취소 외 익일 이후 취소 관련 지불수단 “수수료”는 “고객사”의 부담으로 하고, “회사”는 이를 “고객사”에게 환급하지 않습니다.
이 계약 제29조 제1항의 정함에도 불구하고, 실시간 계좌이체 서비스를 이용하여 “이용자”가 “고객사”의 “쇼핑몰”에서 물품 등을 구입한 거래에 대해서는 거래일로부터 180일 내에 거래취소 및 환불 요청이 가능합니다.
기타 금융결제원 제공 서비스 관련 제반 사항은 금융결제원의 '뱅크페이 PG서비스 가맹점 약관'의 내용이 적용됩니다.
② 무통장입금(가상계좌)

무통장입금(가상계좌) 서비스의 제공 주체는 전국은행연합회 소속의 은행 및 우체국 등을 포함합니다. 이는 “회사”가 운영하는 인터넷 사이트, 이메일 등을 통하여 별도 고지합니다.
무통장입금(가상계좌) 서비스를 이용하여 성립된 거래에 대하여는 “회사”가 제공하는 서비스 시스템을 이용하여 취소할 수 없습니다.
“고객사”가 가상계좌 환불서비스를 신청하고 사용할 경우, 본 조 제2항 제2호에도 불구하고 “회사”는 “이용자” 계좌로 환불을 할 수 있으며, 이 때 발생되는 지불수단 “수수료” 및 환불 “수수료”는 “고객사”(또는 취소 요청 금액에 따라 “이용자”)가 부담합니다.
③ 본 조에서 정하는 각 서비스의 제공 시간은 금융결제원 계좌이체 서비스 제공 시간이나 해당 은행의 인터넷뱅킹 서비스 제공시간 또는 개별 서비스 제공처의 서비스 제공시간에 한합니다.

제 34 조 (휴대폰 및 전화결제 서비스 특칙)
① 휴대폰 또는 전화결제를 이용한 정산대금은 “회사”가 해당 “결제기관”으로부터 “고객사”의 “상품” 제공월(이하 M월이라 합니다) 결제금액을 M+2월말에 지급받아 “수수료”를 공제한 후 거래대금입금구좌신고서에 등록된 입금계좌로 M+3월 5영업일 이내에 “고객사”에게 지급하며 매월 추가 입금분에 대한 지급 또한 그러합니다. 단, “결제기관”의 사정 및 재판매제공사의 사정에 따라 ”대금정산”이 지연될 수 있습니다.

② 본 조 1항의 정산조건과 달리 적용할 경우 별도의 특약서를 작성합니다.

③ 이동통신사가 “이용자”에게 이미 대금 청구한 건에 대해서 “고객사”가 거래를 취소함으로써 발생하는 환불 책임은 “고객사”에게 있습니다.

④ “고객사”는 “회사”와의 계약 체결 시 “고객사”가 “이용자”에게 제공하는 “상품”의 유형(디지털 또는 실물)을 명확하게 등록하여야 하며, 실제 “이용자”에게 제공하는 “상품” 또는 서비스의 유형이 디지털에 해당함에도 불구하고 실물 등록을 요청하여 거래를 발생시킨 경우 “회사”는 다음 각 호의 조치를 취할 수 있고, “고객사”는 이에 대한 일체의 이의를 제기할 수 없습니다.

상기 거래로 인하여 “고객사”가 취득한 “수수료”의 즉시 반환 요청 또는 상계
상기 거래로 발생된 모든 거래의 취소 또는 “수수료”의 인상(병행 가능)
전 각 호의 조치에 불응하는 경우 이용계약 즉시 해지 및 손해배상 청구
⑤ 제29조에도 불구하고, 본 조 제3항의 경우가 아닌 휴대폰 결제의 경우에는, M월 거래 발생 건에 대한 취소는 M월 당월 내에서만 취소 처리가 가능합니다.

제 35 조 (휴대폰 선지급 정산 서비스 특칙)
① “고객사”는 “이용자”에 대한 별도 신청을 통하여, “서비스”를 이용하여 이루어진 정상적인 휴대폰 거래의 지불대금(승인대금에서 취소금액을 차감)에서 약정된 “수수료” 등을 공제한 금액을 이동통신사를 통해 “회사”에게 지급되기 전 “회사” 자신 또는 휴대폰 중계업체의 자금으로 “고객사”에게 미리 지급하는 “회사”의 서비스(이하 “휴대폰 선정산 지급서비스”)를 제공합니다.

② “회사”가 “휴대폰 선정산 지급 서비스”를 통해 “고객사”에게 지급하는 정산대금의 주기 및 “고객사”가 “선정산 지급 서비스”를 제공받은 대가로 “회사”에게 지급하는 “수수료”는 별도 신청서에 따릅니다.

③ “휴대폰 선지급 정산 서비스”와 관련하여 이 약관의 다른 조항과 본 조항이 상충될 경우, 본 조항이 우선 적용됩니다.

④ “휴대폰 선지급 정산 서비스”를 이용하기 위한 특약은 다음 각 호와 같습니다.

“고객사”는 “휴대폰 선정산 지급 서비스”를 제공받기 위해 “이용자”에 대하여 가지는 대금청구권을 “회사”에 양도하기로 하고, “이용자”에 대한 채권양도 통지권한 일체를 “회사”에 위임합니다.
“고객사”는 이 특약 체결시까지 대금청구권을 제3자에게 양도한 사실이 없고, 대금청구권이 제3자에 의하여 압류 또는 가압류된 사실도 없으며, “이용자”로부터 회수 가능하고, “회사”가 “고객사”로부터 양수한 채권을 이용자에게 행사하는데 아무런 하자가 없음을 진술, 확인하며 그 내용의 진정성을 보증합니다.
전항의 확인내용이 허위임이 밝혀진 경우 “고객사”는 그 즉시 회사에 해당 양도대금 반환 또는 담보를 제공하여야 합니다.
제 36 조 (상품권 결제서비스 특칙)
① 상품권 결제서비스의 정산절차는 다음과 같습니다.

“고객사”는 "이용자"가 상품권의 금액 또는 수량의 범위 내에서 물품 등의 제공을 요구하는 경우 그 즉시 “이용자”에게 “상품”의 배송 또는 제공을 완료하여야 하며, "회사"의 별도 요청이 있는 경우 관련 증빙서류를 “회사”에 제출하여야 합니다.
“회사”는 거래월(이하 ‘M월’이라 합니다) 거래내역 중 “결제기관”으로부터의 입금이 확인된 거래에 대해 해당 정산대금을 M+1월 마지막 영업일에 “수수료”를 공제한 후 거래대금입금구좌신고서에 등록된 입금계좌로 정산지급 합니다.
“회사”는 “고객사”에게 ”수수료”와 부가세가 기재된 세금계산서를 M+1월 말 일자로 기재하여 발송합니다
② “회사”는 천재지변, 비상사태, 그 밖의 부득이한 사유(발행사의 시스템 장애 등)로 상품권 결제서비스를 중단하여야 할 경우에는 사전 통보 없이 상품권 결제서비스를 일시 중단하거나 정지할 수 있습니다.

③ 상품권 환불에 대한 최종 책임은 “고객사”에게 있습니다.

④ 기타 상품권 결제서비스 이용관련 제반 사항은 각 상품권 또는 선불카드 발행사의 이용약관에 따라 적용합니다.

제 37 조 (본인확인서비스 특칙)
① 본인확인서비스 관련 사항은 다음과 같습니다.

“고객사”는 “고객사” 또는 “고객사”의 고객이 “이용자”에게 유선 인터넷 등을 통하여 제공하는 각종 서비스의 “이용자” 확인절차와 관련하여 “이용자”가 “고객사” 또는 “회사”에게 제공한 생년월일과 휴대폰번호의 확인을 “회사”에게 요청하고, “회사”는 “고객사”가 확인을 요청한 생년월일이 해당 휴대폰번호에 대한 “회사”의 전산자료와 일치하는지 여부를 확인하여, 일치여부와 “이용자”가 제공한 정보를 “고객사”에 전달합니다.
제1항에 따라 “회사”가 제공하는 “서비스”는 해당 휴대폰번호의 개통 시 또는 그 이후에 “회사”가 “이용자”로부터 제공받은 자료에 따른 것이며, “이용자”가 해당 휴대폰번호의 실 사용자인지 여부, 생년월일 및 “이용자”가 “회사”에게 제공한 자료의 진위 여부 등 다른 사실에 대한 확인이나 보장은 일체 포함하지 아니합니다.
“고객사”는 반드시 “이용자”에게 휴대폰번호 및 생년월일 등 개인정보가 본 서비스의 제공을 위하여 “회사”에게 제공됨을 사전 고지하고 이에 대한 “이용자”의 동의를 받아야 하며, “회사”가 요청할 경우에는 그 증빙서류를 제출하여야 합니다.
“회사”가 제공하는 본 서비스는 “고객사”가 확인 요청한 시점의 “이용자”에 대한 정보의 확인으로, 요청 시점 이후의 변동으로 인한 정보의 불일치 등 오류에 대해서는 “회사”가 책임지지 않습니다.
② 시스템 개발 및 운영 등은 다음 각 호와 같습니다.

양 당사자는 필요한 시스템을 각자의 비용과 책임 하에 개발 • 구축하여야 하며, 그 운영에 대하여 각자 책임을 부담합니다.
양 당자사자는 신뢰성 있는 서비스의 제공을 위해 쌍방 시스템이 직접 접속되는 방식으로 시스템을 구축 • 운영하여야 합니다.
“회사”와 “고객사”는 서비스를 위한 시스템을 구축하고, 최적의 운용상태를 유지하도록 노력하여야 합니다.
시스템의 오류로 인하여 본인확인서비스가 오작동한 경우, 그 오류의 원인을 제공한 당사자가 그로 인한 이용자의 손해에 대한 배상 등에 관한 책임을 부담하며, 그 오류의 원인을 제공한 당사자가 밝혀 지지 아니하는 경우에는 “회사”와 “고객사”가 책임을 분담합니다.
제 38 조 (간편결제 및 전자지갑 서비스 특칙)
① “고객사”는 “회사” 또는 “회사”의 계열사가 제공하는 간편결제 및 전자지급 서비스를 별도 신청서를 통해 신청할 수 있습니다.

② 간편결제 및 전자지갑 서비스의 정산주기 및 “수수료”는 별도 신청서에 따릅니다.

③ 간편결제 및 전자지갑를 통하여 발생한 거래의 취소는 이 약관상 취소 방법과 동일합니다. 단, 거래의 원 “결제수단”이 신용카드 또는 휴대폰 결제 외인 경우에는, 당일 외 익일 이후 취소 발생 시 거래 “수수료”를 “고객사”의 부담으로 하며, “회사”는 이를 “고객사”에게 환급하지 않습니다.

제 39 조 (매매보호(에스크로)서비스 특칙)
① “고객사”가 별도 신청한 경우, “회사”는 “이용자”가 “쇼핑몰”에서 결제한 대금을 “회사”가 예치한 후, 구매확인된 거래에 대해서만 “고객사”에게 대금을 지급하는 결제대금 예치 서비스(이하 “에스크로서비스”)를 제공합니다.

② “에스크로서비스” 이용이 가능한 “결제수단”은 별도 신청서에 따릅니다.

③ “에스크로서비스” 관련하여 이용되는 주요 용어의 정의는 아래 각 호에 따릅니다.

배송등록: “고객사”가 판매한 “상품”의 배송정보(택배사, 송장번호, 수신인, 수신주소, 수신인전화번호, 발신인, 발신주소, 발신전화번호)를 “회사”가 제공한 시스템에 등록하는 행위 및 상태
배송완료: “회사”가 “회사”와 제휴된 배송중계업체(이하 “배송중계업체”라 한다)를 통해 “고객사”의 “상품”에 대한 배송완료 정보를 수신한 상태. 또는 “고객사”가 “상품”을 배송등록 한 후 최대 배송일이 지난 상태
구매확인: “이용자”가 배송된 상품에 대해 “구매”의 의사를 “회사”에게 통보한 상태 또는 배송 완료 후 3 영업일 이내에 “회사”에게 구매거절 의사를 표시하지 않은 상태
거래취소: “고객사”의 요청으로 거래를 취소한 상태(단, 가상계좌는 입금이 완료되고 취소한 경우)
구매거절: “이용자”가 배송된 “상품”에 대해 “구매거부”의 의사를 “회사”에게 통보한 상태
거절확인: “고객사”가 “이용자”의 구매거절 의사를 수용하여 해당 거래의 승인 취소를 확정하는 행위 및 상태
최대배송일: “회사”가 “배송중계업체”를 통해 “고객사”가 배송한 “상품”의 배송상태 수신이 불가능한 거래에 대해서 배송완료로 추정하는 기간으로, 구체적 기간은 별도 신청서에 따른다
④ “에스크로서비스”의 정산은 다음 각 호를 따릅니다.

“고객사”는 “에스크로서비스”를 통해 발생된 거래에 대해 “회사”가 제공하는 시스템을 통해 배송등록을 해야 하며, 배송등록 된 거래가 구매확인이 된 건에 대해서만 정산지급이 가능합니다.
제1호에도 불구하고, 배송 완료되었으나 “이용자”의 구매확인 내역이 “회사”에게 수신되지 않은 거래는 별도 신청서에 따른 일정기간이 경과하면 구매확인 된 것으로 간주하고, 정산지급 합니다.
제1호에도 불구하고, “회사”에게 “배송중계업체”를 통한 배송완료 상태 수신이 불가한 거래가 “이용자”의 구매확인 통보가 없을 경우, 별도 “신청서”에 따른 최대 배송일이 경과하면 배송완료로 간주하고, 정산대금을 지급합니다.
“에스크로서비스”의 정산 지급에 있어서는 별도 “신청서”에 따릅니다.
“에스크로서비스”와 관련하여 “회사”는 제반 “수수료”에 대해 전자세금계산서를 “고객사”에게 월 1회 (지급 후 익월 10일 이내) 발급, 배부합니다.
⑤ “에스크로서비스”와 관련하여 취소와 환불은 다음 각 호의 내용을 따릅니다.

“고객사”는 거래 발생일로부터 원 “결제수단”의 취소 기한 내까지 취소를 할 수 있습니다(단, 네이버페이(체크아웃) 등 일부 간편결제 수단의 경우, 해당 간편결제사 정책에 따라 취소 정책 상이).
가상계좌의 경우, 입금이 완료된 거래 중 별도 가상계좌 환불 서비스를 신청하고 사용중인 상점에 한해서 거래취소가 가능합니다.
거래취소 및 거절확인 건에 대해 “회사”는 해당 거래의 승인을 취소하며, 가상계좌의 경우 “회사”가 “이용자”에게 익 영업일에 환불 처리합니다.
취소 발생 시 “수수료” 환급방법은 원 결제수단과 동일합니다.
“이용자”의 구매거절 된 거래건에 대해서 “고객사”는 “이용자”와의 분쟁해결 의무가 있습니다.
⑥ “회사”가 “고객사”에게 “에스크로서비스”를 제공한 대가로, “고객사”는 그에 대한 “수수료”를 “회사”에게 지급하여야 하며, 해당 이용 “수수료” 및 정산주기는 별도 신청서에 따릅니다.

⑦ “에스크로서비스” 와 관련하여 이 약관의 다른 조항과 본 조항이 상충될 경우, 본 조항이 우선 적용됩니다.

제 40 조 (자동결제서비스 특칙)
① “고객사”가 별도 신청한 경우, “회사”는 “이용자”가 “쇼핑몰”에서 휴대폰 또는 신용카드를 이용하여 “이용자”가 “고객사”에게 정기 또는 비정기적 과금을 자동으로 결제하는 데 필요한 “자동결제 서비스”를 제공합니다.

② “자동결제 서비스” 관련하여 이용되는 주요 용어의 정의는 아래 각 호에 따릅니다.

“정기결제”라 함은 “고객사”가 “이용자”에게 물품이나 용역(「공공기관의 운영에 관한 법률」에 따른 공공기관이 제공하는 물품이나 용역, 「전기통신사업법」에 따른 전기통신사업자가 제공하는 전기통신역무 및 그 밖에 금융위원회가 정하여 고시하는 물품이나 용역은 제외)을 판매 또는 제공하고 이에 대해 “이용자”가 정기적으로 약정 금액을 “고객사”에 결제하면 “고객사”는 “회사”를 통해 정기적으로 해당 금액을 지불받는 방식을 말합니다.
“정기결제 고객사”란 “회사”와 정기결제계약을 체결한 “고객사”를 말합니다.
“자동결제 서비스”라 함은 “이용자”가 회원제 서비스 등에 있어 제1호의 정기결제를 하는 경우 또는 비정기적으로 약정 금액을 “고객사”에 결제하여야 하는 경우, 최초 “이용자”의 정기 또는 비정기적 결제에 대한 동의 및 휴대폰 인증 또는 신용카드 관련 “이용자” 정보를 통해 이동통신사나 신용카드사와 “이용자” 본인 확인을 거친 후 “회사”는 “이용자”를 인식할 수 있는 고유번호(이하 “인증키”라 함)를 “고객사”에게 제공하고, “고객사”가 “인증키”를 이용하여 모바일 및 유선전화 자동결제 및 신용카드 자동결제를 요청 시 이를 지원하는 “회사”의 서비스를 말합니다.
“이용자”라 함은 “고객사”가 제공한 자동결제 약관 및 “통신과금서비스 이용약관” 등의 확인을 통해 “인증키”생성에 동의한 자로서 결제수단(휴대폰, 유선전화, 신용카드 등)의 적법한 명의 소유자를 말합니다.
“인증키”라 함은 최초 인증(또는 결제)을 통해 “회사”가 “고객사”에게 제공하는 “자동결제 서비스”를 이용하기 위한 “이용자”의 결제정보를 포함한 고유번호를 말합니다.
“대표가맹 Case”라 함은 신용카드를 이용한 “자동결제서비스”의 제공 관련하여 “고객사”가 “회사”의 신용카드 대표가맹점번호를 대여하여 사용하는 경우를 말합니다.
“자체가맹 Case”라 함은 신용카드를 이용한 “자동결제서비스”의 제공 관련하여 “고객사”가 직접 신용카드사와 가맹점계약을 체결하여 부여 받은 가맹점번호를 사용하는 경우를 말합니다.
③ 양 당사자는 “자동결제 서비스”의 정산 시기 및 방법에 대하여 아래 각 호에 정한 바에 따릅니다.

“회사”는 “자동결제 서비스”관련 정산대금의 지급 시 “고객사”가 “회사”에 지급하여야 하는 서비스이용신청서 상에 기재 자동결제 수수료에 대하여 결제대금에서 선 공제한 후 잔액을 본“약관”에서 정한 정산주기에 맞춰 “고객사”에게 지급합니다.
“회사”의 청구금액과 “고객사”의 청구금액 대사 결과가 일치하지 않는 경우 “회사”는 “회사”의 청구금액을 기준으로 선 지급하고, 양 사간 대사 후 과오납에 대해 정정하여 가감합니다.
정산주기의 변경은 별도 협의 후 추가/변경계약서를 작성하여 날인 후 적용하기로 합니다.
④ “고객사”는 “이용자”에 대하여 “자동결제 서비스” 제공 전 반드시 “쇼핑몰” 회원가입 약관과는 별도로 “자동결제 서비스” 관련 약관을 고지하여야 하며, 이 약관에 대한 “이용자”의 동의를 사전에 득하여야 한다. 이를 “고객사”가 위반 시 “고객사”의 “자동결제서비스” 제공과 관련한 “이용자”의 민원, 손해배상 청구 등 클레임 일체에 대해 “회사”는 책임을 지지 않습니다.

⑤ 여신전문금융업법 시행령 제6조의16 및 여신전문금융업 감독규정 제24조의14에 따라 “정기결제 고객사”는 다음 각 호의 내용을 준수하여야 합니다. 이를 “정기결제 고객사”가 위반 시 “정기결제”와 관련한 “이용자”의 민원, 손해배상 청구 등 클레임 일체에 대해 “회사”는 책임을 지지 않습니다.

“정기결제 고객사”는 “이용자”에게 청구할 예정인 정기결제 금액이 변경되거나 유료로 전환되는 경우 다음 각 목의 사항을 대금결제 승인 요청이 이루어지기 7일 전까지 “이용자”에게 “이용자”의 동의를 얻은 고지 수단(서면, 전화, 전자우편, 휴대폰 메시지, 메신저, 팩스, 그 밖의 이에 준하는 수단)으로 미리 고지하여야 합니다. 가. 거래내용 나. 결제금액 및 대금 결제일 다. 유료전환 또는 결제금액 변경 일정 라. 환불 등의 거래조건 마. 거래조건을 “이용자”에게 불리하게 변경하는 경우 등 계약의 해제·해지 사유
“정기결제 고객사”는 정규 영업시간 외에도 “이용자”가 정기결제 철회, 취소, 해지 등을 신청할 수 있도록 다음 각 목 중 하나 이상의 방식을 운영하여야 합니다. 가. 인터넷 사이트 나. 모바일 앱 다. 전화, 휴대폰 메시지, 메신저 중 하나 이상을 통한 고객상담 라. 그 밖에 가목부터 다목까지에 준하는 수단
“정기결제 고객사”는 정기결제 철회, 취소, 해지에 따른 환불대금을 다음 각 목에 따른 방법으로 환불하여야 하며, 환불 방법을 해당 정기결제 서비스에서만 사용할 수 있는 상품권·캐시·포인트 등으로 제한하는 등 “이용자”의 선택권을 부당하게 제한하지 아니하여야 합니다. 가. 관련 법령 또는 여신금융협회에서 정한 신용카드 가맹점 표준약관(이하 “표준약관”) 등에 따라 이용일수 또는 이용회차에 비례하여 공정한 환불가격을 산정가능한 경우: 이용일수 또는 이용회차에 비례한 금액을 공제한 금액. 다만, 산정의 근거가 된 법령 또는 표준약관에 이와 다른 규정이 있는 경우에는 이에 따릅니다. 나. 가목 외의 경우: 관련 법령 또는 표준약관 등에서 인정하는 환불 금액 산정 방법
⑥ “자동결제 서비스”는 “이용자”가 제출한 이용자 정보가 이동통신사나 신용카드사가 보유한 정보와 일치함을 확인하여 이것이 일치할 경우 “이용자”의 고유번호인 “인증키”를 “회사”가 “고객사”에게 제공하는 것일 뿐, “이용자”가 해당 휴대폰, 유선전화 또는 신용카드 결제의 적법한 권리자임을 “회사”가 보증하는 것은 아니며, 또한 “인증키”가 정당한 권한이 있는 “이용자”임을 “회사”가 보증하는 것은 아니라는 점에 양사 의견을 같이하고 이에 대해 확인합니다.

⑦ “고객사”는 “이용자”에 대하여 적법한 청구권에 기한 결제 청구만을 요청할 수 있으며, 이에 반하는 청구로 인해 발생하는 민원(취소/환불, 철회 등)에 대한 모든 책임은 “고객사”가 부담하는 것으로 합니다.

제7장 [브랜드 페이 관련 규정(특칙)]
제41조 브랜드페이 특칙
① “고객사”가 별도 신청하는 경우 “회사”는 “고객사” 전용 간편결제서비스 및 제반 서비스인 “브랜드페이”를 “고객사”에 제공합니다.

② “브랜드페이”를 신청한 “고객사”에게는 제42조 내지 제50조가 특칙으로 적용됩니다.

제 42조 용어의 정의
“브랜드페이”와 관련하여 제7장[브랜드 페이 관련 규정(특칙)]에 적용되는 용어의 정의는 다음과 같습니다.

“브랜드페이”라 함은 “회사”가 “고개사”에게 제공하는 전자결제서비스 및 간편결제서비스로, “회사”가 “고객사”에게 제공하는 전자결제서비스와 간편결제서비스가 연동된 “회사”의 웹 기반 솔루션으로서, 별도 어플리케이션 설치 없이 고객사의 쇼핑몰에서 고객사의 회원이 결제수단(신용카드 및 계좌 등)을 등록하여 이용할 수 있도록 하는 “고객사” 전용 간편결제서비스 및 제반 서비스를 말합니다.
“회원”이라 함은 “브랜드페이” 관련 이용약관에 동의하고 “회사”에 결제수단정보를 제공하여 “브랜드페이”에 결수단을 등록한 자로서 “브랜드페이” 관련 이용약관에 따라 “회사”가 제공하는 브랜드페이 서비스를 정상적으로 이용할 수 있는 권한을 부여 받은 자를 말합니다.
“고객사”라 함은 “브랜드페이” 이용 신청서를 “회사”에 제출하여 그 내용에 따라 “브랜드페이”를 이용하는 고객사 또는 이용할 예정인 고객사를 말합니다.
그 외 본 조에서 정하지 않은 용어의 정의는 제2조 용어의 정의에 따르며, 본 조의 내용과 제2조의 내용이 상충될 경우 본 조가 우선 적용됩니다.
제43조 회사의 의무 등
① “회사”는 “고객사”의 “브랜드페이” 이용 신청에 따라 “고객사”의 “쇼핑몰” “회원”이 사용할 수 있도록 “브랜드페이” 서비스를 제공하여야 하며, 이를 위해 “고객사”의 이미지, 상표 등을 출처표시 없이 사용할 수 있습니다.

② “회사”는 “고객사”가 “브랜드페이”를 이용할 수 있도록 “고객사”의 “쇼핑몰” 운영시스템과 “회사”의 브랜드페이”를 연동하기 위한 가이드를 제공하여야 합니다.

③ “회사”는 “고객사”의 원활한 “브랜드페이”이용을 위하여 결제기관과의 관계에서 필요한 조치를 이행하여야 합니다.

④ “브랜드페이”에 적용되는 결제수단의 종류는 “회사”가 발행하거나 제휴한 것에 한합니다.

⑤ “고객사”와 “회사”는 “브랜드페이”를 위하여 각자 필요한 시스템을 각자의 비용과 책임 하에 개발, 구축하여야 하며, 그 운영에 대하여 각자 책임을 부담합니다.

제44조 고객사의 의무 등
① “고객사”는 “회원”이 “상품 등”을 구매함에 있어 원활히 “브랜드페이”를 이용할 수 있도록 “쇼핑몰”에 “브래드페이” 이용을 위한 배너 등을 타사의 유사 서비스와 비교하여 불리하지 않은 방식으로 노출하고, “회원”에게 브랜드페이 이용법 등을 안내하여야 합니다.

② “고객사”는 “회사”가 제공하는 가이드에 따라 “브랜드페이” 관련 시스템을 “고객사”의 시스템에 구축하여야 합니다. 이 경우 “회사”가 제공한 “브랜드페이”의 가이드와 다르게 구축할 경우 사전에 양사 별도 합의하에 진행하여야 합니다.

③ “고객사”와 “회사”는 “브랜드페이”를 위하여 각자 필요한 시스템을 각자의 비용과 책임 하에 개발, 구축하여야 하며, 그 운영에 대하여 각자 책임을 부담합니다.

④ “회원”이 “브랜드페이”에 등록된 결제수단을 사용하는 경우, “고객사”는 “회원”의 결제를 거부하거나, 다른 결제수단을 이용한 “회원”보다 가격, 서비스 등 거래조건을 불리하게 대우하지 않아야 합니다.

⑤ “고객사”는 “브랜드페이”가 연동될 “쇼핑몰”의 목록을 “회사”에 사전 제공하여야 하며, “회사”의 가이드에 따라 연동 업무를 이행하여야 합니다. 단, “회사”와 “브랜드페이 고객사”는 양사 별도 사전 협의하여 구체적인 연동 업무 이행 방식을 달리 정할 수 있습니다.

⑥ “고객사”는 본 계약에 정한 방법에 따라 결제수단 이용에 따른 결제수수료를 지급합니다.

⑦ “고객사”는 “브랜드페이”를 이용하는 “회원”이 “쇼핑몰”을 탈퇴하는 등 “브랜드페이”의 이용을 중단, 중지하는 등의 사유가 발생한 경우, “회사”에 이를 고지하여야 하며, “회원”이 “브랜드페이”를 이용하여 구매한 “상품 등”이 있는 경우 이에 대한 구매확정이 완료된 후 “쇼핑몰”을 탈퇴하는 “브랜드페이” 이용을 중단, 중지하도록 필요한 조치를 취하여야 합니다.

⑧ “고객사”는 “회사”가 원활한 “브랜드페이” 제공을 위하여 이행하거나 요청하는 사항에 대하여 관련 법령을 준수하는 범위 내에서 이에 응하여야 합니다.

⑨ “고객사”는 “브랜드페이” 도입과 종료 시 등 필요한 경우 “고객사”의 “회원”에 대한 고지 및 관련 민원 관리 등에 대한 책임, “상품 등”의 판매와 관련된 책임을 전적으로 부담합니다. “고객사”는 “회사”와의 계약 종료 등으로 “브랜드페이” 서비스가 종료되는 경우 “브랜드페이” 서비스 종료 시점 30일 전 “회원”에게 해당 사항을 공지하여야 합니다.

⑩ “고객사”는 “브랜드페이” 이용 종료 시점 6개월 전 서면으로 “회사”에게 고지하고, “고객사”의 “회원”들에게 서비스 종료를 사전에 양 사가 협의하는 기간 내에 공지하여 클레임이 없도록 관리하여야 합니다.

⑪ “고객사”는 본 계약기간 동안 “고객사”의 “쇼핑몰”에서 이용하는 고객사 전용 간편결제서비스로서 “브랜드페이”만을 단독으로 사용하여야 합니다. 추후 본 계약기간 동안 “고객사”가 전용 간편결제서비스로 “회사”가 제공하는 “브랜드페이” 외에 다른 제3자가 제공하는 간편결제서비스를 이용하는 경우에는 “회사”는 제6조 및 별첨에 따른 “서비스 이용 수수료”를 “고객사”에 통지하여 변경하거나 “회사”는 이 경우 본 계약을 해지할 수 있습니다.

제45조 이용수수료의 지급
① “고객사”는 “회사”의 “브랜드페이” 이용의 대가로 이용수수료를 “회사”에게 지급하며, 이용수수료 및 이의 지급 방식은 상점관리자 화면에 명시되고 상세내용은 별첨 신청서에 의합니다.

② “회사”는 월별 이용수수료에 대하여 해당월 말일자를 발행일자로 하여 익월 초까지 세금계산서를 발행합니다.

③ “회사”는 이용수수료 및 정산 주기를 변경할 수 있으며, 변경 시 “고객사”에 상점관리자 화면 등을 이용해 변경 사항을 통지합니다.

④ “고객사”의 “회사”에 대한 본 계약에 의한 이용수수료 등의 지급의무는 본 계약이 해지 또는 종료되더라도 지급할 이용수수료가 존재하는 한 계속되는 것으로 봅니다.

제46조 브랜드페이 제공 시간 및 제공의 중단
① “회사”의 “브랜드페이”는 연중 무휴 24시간 제공을 원칙으로 합니다. 단, 결제기관의 사정에 따라 달리 정할 수도 있습니다. “회사”의 사정이 아닌 결제기관의 사정 등에 따라 브랜드페이”의 중단이 있는 경우 “회사”는 이와 관련 책임을 부담하지 않습니다.

② “회사”는 “브랜드페이”의 품질 향상 및 정기점검 등의 기술적 필요에 의하여 일시적인 “브랜드페이” 제공 중단이 불가피한 경우 사전 통보하여 “고객사”의 “브랜드페이” 이용에 불편이 없도록 합니다. 다만, 천재지변, 결제기관의 사정 또는 긴급한 필요가 있는 경우에는 사전 통보 없이 “브랜드페이” 제공을 중단할 수 있으며, 중단 조치 후 “고객사”에 “브랜드페이” 제공 중단사실을 통보하여야 합니다.


④ “회사”는 본 조에 따른 브랜드페이 중단에 대하여 고의·중과실이 없는 한 어떠한 책임도 지지 않습니다.

⑤ “고객사”는 본 조에 의한 “회사”의 “브랜드페이” 제공의 중단과 관련하여 “회원”에 대한 고지 및 관련 클레임 관리 등 책임을 부담합니다.

제47조 지식재산권
“브랜드페이”를 위하여 “회사”가 “고객사”에 제공하는 API, 관련 프로그램 등의 소유권 및 지식재산권 등은 “회사”에 있으며, “고객사”는 계약기간 동안 별도의 사용료 지급 없이 본 계약의 목적 범위 내에서 이를 사용할 수 있습니다.

제48조 개인정보보호
① “고객사”와 “회사”는 “브랜드페이”를 제공 또는 이용하는 과정에서 획득한 “고객사” 또는 “회원”의 개인정보 및 기타 관련 정보에 대하여 개인정보보호법 등 관련 법령에 따라 보호의 의무를 집니다.

② “고객사”와 “회사”는 수사기관 및 관련 사법기관 및 행정 부서의 개인정보 요청에 대해 관련 법령이 제시하는 기준에 따라 이를 제공하여야 합니다.

제49조 비밀유지
① “고객사”와 “회사”는 브랜드페이 관련 내용 및 산출물과 이와 관련하여 취득하였거나 향후 취득할 상대방의 영업 또는 기술상의 정보(이하 기밀정보라 함)에 대해 관련 법령 및 본 계약에 별도로 정하고 있는 경우를 제외하고는 비밀을 유지하고, 그 종업원, 대리인, 상담역 등으로 하여금 누설하지 않도록 필요한 모든 조치를 하여야 합니다.

② 기밀정보를 포함하는 모든 자료들은 본 계약이 종료 또는 해지되는 경우, 관련 법령 및 본 계약에서 별도로 정하고 있는 경우를 제외하고는 즉시 파기되어야 합니다.

③ 본 사업추진과 관련한 사항을 언론 등에 공개하여야 하는 경우에는 그 구체적인 시기와 방법 등은 사전에 당사자들이 상호간에 협의하여 결정합니다.

④ 본 조의 의무는 계약기간이 종료된 이후 3년간 유효하게 적용되며, 본 조의 위반으로 상대방에게 손해가 발생한 경우에는 귀책 사유가 있는 당사자는 이에 대한 모든 손해를 배상하여야 합니다.

제50조 손해배상
“고객사”는 “회사”가 제공한 API, 관련 프로그램 등을 임의로 수정 또는 변경하여 발생하는 모든 손해에 대해서 책임을 지고 이를 전액 배상해야 합니다.

            	
            </textarea>
          </div>
    
          <div class="form-group form-check mb-9">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">위의 약관을 모두 읽고 동의합니다.</label>
          </div>
    
          <div class="text-center text-md-start text-lg-end">
            <button type="button" id="formBtn" class="btn btn-primary text-uppercase">
              Next
            </button>
          </div>
        
        
      </div>
      <div class="col-md-5 col-lg-4">
        <h3 class="mb-5">예약 상세 정보</h3>
        <div class="card bg-smoke mb-6 mb-md-0">
          <img class="card-img-top lazyestload" data-src="${prod.prodImg }" src="${prod.prodImg }" alt="상품 이미지">
          <div class="card-body">
            <h6 class="card-title text-dark">${prod.prodNam }</h6>

            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-transparent border-top-0 px-0 py-4">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>From:</span>
                <span class="text-gray-color">${resv.resSdate }</span>
              </li>
            
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>To:</span>
                <span class="text-gray-color">${resv.resEdate }</span>
              </li>

              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="fa fa-user me-1" aria-hidden="true"></i>Guests:</span>
                <span class="text-gray-color">${resv.resQty } Adults</span>
              </li>

              
              
              <c:if test="${member ne null }">
              <li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="fas fa-ticket-alt me-1"></i>Coupon</span>
                <div>
                	<select style="width: 175px;" id="useCoupon">
                		<option value="0">쿠폰을 선택해주세요</option>
                		<c:forEach var="coupon" items="${coupon }">
                			<c:if test="${coupon.couCode eq 'DCP' }">
                				<option value="${coupon.couNum }">${coupon.couNam } - ${coupon.couDisc }원 할인</option>
                			</c:if>
                			<c:if test="${coupon.couCode eq 'PCP' }">
                				<option value="${coupon.couNum }">${coupon.couNam } - ${coupon.couDisc }% 할인</option>
                			</c:if>
						</c:forEach>
                	</select>
                </div>
                
              </li>

              <li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
              
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="fas fa-coins me-1"></i>사용 가능 Mileage :</span>
                <span class="text-gray-color" id="mileage">${member.memMil }</span>
                <div>
                	<input type="number" id="useMileage" style="text-align: center;" value="0">
                	<span><a class="btn btn-primary" style="margin-left: 10%" href="javascript:mileage();">적용</a></span>
                </div>
              </li>

              <li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
              </c:if>
            </ul>
          </div>

          <div class="card-footer mt-6">
            <h2 class="mb-0">
              <span>Total:</span>
              <span class="text-primary font-weight-bold">&#8361;<span id="priceArea"><fmt:formatNumber value="${resv.prodPrice }"/></span></span>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  	const CSRFTokken = $("meta[name=_csrf]").attr("content");
  	let prodPrice = ${resv.prodPrice};
  	//마일리지 적용시에 값을 바꾸면 할인된 금액에서 또 할인됨. 따라서 복구용 변수가 하나 필요
  	let savePrice = ${resv.prodPrice};
  	
  	let formBtn = document.getElementById('formBtn');
	let check = "";
	
	formBtn.addEventListener('click', () => {
		check = document.getElementById('exampleCheck1').checked;
		let mileage = document.getElementById('useMileage').value;
		let coupon = document.getElementById('useCoupon').value;
		//체크박스에 체크되어잇다면
		if(check){
			$.ajax({
				url : "${pageContext.request.contextPath}/calculate/validate?_csrf=${_csrf.token}",
				method : "POST",
				data : {"coupon" : coupon, "mileage" : mileage, "finalPrice" : prodPrice, "originalPrice" : ${resv.prodPrice}, "prodCode" : "${prod.prodCode}"},
				dataType : "json",
				success : function(resp) {
					if(resp == -1){
						Swal.fire({
							title:'경고!',         // Alert 제목
							text:'금액에 위변조 정황이 발견되었습니다. 다시 결제 시도해주세요.',  // Alert 내용
							icon:'error',        // Alert 타입
						  confirmButtonColor: '#1ab3e8'
						});
					}
					else{
						var IMP = window.IMP; // 생략 가능
				    	IMP.init("<api키>"); // 예: imp00000000
			    	 	IMP.request_pay({ // param
				        	pg: "html5_inicis.INIpayTest",
				          	pay_method: "card",
				          	merchant_uid: "${fn:substring(prod.prodCode,0,2)}"+ new Date().getTime(),
				          	name: "${prod.prodNam}",
				         	amount: resp,
				          	buyer_email: $('#email').val(),
				          	buyer_name: $('#firstName').val()+" "+$('#lastName').val(),
				          	buyer_addr: $('#addr').val(),
				      	}, function (rsp) { // callback
				          	if (rsp.success) {
				          		let imp_uid = rsp.imp_uid;
				                let merchant_uid = rsp.merchant_uid;
				                $('input[name=charCode]').val(imp_uid);
				                $('input[name=resCode]').val(merchant_uid);
				                $('input[name=charPrice]').val(prodPrice);
				                $('input[name=coupon]').val(coupon);
				                $('input[name=mileage]').val(mileage);
				            	$('#resForm').submit();
				          	} else {
				             	alert(rsp.error_msg);
				          	}
				      	});
					}
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		}
		else{
			Swal.fire({
				title:'경고!',         // Alert 제목
				text:'약관에 동의해주세요',  // Alert 내용
				icon:'warning',        // Alert 타입
			  confirmButtonColor: '#1ab3e8'
			});
		}
		
	});
  	$('#useCoupon').change(function(){
  		let coupon = document.getElementById('useCoupon').value;
  		if(coupon == 0){
  			let price = ${resv.prodPrice};
			$('#priceArea').text(price);
			$('#useMileage').val(0);
			prodPrice = price;
			savePrice = price;
  		}
  		else{
  			$.ajax({
  				url : "${pageContext.request.contextPath}/calculate/coupon?_csrf=${_csrf.token}",
  				method : "POST",
  				data : {"price" : ${resv.prodPrice}, "coupon" : coupon, "prodCode" : "${prod.prodCode}"},
  				dataType : "json",
  				success : function(resp) {
  					if(resp == -1){
  						Swal.fire({
  							title:'경고!',         // Alert 제목
  							text:'보유 마일리지를 확인하고 올바른 값을 입력해주세요',  // Alert 내용
  							icon:'error',        // Alert 타입
  						  confirmButtonColor: '#1ab3e8'
  						});
  					}
  					else{
  						let price = resp.toLocaleString();
  						$('#priceArea').text(price);
  						$('#useMileage').val(0);
  						prodPrice = resp;
  						savePrice = resp;
  					}
  				},
  				error : function(errorResp) {
  					console.log(errorResp.status);
  				}
  			});
  		}
  	})
  	
  	function mileage() {
		let mileage = document.getElementById('useMileage').value;
		if(mileage < 0 || mileage > ${member.memMil}) {
			Swal.fire({
				title:'경고!',         // Alert 제목
				text:'보유 마일리지를 확인하고 올바른 값을 입력해주세요',  // Alert 내용
				icon:'warning',        // Alert 타입
			  confirmButtonColor: '#1ab3e8'
			});
		}
		else{
			$.ajax({
				url : "${pageContext.request.contextPath}/calculate/mileage?_csrf=${_csrf.token}",
				method : "POST",
				data : {"price" : savePrice, "mileage" : mileage},
				dataType : "json",
				success : function(resp) {
					let price = resp.toLocaleString();
					$('#priceArea').text(price);
					prodPrice = resp;
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			});
		}
		
	}
  </script>
</section>