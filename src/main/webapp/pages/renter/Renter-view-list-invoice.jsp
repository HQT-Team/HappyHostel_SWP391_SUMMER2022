<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.hqt.happyhostel.dto.Account" %><%--
  Created by IntelliJ IDEA.
  User: 84337
  Date: 6/18/2022
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Renter</title>
  <link rel="icon" href="./assets/images/favicon/favicon.png" type="image/x-icon" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="./assets/css/core_style/core.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="./assets/css/renter_page/Renter-view-list-invoice.css">

</head>

<body>
<%
  Account account = (Account)session.getAttribute("USER");
%>
<div>
  <nav class="navbar row">
    <div class="navbar-left">
      <div class="dropdown"  style="padding-left: 15px;">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"style="width:80px ;height: 35px;font-size: 14px;background-color: rgb(0, 0, 0);">
          Menu
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="HostelRenterPage" style="font-size: 15px;">Thông tin phòng</a>
          <a class="dropdown-item" href="get-roommate-infor" style="font-size: 15px;">Bạn cùng phòng</a>
          <a class="dropdown-item" href="ContractPage" style="font-size: 15px;">Hợp đồng</a>
          <a class="dropdown-item" href="renter-invoice"style="font-size: 15px;">Hóa đơn</a>
          <a class="dropdown-item" href="Renter-report"style="font-size: 15px;">Báo cáo</a>
          <a class="dropdown-item" href="RenterNotificationPage"style="font-size: 15px;">Thông báo</a>
          <a class="dropdown-item" href="Renter-add-roommate"style="font-size: 15px;">Thêm bạn</a>
          <a class="dropdown-item" href="Get-report"style="font-size: 15px;">Xem báo cáo</a>
          <a class="dropdown-item" href="HostelRenterProfilePage?<%= account.getAccId()%>"style="font-size: 15px;">Hồ sơ</a>
          <a class="dropdown-item" href="logout"style="font-size: 15px;">Đăng xuất</a>
        </div>
      </div>
      <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="link">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="HostelRenterPage" style="text-decoration: none; color:#FFFFFF">Người thuê</a>
          </li>
          <li class="breadcrumb-item active" aria-current="page">Hoá Đơn</li>
        </ol>
      </nav>
    </div>
    <div class="navbar-center">
      <a href="" role="button"><img src="./assets/images/logos/logowhite.png" alt=""></a>
    </div>
    <div class="navbar-right">
      <a href="logout" role="button">Đăng xuất <img src="./assets/images/logos/logout.png" alt=""></a>
    </div>

  </nav>

  <div class="row">
    <div class="dashboard hidden" id="dashboard">
      <div class="infor-top">
        <img src="./assets/images/avatars/user-avatar.jpg" alt="">
        <h3><%= account.getAccountInfo().getInformation().getFullname() %></h3>
        <p>Người Thuê</p>
      </div>
      <div class="card">
        <div class="card-header" id="headingOne">
          <button class="collapsed show" data-toggle="collapse" data-target="#collapseOne"
                  aria-expanded="true" aria-controls="collapseOne">
            <img src="./assets/images/logos/homeicon.webp">
            Phòng trọ
          </button>
        </div>

        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
          <div class="card-body">
            <h3><a href="HostelRenterPage">Thông tin phòng</a></h3>
            <h3><a href="get-roommate-infor">Bạn cùng phòng</a></h3>
            <h3><a href="ContractPage">Hợp đồng</a></h3>
            <h3><a href="renter-invoice" style="color:rgb(4, 4, 255)">Hóa đơn</a></h3>
            <h3><a href="Renter-report">Gửi báo cáo</a></h3>
            <h3><a href="RenterNotificationPage">Xem thông báo</a></h3>
            <h3><a href="Renter-add-roommate">Thêm bạn</a></h3>
            <h3><a href="Get-report">Xem báo cáo</a></h3>
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" id="headingTwo">
          <button class="collapsed" data-toggle="collapse" data-target="#collapseTwo"
                  aria-expanded="false" aria-controls="collapseTwo">
            <img src="./assets/images/logos/account.png">
            Tài khoản
          </button>
        </div>
        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
          <div class="card-body">
            <h3><a href="HostelRenterProfilePage?<%=account.getAccId()%>">Hồ sơ</a></h3>
            <h3><a href="logout">Đăng xuất</a></h3>
          </div>
        </div>
      </div>
    </div>


    <div class="content">
      <div class="table-content">
        <h2>Danh Sách Hoá Đơn</h2>
        <table class="table table-bordered" >
          <thead>
          <tr>
            <th>Mã Hoá Đơn</th>
            <th>Ngày Tạo Hoá Đơn</th>
            <th>Tổng Tiền(VND)</th>
            <th>Trạng Thái</th>
          </tr>
          </thead>
          <tbody>

          <c:forEach var="b" items="${BILL_LIST}" >
              <fmt:parseDate pattern="yyyy-MM-dd" value="${b.createdDate}" var="createdDate" />
            <tr>
              <td style="height: 22px;"><a href="renter-bill-payment?billID=${b.billID}"> #<fmt:formatDate value="${createdDate}" type="Date" pattern="yyyyMMdd"/>${b.billID} </a></td>
              <td style="height: 22px;"><fmt:formatDate value="${createdDate}" type="Date" pattern="dd-MM-yyyy"/></td>
              <td style="height: 22px;"><fmt:setLocale value="vi_VN"/>
                <fmt:formatNumber value="${b.totalMoney}" type="currency" currencySymbol="VNĐ"/></td>
              <td style="height: 22px;"><a>
                <c:if test="${b.status == 1}">
                    <p style="color: green">Đã thanh toán</p>
                </c:if>
                <c:if test="${b.status != 1}">
                  <p style="color: red">Chưa thanh toán</p>
                </c:if>
              </a></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
  </div>
</div>
</div>
<footer>
  <div>
    <div class="row">
      <div class="col-12">
        <div class="copyright-wrapper d-flex justify-content-center">
          <!-- <div class="copyright-logo">
              <img src="../../assets/images/logos/logo-white.png" alt="Logo">
          </div> -->
          <div class="copyright-content">© 2022 HQT Team. All rights reserved.</div>
        </div>
      </div>
    </div>
  </div>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="./assets/js/renter/Renter-view-list-invoice.js"></script>

</body>

</html>