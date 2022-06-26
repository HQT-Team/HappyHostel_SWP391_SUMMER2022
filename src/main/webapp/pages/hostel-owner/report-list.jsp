<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Báo cáo</title>

    <!-- Link Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Core CSS -->
    <link rel="stylesheet" href="./assets/css/core_style/core.css">

    <!-- Link your CSS here -->
    <link rel="stylesheet" href="./assets/css/hostel_owner_style/reports_style/style.css">

    <!-- Simple Datatable CSS -->
    <link href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">

    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
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

            <div class="col-xxl-9 m-auto">
                <!-- Tab menu -->
                <div class="tabs">
                    <div class="tabs-item active">
                        <i class="tabs-icon fa-solid fa-arrows-turn-right"></i> Chưa tiếp nhận
                    </div>
                    <div class="tabs-item active">
                        <i class="tabs-icon fa-solid fa-arrows-spin"></i> Đang xử lý
                    </div>
                    <div class="tabs-item active">
                        <i class="tabs-icon fa-solid fa-flag-checkered"></i> Đã xử lý
                    </div>
                    <div class="line"></div>
                </div>

                <!-- Content item - Not reply -->
                <div class="content__item active">
                    <!-- filter bar -->
                    <div class="filter__wrapper">
                        <table>
                            <tr>
                                <td></td>
                                <td>Khu trọ</td>
                                <td>Phòng</td>
                            </tr>
                            <tr>
                                <td><i class="fa-solid fa-sliders"></i> Lọc</td>
                                <form action="report" method="post" id="form-noreply-report">
                                    <input type="hidden" name="status" value="0" />
                                    <td>
                                        <select name="hostelId" id="filter__hostel-select-1">
                                            <option value="">Tất cả</option>
                                            <c:forEach var="hostel" items="${requestScope.HOSTEL_LIST}">
                                                <option value="${hostel.hostelID}">${hostel.hostelName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="roomId" disabled id="filter__room-select-1">
                                            <option value="">Tất cả</option>
                                        </select>
                                    </td>
                                </form>
                            </tr>
                        </table>
                    </div>
                    <!-- Infor box -->
                    <div class="content__body">
                        <table id="report-table-1" class="content__table table table-bordered table-striped">
                            <thead class="content__thead">
                                <tr>
                                    <th class="text-center">Mã</th>
                                    <th class="text-center">Loại</th>
                                    <th class="text-center">Phòng số</th>
                                    <th class="text-center">Khu trọ</th>
                                    <th class="text-center">Người gửi</th>
                                    <th class="text-center">Ngày gửi</th>
                                </tr>
                            </thead>
                            <tbody class="content__tbody">
                                <c:forEach var="reportList" items="${requestScope.REPORT_DETAIL_LIST}">
                                    <c:if test="${reportList.report.status eq 0}">
                                        <tr>
                                            <td class="text-center">
                                                <a href="report-detail?reportId=${reportList.report.reportID}">#RP${reportList.report.reportID}</a>
                                            </td>
                                            <td class="text-center">${reportList.category.cateTitle}</td>
                                            <td class="text-center">${reportList.room.roomNumber}</td>
                                            <td class="text-center">${reportList.hostel.hostelName}</td>
                                            <td class="text-center">${reportList.renterInformation.fullname}</td>
                                            <fmt:parseDate pattern="yyyy-MM-dd" value="${reportList.report.sendDate}"
                                                           var="sendDate"/>
                                            <td class="text-center">
                                                <fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${sendDate}"/>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Content item - Processing -->
                <div class="content__item active">
                    <!-- filter bar -->
                    <div class="filter__wrapper">
                        <table>
                            <tr>
                                <td></td>
                                <td>Khu trọ</td>
                                <td>Phòng</td>
                            </tr>
                            <tr>
                                <td><i class="fa-solid fa-sliders"></i> Lọc</td>
                                <form action="" method="post">
                                    <td>
                                        <select name="" id="filter__hostel-select-2"
                                                style="min-width: 100px; max-width: 200px;">
                                            <option value="">Tất cả</option>
                                            <option value="">Fake Land</option>
                                            <option value="">Fake Sky</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="" id="filter__room-select-2"
                                                style="min-width: 100px; max-width: 200px;">
                                            <option value="">Tất cả</option>
                                            <option value="">7</option>
                                            <option value="">8</option>
                                            <option value="">9</option>
                                            <option value="">10</option>
                                        </select>
                                    </td>
                                </form>
                            </tr>
                        </table>
                    </div>
                    <!-- Infor box -->
                    <div class="content__body">
                        <table id="report-table-2" class="content__table table table-bordered table-striped">
                            <thead class="content__thead">
                            <th class="text-center">Mã</th>
                            <th class="text-center">Loại</th>
                            <th class="text-center">Phòng số</th>
                            <th class="text-center">Khu trọ</th>
                            <th class="text-center">Người gửi</th>
                            <th class="text-center">Ngày tiếp nhận</th>
                            </thead>
                            <tbody class="content__tbody">
                                <c:forEach var="reportList" items="${requestScope.REPORT_DETAIL_LIST}">
                                    <c:if test="${reportList.report.status eq 1}">
                                        <tr>
                                            <td class="text-center">
                                                <a href="report-detail?reportId=${reportList.report.reportID}">#RP${reportList.report.reportID}</a>
                                            </td>
                                            <td class="text-center">${reportList.category.cateTitle}</td>
                                            <td class="text-center">${reportList.room.roomNumber}</td>
                                            <td class="text-center">${reportList.hostel.hostelName}</td>
                                            <td class="text-center">${reportList.renterInformation.fullname}</td>
                                            <fmt:parseDate pattern="yyyy-MM-dd" value="${reportList.report.replyDate}"
                                                           var="replyDate"/>
                                            <td class="text-center">
                                                <fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${replyDate}"/>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Content item - Finished -->
                <div class="content__item active">
                    <!-- filter bar -->
                    <div class="filter__wrapper">
                        <table>
                            <tr>
                                <td></td>
                                <td>Khu trọ</td>
                                <td>Phòng</td>
                            </tr>
                            <tr>
                                <td><i class="fa-solid fa-sliders"></i> Lọc</td>
                                <form action="" method="post">
                                    <td>
                                        <select name="" id="filter__hostel-select-3"
                                                style="min-width: 100px; max-width: 200px;">
                                            <option value="">Tất cả</option>
                                            <option value="">Nihon Land</option>
                                            <option value="">Nihon Sky</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="" id="filter__room-select-3"
                                                style="min-width: 100px; max-width: 200px;">
                                            <option value="">Tất cả</option>
                                            <option value="">11</option>
                                            <option value="">12</option>
                                            <option value="">13</option>
                                            <option value="">14</option>
                                        </select>
                                    </td>
                                </form>
                            </tr>
                        </table>
                    </div>
                    <!-- Infor box -->
                    <div class="content__body">
                        <table id="report-table-3" class="content__table table table-bordered table-striped">
                            <thead class="content__thead">
                            <th class="text-center">Mã</th>
                            <th class="text-center">Loại</th>
                            <th class="text-center">Phòng số</th>
                            <th class="text-center">Khu trọ</th>
                            <th class="text-center">Người gửi</th>
                            <th class="text-center">Ngày hoàn thành</th>
                            </thead>
                            <tbody class="content__tbody">
                                <c:forEach var="reportList" items="${requestScope.REPORT_DETAIL_LIST}">
                                    <c:if test="${reportList.report.status eq 2}">
                                        <tr>
                                            <td class="text-center">
                                                <a href="report-detail?reportId=${reportList.report.reportID}">#RP${reportList.report.reportID}</a>
                                            </td>
                                            <td class="text-center">${reportList.category.cateTitle}</td>
                                            <td class="text-center">${reportList.room.roomNumber}</td>
                                            <td class="text-center">${reportList.hostel.hostelName}</td>
                                            <td class="text-center">${reportList.renterInformation.fullname}</td>
                                            <fmt:parseDate pattern="yyyy-MM-dd" value="${reportList.report.completeDate}"
                                                           var="completeDate"/>
                                            <td class="text-center">
                                                <fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${completeDate}"/>
                                            </td>
                                        </tr>
                                    </c:if>
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
<!-- Select2 JS -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<!-- Axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    $(document).ready(function () {
        const type = ${requestScope.TYPE};

        const tabs = document.querySelectorAll(".tabs-item");
        const contents = document.querySelectorAll(".content__item");

        const line = document.querySelector(".tabs .line");

        let i = 0;

        tabs.forEach((tab, index) => {
            const content = contents[index];

            tab.onclick = function () {

                i = index;

                document.querySelector(".tabs-item.active").classList.remove("active");
                document.querySelector(".content__item.active").classList.remove("active");

                line.style.left = this.offsetLeft + "px";
                line.style.width = this.offsetWidth + "px";

                this.classList.add("active");
                content.classList.add("active");
            };
        });

        for (let i = 1; i <= 3; i++) {
            // Select 2
            $(`#filter__hostel-select-` + i).select2();
            $(`#filter__room-select-` + i).select2();

            // Initial datatable
            $(`#report-table-` + i).DataTable();
        }

        for (let i = 0; i < 3; i++) {
            contents[i].classList.remove("active");
            tabs[i].classList.remove("active");
        }

        ((index = 0) => {
            tabs[index].classList.add("active");
            contents[index].classList.add("active");
        })(${requestScope.TYPE});

        const tabActive = document.querySelector(".tabs-item.active");

        line.style.left = tabActive.offsetLeft + "px";
        line.style.width = tabActive.offsetWidth + "px";

        // Filter handler
        $('#filter__hostel-select-1').change(() => {
            $('#form-noreply-report').submit();
        })

        $('#form-noreply-report').submit((e) => {
            e.preventDefault();
            axios({
                method: 'post',
                url: 'http://localhost:8080/HappyHostel/report?hostelId='
                    + $('#filter__hostel-select-1').val()
                    + '&roomId=' + $('#filter__room-select-1').val()
                    + '&status=1',
            })
            .then(function (response) {
                console.log(response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
        })

    });
</script>
<!-- Preload -->
<script src="./assets/js/handle-preloader.js" type="text/javascript"></script>
</body>

</html>