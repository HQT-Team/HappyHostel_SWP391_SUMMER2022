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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react-day-picker/8.0.0-beta.3/index.js"
            integrity="sha512-xiApCyCA5ca1At8kqvl5iezIE7Gg3NwkuMCjIf0zkPmJkre1rRPydTVYvRacFJbRhOPaqiZEFZPDODc5m9312Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="icon" href="./assets/images/favicon/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/core_style/core.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/renter_page/Renter-add-roommate.css">

    <!-- CSS Push Notification -->
    <link rel="stylesheet" href="./assets/css/push_notification_style/style.css">

</head>

<body>
<%
    Account account = (Account) session.getAttribute("USER");
%>
<div>
    <%@include file="components/navbar.jsp"%>

    <div class="row" style="margin: 0;padding: 0;">

        <%@include file="components/sidebar.jsp"%>

        <div class="content">

            <div class="div-controll-form" id="div-controll-form">
                <form action="AddRenterRoommatePage" method="post" class="form" id="form">
                    <h1>Thêm Thành Viên</h1>
                    <h3 style="color: red">${ERROR}</h3>
                    <h3 style="color: green">${SUCCESS}</h3>
                    <div class="form-item" id="form-item">
                        <input id="form-item-input-1" name="full-name" type="text" placeholder="Tên đây đủ">
                        <p class="border-bottom"></p>
                        <span id="mes-1"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-2" placeholder="Email" type="email" name="email" multiple>
                        <p class="border-bottom"></p>
                        <span id="mes-2"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-3" type="text" placeholder="Ngày sinh" name="dob">
                        <p class="border-bottom"></p>
                        <span id="mes-3"></span>
                    </div>
                    <div class="form-item">
                        <select name="gender" id="form-item-input-4">
                            <option value="1">Nam</option>
                            <option value="0">Nữ</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-5" type="text" placeholder="Số điện thoại" name="phone-number">
                        <p class="border-bottom"></p>
                        <span id="mes-5"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-6" type="text" placeholder="Địa chỉ" name="address">
                        <p class="border-bottom"></p>
                        <span id="mes-6"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-7" type="text" placeholder="Số CCCD" name="cccd">
                        <p class="border-bottom"></p>
                        <span id="mes-7"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-8" type="text" placeholder="Tên đầy đủ của cha/mẹ"
                               name="parent-name">
                        <p class="border-bottom"></p>
                        <span id="mes-8"></span>
                    </div>
                    <div class="form-item">
                        <input id="form-item-input-9" type="text" placeholder="Số điện thoại của cha/mẹ"
                               name="parent-phone">
                        <p class="border-bottom"></p>
                        <span id="mes-9"></span>
                    </div>
                    <input id="form-item-submit" type="button" value="Tạo Mới">
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp"%>

<!-- Push notification element -->
<div id="push-noti"></div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="./assets/js/renter/Renter-add-roommate.js"></script>
<!-- Push notification -->
<script src="./assets/js/push-notification-alert.js"></script>
<!-- Web socket -->
<script src="./assets/js/receiveWebsocket.js"></script>


<script type="text/javascript">
    // Receive
    receiveWebsocket(alertPushNoti);
    // Close when leave
    window.onbeforeunload = function(){
        receiveWebsocket.disconnectWebSocket();
    };
</script>

</body>

</html>