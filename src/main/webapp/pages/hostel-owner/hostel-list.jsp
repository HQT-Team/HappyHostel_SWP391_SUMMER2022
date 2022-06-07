<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>Danh sách khu trọ</title>

    <!-- Link Bootstrap !important -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Core CSS -->
    <link rel="stylesheet" href="./assets/css/core_style/core.css">

    <!-- Link your own CSS here -->
    <link rel="stylesheet" href="./assets/css/hostel_owner_style/hostel_list/style.css">

    <!-- Simple Datatable CSS -->
    <link href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div class="app">

        <!-- Navbar -->
        <%@include file="components/navbar.jsp"%>

        <!-- Body -->
        <div class="container">
            <div class="row position-relative">

                <!-- Side bar -->
                <div class="col-12 col-lg-3 col-xl-3 col-xxl-2">
                    <%@include file="components/sidebar.jsp"%>
                </div>

                <!-- Content -->
                <div class="col-12 col-lg-9 col-xl-9 col-xxl-10 col-xxl-10 content-group">
                    <div class="content-bar pt-5">
                        <div class="content-history">
                            <div class="current">
                                Danh sách khu trọ</div>
                        </div>
                        <div class="content-actions">
                            <a href="add-hostel" class="add-hostel-btn">
                                Thêm khu trọ mới
                            </a>
                        </div>
                    </div>
                    <div class="content-body">
                        <div class="hostel-list">
                            <div class="hostel-list__header">
                                Các khu trọ hiện tại
                            </div>
                            <div class="hostel-list__items mt-4">
                                <table id="hostel-table"
                                    class="mt-4 mb-4 table table-hover table-bordered table-striped hostel-table">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Địa chỉ</th>
                                            <th>Hành động</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-light hostel-table__body">
                                    <c:set var="count" value="0" scope="page"/>
                                    <c:forEach var="hostels" items="${requestScope.LIST_HOSTEL}">
                                        <c:set var="count" value="${count + 1}" scope="page"/>

                                        <tr>
                                            <td>${count}</td>
                                            <td>${hostels.hostelName}</td>
                                            <td>${hostels.address}, ${hostels.ward.split('-')[1]},
                                                    ${hostels.district.split('-')[1]}, ${hostels.city.split('-')[1]}
                                            </td>
                                            <td>
                                                <a href="detailHostel?hostelID=${hostels.hostelID}"
                                                   class="hostel-table__body-link-detail"
                                                >
                                                    Chi tiết
                                                </a>
                                            </td>
                                            <td>
                                                <a href="update-hostel?hostelID=${hostels.hostelID}"
                                                   class="hostel-table__body-btn-edit"
                                                >
                                                    Chỉnh sửa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="components/footer.jsp"%>

    </div>

    <!-- Script Bootstrap !important -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- JQuery -->
    <script src="./assets/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <!-- Link your script here -->
    <script src="./assets/js/handle-main-navbar.js"></script>
    <!-- Simple Datatable JS -->
    <script src="./assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            // Initial datatable
            $('#hostel-table').DataTable();
        });
    </script>
</body>

</html>