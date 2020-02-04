<%--
Created by IntelliJ IDEA.
User: osint
Date: 2020-01-31
Time: 2:16 p.m.
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
    <jsp:include page="../header.jsp"/>

    <!-- Page Title
============================================= -->
    <section id="page-title">

        <div class="container clearfix">
            <h1>Shop</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Shop</li>
            </ol>
        </div>

    </section><!-- #page-title end -->
    <!-- Content
    ============================================= -->
    <section id="content">

        <div class="content-wrap">

            <div class="container clearfix">

                <div class="clear"></div>

                <div class="row clearfix">
                    <div class="col-md-6">
                        <h3>Adres na fakturze</h3>

                        <form:form modelAttribute="shipAddress" method="post" id="shipping-form" name="shipping-form"
                                   class="nobottommargin">
                            <form:hidden path="id"/>
                            <form:label path="zipCode">Kod pocztowy</form:label>
                            <form:input path="zipCode" id="zipCode" class="form-control"
                                        maxlength="6"/>
                            <form:errors path="zipCode" cssClass="error"/>
                            <form:label path="city">Miasto</form:label>
                            <form:input path="city" id="city" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="city" cssClass="error"/>
                            <form:label path="street">Ulica</form:label>
                            <form:input path="street" id="street" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="street" cssClass="error"/>
                            <form:label path="streetNumber">Numer</form:label>
                            <form:input path="streetNumber" id="streetNumber" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="streetNumber" cssClass="error"/>
                        </form:form>
                    </div>
                    <div class="col-md-6">
                        <h3 class="">Adres Dostawy</h3>
                        <form:form modelAttribute="shipAddress" method="post" id="shipping-form" name="shipping-form"
                                   class="nobottommargin">
                            <form:hidden path="id"/>
                            <form:label path="zipCode">Kod pocztowy</form:label>
                            <form:input path="zipCode" id="zipCode" class="form-control"
                                        maxlength="6"/>
                            <form:errors path="zipCode" cssClass="error"/>
                            <form:label path="city">Miasto</form:label>
                            <form:input path="city" id="city" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="city" cssClass="error"/>
                            <form:label path="street">Ulica</form:label>
                            <form:input path="street" id="street" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="street" cssClass="error"/>
                            <form:label path="streetNumber">Numer</form:label>
                            <form:input path="streetNumber" id="streetNumber" class="form-control"
                                        maxlength="50"/>
                            <form:errors path="streetNumber" cssClass="error"/>
                        </form:form>

                    </div>
                    <div class="w-100 bottommargin"></div>
                    <div class="col-lg-6">
                        <h4 class="card-title">Wybierz sposób dostawy</h4>
                        <form:form id="selectedDeliveryMethod" class="row" modelAttribute="selectedDeliveryMethod">
                            <form:select path="id" class="sm-form-control">
                                <form:options items="${deliveryMethods}" itemValue="id"
                                              itemLabel="deliveryMethodNameAndCost"/>
                            </form:select>
                            <form:errors path="id" cssClass="error"/>
                        </form:form>
                        <h4 class="card-title">Wybierz sposób płatności</h4>
                        <form:form id="selectedPaymentMethod" class="row" modelAttribute="selectedPaymentMethod">
                            <form:select path="id" class="sm-form-control">
                                <form:options items="${paymentMethods}" itemValue="id" itemLabel="paymentMethodName"/>
                            </form:select>
                            <form:errors path="id" cssClass="error"/>
                        </form:form>
                        <div>
                            <h4 class="card-title">Wybierz sklep</h4>
                            <form:form class="row" modelAttribute="selectedShop">
                                <form:select path="id" class="sm-form-control">
                                    <form:option value="0" label="wybierz..."/>
                                    <form:options items="${shops}" itemValue="id"
                                                  itemLabel="shopName"/>
                                </form:select>
                                <form:errors path="id" cssClass="error"/>
                            </form:form>
                        </div>
                    </div>
                    <div class="col-lg-6">

                        <h4>Podsumowanie</h4>

                        <div class="table-responsive">
                            <table class="table cart">
                                <tbody>
                                <tr class="cart_item">
                                    <td class="cart-totals-tag">
                                        <strong>Wartość produktów</strong>
                                    </td>

                                    <td class="cart-product-name">
                                        <span class="amount">${sessionScope.cart.totalValue}</span>
                                    </td>
                                </tr>
                                <tr class="cart_item">
                                    <td class="cart-totals-tag">
                                        <strong>Koszt dostawy</strong>
                                    </td>

                                    <td class="cart-product-name">
                                        <span class="amount">0 zł</span>
                                    </td>
                                </tr>
                                <tr class="cart_item">
                                    <td class="cart-totals-tag">
                                        <strong>Razem</strong>
                                    </td>

                                    <td class="cart-product-name">
                                        <span class="amount color lead"><strong>$106.94</strong></span>
                                    </td>
                                </tr>
                                </tbody>

                            </table>
                        </div>

                        <a href="#" class="button button-mini button-green fright button-3d">Zamawiam i płacę</a>
                    </div>
                </div>


            </div>

        </div>

    </section><!-- #content end -->

    <!-- Footer
============================================= -->
    <jsp:include page="../footer.jsp"/>

</div><!-- #wrapper end -->


<!--  JavaScripts
============================================= -->
<jsp:include page="../scripts.jsp"/>

</body>
</html>