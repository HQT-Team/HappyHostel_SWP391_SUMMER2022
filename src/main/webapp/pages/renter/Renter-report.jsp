<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hqt.happyhostel.dto.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Renter Report</title>
    <link rel="icon" href="./assets/images/favicon/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/core_style/core.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/renter_page/Renter-report.css">
    <!-- CSS Push Nnotification -->
    <link rel="stylesheet" href="./assets/css/push_notification_style/style.css">

</head>
<body>
<%
    Account account = (Account)session.getAttribute("USER");
%>
<div>
    <div>
        <!-- navbar -->
        <%@include file="components/navbar.jsp"%>

        <!-- content -->
        <div class="main-body row" style="padding: 0;margin: 0;">
            <%@include file="components/sidebar.jsp"%>
            <div class="content row">
                <div class="report">
                    <form action="Renter-report" method="post" id="form-submit">
                        <h2>Viết Báo Cáo</h2>
                        <h3 class="notification-success">
                            ${requestScope.RESPONSE_MSG.content}
                        </h3>
                        <div>
                            <select name="cateID" id="select">
                                <option value="">Loại Đơn</option>
                                <c:forEach var="cate" items="${requestScope.REPORT_CATE}">
                                    <option value="${cate.cateID}">${cate.cateTitle}</option>
                                </c:forEach>
                            </select>
                            <br>
                            <span id="mes-1"></span>
                        </div>
                        <div>
                            <textarea rows="4" cols="50" name="content-report" class="form-input" placeholder=" "
                                      id="form-input"></textarea>
                            <label class="form-label">Nội dung</label>
                            <span id="mes-2"></span>
                        </div>

                        <div>
                            <input value="Gửi" type="button" id="Submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="components/footer.jsp"%>

<!-- Push notification element -->
<div id="push-noti"></div>

<script src="./assets/js/renter/Renter-report.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<!-- Web socket -->
<script src="./assets/js/sendWebsocket.js"></script>
<script src="./assets/js/receiveWebsocket.js"></script>

<script type="text/javascript">
    // Send
    <c:if test="${requestScope.RESPONSE_MSG.status == true}">
    const params = new Object();
    params.sender = "hostel_renter";
    params.receiver = "hostel_owner";
    params.hostel_receiver_id = null;
    params.account_receiver_id = "${requestScope.HOSTEL_OWNER_ID}";
    params.messages = "Người thuê vừa gửi 1 báo cáo mới. Vui lòng kiểm tra!";
    sendToWebSocket(params);
    </c:if>
    // Receive
    receiveWebsocket(alertPushNoti);
    // Close when leave
    window.onbeforeunload = function(){
        receiveWebsocket.disconnectWebSocket();
    };
</script>

<!-- Axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    const handleSendReportMail = () => {
        axios({
            method:"POST",
            url:'http://localhost:8080/HappyHostel/send-report-mail',
            params: {
                account_id: '${requestScope.HOSTEL_OWNER_ID}',
                report_id : '${requestScope.REPORT_ID}'
            }
        })
            .then(function (response) {
            })
            .catch(function (error) {
                console.log(error);
            });
    }
    <c:if test="${requestScope.RESPONSE_MSG.status eq true}">
    handleSendReportMail();
    </c:if>
</script>
</body>
</html>