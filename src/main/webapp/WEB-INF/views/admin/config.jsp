<%--
Created by IntelliJ IDEA.
User: osint
Date: 2020-01-31
Time: 2:16 p.m.
To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html dir="ltr" lang="en-US">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="author" content="SemiColonWeb"/>

    <!-- Stylesheets
    ============================================= -->
    <jsp:include page="../styles.jsp"/>

    <!-- Document Title
    ============================================= -->
    <title>Rentier</title>

</head>

<body class="stretched">

<!-- Document Wrapper
============================================= -->
<div id="wrapper" class="clearfix">

    <!-- Header
============================================= -->
    <jsp:include page="header.jsp"/>

    <!-- Page Title
============================================= -->
    <section id="page-title">

        <div class="container clearfix">
            <h1>Konfiguracja</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Konfiguracja</li>
            </ol>
        </div>

    </section><!-- #page-title end -->
    <!-- Content
    ============================================= -->
    <section id="content">

        <div class="content-wrap">

            <div class="container clearfix">

                <div class="row clearfix">


                    <div class="col-lg-12">

                        <div class="tabs tabs-alt clearfix" id="tabs-profile">

                            <ul class="tab-nav clearfix">
                                <li>
                                    <a href="#tab-admin-shops"><i class="icon-shop"></i> Sklepy</a>
                                </li>
                                <li>
                                    <a href="#tab-admin-brands"><i class="icon-archive1"></i> Marki</a>
                                </li>
                                <li>
                                    <a href="#tab-admin-categories"><i class="icon-folder2"></i> Kategorie</a>
                                </li>
                                <li>
                                    <a href="#tab-admin-sizes"><i class="icon-resize-full"></i> Rozmiary</a>
                                </li>
                                <li>
                                    <a href="#tab-admin-pay-methods"><i class="icon-credit"></i> Metody
                                        płatności</a>
                                </li>
                                <li>
                                    <a href="#tab-admin-ship-methods"><i class="icon-luggage-cart"></i> Metody
                                        dostawy</a>
                                </li>

                            </ul>

                            <div class="tab-container">

                                <div class="tab-content clearfix" id="tab-admin-shops">
                                    <div class="card">

                                        <div class="card-body">

                                            <table class="table table-bordered">
                                                <thead>
                                                <th scope="col">Nazwa sklepu</th>
                                                <th scope="col">Kod pocztowy</th>
                                                <th scope="col">Miasto</th>
                                                <th scope="col">Ulica</th>
                                                <th scope="col">Numer</th>
                                                <th scope="col">Aktywny</th>
                                                <th scope="col">Akcje</th>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${shops}" var="shop">
                                                    <tr>
                                                        <td><c:out value="${shop.shopName}"/></td>
                                                        <td><c:out value="${shop.address.zipCode}"/></td>
                                                        <td><c:out value="${shop.address.city}"/></td>
                                                        <td><c:out value="${shop.address.street}"/></td>
                                                        <td><c:out value="${shop.address.streetNumber}"/></td>
                                                        <td style="align-content: center">
                                                            <c:if test="${shop.active}"><i
                                                                    class="icon-line-square-check"></i></c:if>
                                                            <c:if test="${!shop.active}"><i
                                                                    class="icon-line-square-cross"></i></c:if>
                                                        </td>
                                                        <td>
                                                            <a class="button button-mini button-red button-3d"
                                                                    href="/admin/config/del?shopId=${shop.id}">Usuń
                                                            </a>
                                                            <a class="button button-mini button-blue button-3d"
                                                                    href="/admin/config?shopId=${shop.id}">Edytuj
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="w-100 line divider-line"></div>
                                            <h4 class="card-title">
                                                <c:if test="${empty shop.id}">Dodaj nowy sklep</c:if>
                                                <c:if test="${not empty shop.id}">Edytuj sklep</c:if>
                                            </h4>
                                            <form:form class="row" method="post" action="/admin/config/shop/add"
                                                       id="addForm" modelAttribute="shop">
                                                <form:hidden path="id"/>
                                                <div class="col-md-6 form-group">
                                                    <label for="shopName">Nazwa sklepu </label>
                                                    <form:input path="shopName" id="shopName" class="form-control"
                                                                maxlength="100"/>
                                                    <form:errors path="shopName" cssClass="error"/>
                                                </div>
                                                <div class="col-md-12 form-group"></div>
                                                <div class="col-md-2 form-group">
                                                    <label for="zipCode">Kod pocztowy </label>
                                                    <form:input path="address.zipCode" id="zipCode"
                                                                class="form-control" maxlength="6"/>
                                                    <form:errors path="address.zipCode" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="city">Miasto </label>
                                                    <form:input path="address.city" id="city" class="form-control"
                                                                maxlength="50"/>
                                                    <form:errors path="address.city" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="street">Ulica </label>
                                                    <form:input path="address.street" id="street" class="form-control"
                                                                maxlength="50"/>
                                                    <form:errors path="address.street" cssClass="error"/>
                                                </div>
                                                <div class="col-md-2 form-group">
                                                    <label for="streetNumber">Numer </label>
                                                    <form:input path="address.streetNumber" id="streetNumber"
                                                                class="form-control" maxlength="10"/>
                                                    <form:errors path="address.streetNumber" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="phone">Telefon </label>
                                                    <form:input path="phone" id="phone" class="form-control"
                                                                maxlength="9"/>
                                                    <form:errors path="phone" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="email">Email </label>
                                                    <form:input path="email" id="email" class="form-control"
                                                                maxlength="50"/>
                                                    <form:errors path="email" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group" align="center">
                                                    <label for="active">Aktywny </label>
                                                    <form:checkbox path="active" id="active" class="form-control"/>
                                                    <form:errors path="active" cssClass="error"/>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit"
                                                            class="button button-mini button-blue button-3d"
                                                            value="Submit">Zapisz
                                                    </button>
                                                </div>

                                            </form:form>

                                        </div>

                                    </div>
                                </div>

                                <div class="tab-content clearfix" id="tab-admin-brands">
                                    <div class="card">

                                        <div class="card-body">

                                            <table class="table table-bordered">
                                                <thead>
                                                <th scope="col">Logo</th>
                                                <th scope="col">Marka</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Aktywny</th>
                                                <th scope="col">Akcje</th>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${brands}" var="brand">
                                                    <tr>
                                                        <td>
                                                            <c:if test="${not empty brand.logoFileName}">
                                                            <img height="90" width="380" src="<c:out value="${brand.logoFileName}"/>"
                                                                 alt="BrandLogo"/>
                                                            </c:if>
                                                        </td>
                                                        <td><c:out value="${brand.name}"/></td>
                                                        <td><c:out value="${brand.email}"/></td>
                                                        <td style="align-content: center">
                                                            <c:if test="${brand.active}"><i
                                                                    class="icon-line-square-check"></i></c:if>
                                                            <c:if test="${!brand.active}"><i
                                                                    class="icon-line-square-cross"></i></c:if>
                                                        </td>
                                                        <td>
                                                            <a class="button button-mini button-red button-3d"
                                                                    href="/admin/config/del?brandId=${brand.id}">Usuń
                                                            </a>
                                                            <a class="button button-mini button-blue button-3d"
                                                                    href="/admin/config?brandId=${brand.id}">Edytuj
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="w-100 line divider-line"></div>
                                            <h4 class="card-title">
                                                <c:if test="${empty brand.id}">Dodaj nową markę</c:if>
                                                <c:if test="${not empty brand.id}">Edytuj markę</c:if>
                                            </h4>
                                            <form:form class="row" method="post" action="/admin/config/brand/add"
                                                       id="brandAddForm" modelAttribute="brand" enctype="multipart/form-data">
                                                <form:hidden path="id"/>
                                                <div class="col-md-6 form-group">
                                                    <label for="name">Nazwa </label>
                                                    <form:input path="name" id="name" class="form-control"
                                                                maxlength="100"/>
                                                    <form:errors path="name" cssClass="error"/>
                                                </div>
                                                <div class="col-md-4 form-group">
                                                    <label for="email">Email </label>
                                                    <form:input path="email" id="email" class="form-control"
                                                                maxlength="50"/>
                                                    <form:errors path="email" cssClass="error"/>
                                                </div>
                                                <div class="col-md-2 form-group" align="center">
                                                    <label for="active">Aktywny </label>
                                                    <form:checkbox path="active" id="active" class="form-control"/>
                                                    <form:errors path="active" cssClass="error"/>
                                                </div>
                                                <div class="col-md-6 form-group">
                                                    <label for="fileName">Plik logo <small></small></label>
                                                    <input accept="image/png, image/jpeg" type="file" id="fileName"
                                                           name="fileName" class="form-control required" />
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit"
                                                            class="button button-mini button-blue button-3d"
                                                            value="Submit">Zapisz
                                                    </button>
                                                </div>

                                            </form:form>

                                        </div>
                                    </div>
                                </div>

                                <div class="tab-content clearfix" id="tab-admin-categories">
                                    <div class="card-body">
                                        <div class="col-md-7">
                                                <table class="table table-bordered">
                                                    <thead>
                                                    <th scope="col">Nazwa</th>
                                                    <th scope="col">Aktywny</th>
                                                    <th scope="col">Akcje</th>
                                                    </thead>
                                                <tbody>
                                                <c:forEach items="${productCategories}" var="productCategory">
                                                    <tr>
                                                        <td><c:out value="${productCategory.categoryName}"/></td>
                                                        <td style="align-content: center">
                                                            <c:if test="${productCategory.active}"><i
                                                                    class="icon-line-square-check"></i></c:if>
                                                            <c:if test="${!productCategory.active}"><i
                                                                    class="icon-line-square-cross"></i></c:if>
                                                        </td>
                                                        <td>
                                                            <a class="button button-mini button-red button-3d"
                                                               href="/admin/config/del?productCategoryId=${productCategory.id}">Usuń
                                                            </a>
                                                            <a class="button button-mini button-blue button-3d"
                                                               href="/admin/config?productCategoryId=${productCategory.id}">Edytuj
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="w-100 line divider-line"></div>
                                            <h4 class="card-title">
                                                <c:if test="${empty brand.id}">Dodaj nową kategorię</c:if>
                                                <c:if test="${not empty brand.id}">Edytuj kategorię</c:if>
                                            </h4>
                                            <form:form class="row" method="post" action="/admin/config/productCategory/add"
                                                       id="categoryAddForm" modelAttribute="productCategory">
                                                <form:hidden path="id"/>
                                                <div class="col-md-6 form-group">
                                                    <label for="categoryName">Nazwa </label>
                                                    <form:input path="categoryName" id="categoryName" class="form-control"
                                                                maxlength="100"/>
                                                    <form:errors path="categoryName" cssClass="error"/>
                                                </div>
                                                <div class="col-md-2 form-group" align="center">
                                                    <label for="active">Aktywny </label>
                                                    <form:checkbox path="active" id="active" class="form-control"/>
                                                    <form:errors path="active" cssClass="error"/>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit"
                                                            class="button button-mini button-blue button-3d"
                                                            value="Submit">Zapisz
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-content clearfix" id="tab-admin-sizes">
                                    <div class="card-body">

                                        <div class="col-md-7">
                                            <table class="table table-bordered">
                                                <thead>
                                                <th scope="col">Nazwa</th>
                                                <th scope="col">Dotyczy kategorii</th>
                                                <th scope="col">Akcje</th>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${productSizes}" var="productSize">
                                                    <tr>
                                                        <td><c:out value="${productSize.sizeName}"/></td>
                                                        <td><c:out value="${productSize.productCategory.categoryName}"/></td>
                                                        <td style="align-content: center">
                                                            <c:if test="${productSize.active}"><i
                                                                    class="icon-line-square-check"></i></c:if>
                                                            <c:if test="${!productSize.active}"><i
                                                                    class="icon-line-square-cross"></i></c:if>
                                                        </td>
                                                        <td>
                                                            <a class="button button-mini button-red button-3d"
                                                               href="/admin/config/del?productSizeId=${productSize.id}">Usuń
                                                            </a>
                                                            <a class="button button-mini button-blue button-3d"
                                                               href="/admin/config?productSizeId=${productSize.id}">Edytuj
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="w-100 line divider-line"></div>
                                            <h4 class="card-title">
                                                <c:if test="${empty productSize.id}">Dodaj nowy rozmiar</c:if>
                                                <c:if test="${not empty productSize.id}">Edytuj rozmiar</c:if>
                                            </h4>
                                            <form:form class="row" method="post" action="/admin/config/productSize/add"
                                                       id="sizeAddForm" modelAttribute="productSize">
                                                <form:hidden path="id"/>
                                                <div class="col-md-6 form-group">
                                                    <label for="sizeName">Nazwa </label>
                                                    <form:input path="sizeName" id="sizeName" class="form-control"
                                                                maxlength="50"/>
                                                    <form:errors path="sizeName" cssClass="error"/>
                                                </div>
                                                <div class="col-md-6 form-group">
                                                    <label for="active">Wybierz kategorię </label>
                                                    <form:select path="productCategory" class="formElement">
                                                        <form:option value="0" label="wybierz..."/>
                                                        <form:options items="${productCategories}" itemValue="id" itemLabel="categoryName"/>
                                                    </form:select>
                                                    <form:errors path="productCategory" cssClass="error"/>
                                                </div>
                                                <div class="col-md-2 form-group" align="center">
                                                    <label for="active">Aktywny </label>
                                                    <form:checkbox path="active" id="active" class="form-control"/>
                                                    <form:errors path="active" cssClass="error"/>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit"
                                                            class="button button-mini button-blue button-3d"
                                                            value="Submit">Zapisz
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>


                                    </div>
                                </div>

                                <div class="tab-content clearfix" id="tab-admin-pay-methods">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Data i godzina zamówienia</th>
                                            <th>Numer zamówienia</th>
                                            <th>Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>2020-01-01 20:20:20</td>
                                            <td><a href="#">000/0000</a></td>
                                            <td>Nowe</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="tab-content clearfix" id="tab-admin-ship-methods">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Data i godzina zamówienia</th>
                                            <th>Numer zamówienia</th>
                                            <th>Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>2020-01-01 20:20:20</td>
                                            <td><a href="#">000/0000</a></td>
                                            <td>Nowe</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>

                    </div>


                    <div class="w-100 line d-block d-md-none"></div>


                </div>

            </div>

        </div>

    </section><!-- #content end -->

    <!-- Footer
============================================= -->
    <jsp:include page="footer.jsp"/>

</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- JavaScripts
    <jsp:include page="../scripts.jsp"/>

</body>
</html>