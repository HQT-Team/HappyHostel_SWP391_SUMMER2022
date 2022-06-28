<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link rel="icon" href="./assets/images/favicon/favicon.png" type="image/x-icon" />

    <!-- Title -->
    <title>Danh sách hóa đơn phòng trọ</title>

    <!-- Link Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Core CSS -->
    <link rel="stylesheet" href="./assets/css/core_style/core.css">

    <!-- Link your CSS here -->
    <link rel="stylesheet" href="./assets/css/hostel_owner_style/room-list-invoice_style/style.css">

    <!-- Simple Datatable CSS -->
    <link href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
</head>

<body class="over-flow-hidden">
<!-- Loader -->
<div id="preloader">
    <div class="dots">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<!-- Navbar -->
<%@include file="./components/navbar.jsp"%>

<!-- Body -->
<div class="container">
    <div class="row position-relative">
        <!-- Side bar -->
        <div class="col-12 col-lg-3 col-xl-3 col-xxl-2">
            <%@include file="./components/sidebar.jsp"%>
        </div>

        <!-- Content -->
        <div class="col-12 col-lg-9 col-xl-9 col-xxl-10 col-xxl-10 content-group">
            <!-- History link bar -->
            <div class="content-history">
                <a href="../list-hostels/hostel-list.html" class="history-link">Danh sách khu trọ</a>
                <i class="fa-solid fa-chevron-right"></i>
                <a href="../list-hostels/hostel-detail.html" class="history-link">NovaLand Sky</a>
                <i class="fa-solid fa-chevron-right"></i>
                <a href="./room-detail.html" class="history-link">Phòng 11</a>
                <i class="fa-solid fa-chevron-right"></i>
                <div class="current">Danh sách hóa đơn</div>
            </div>
            <!-- Infor box -->
            <div class="col-xxl-9 m-auto">
                <div class="content__body">
                    <h1 class="content__title">Danh sách hóa đơn</h1>
                    <table id="invoices-table" class="content__table table table-bordered table-striped">
                        <thead class="content__thead">
                        <tr>
                            <th class="text-center mb-d-none">Mã</th>
                            <th class="text-center">Tên</th>
                            <th class="text-center">Ngày tạo</th>
                            <th class="text-center mb-d-none">Tổng tiền</th>
                            <th class="text-center">Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody class="content__tbody">
                        <c:forEach var="invoice" items="${requestScope.listRoomBill}">
                            <tr>
                                <td class="mb-d-none">
                                    <a href="./room-invoice-detail.html" class="content__tbody-link">#VA${invoice.billID}</a>
                                </td>
                                <td><a href="./room-invoice-detail.html" class="content__tbody-link">${invoice.billTitle}</a>
                                </td>
                                <td>${invoice.createdDate}</td>
                                <td class="mb-d-none">${invoice.totalMoney} VNĐ</td>
                                <td>
                                            <c:choose>
                                                <c:when test="${invoice.status eq 0}">
                                                    <span class="content__tbody-status yes">Đã thanh toán</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="content__tbody-status no">Chưa thanh toán</span>
                                                </c:otherwise>
                                            </c:choose>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="content__action">
                        <a href="./room-detail.html" class="content__action-link">
                            <i class="fa-solid fa-circle-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@include file="./components/footer.jsp"%>

<!-- Script Bootstrap !important -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="./assets/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<!-- Navbar -->
<script src="./assets/js/handle-main-navbar.js"></script>
<!-- Simple Datatable JS -->
<script src="./assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        // Initial datatable
        $('#invoices-table').DataTable();
    });
</script>
<!-- Link your script here -->
<script src="./assets/js/handle-preloader.js" type="text/javascript"></script>
</body>

</html>
