<%--
  Created by IntelliJ IDEA.
  User: osint
  Date: 2020-01-26
  Time: 12:47 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header">

    <div id="header-wrap">

        <div class="container clearfix">

            <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

            <!-- Logo
            ============================================= -->
            <div id="logo">
                <div class="myLogo">
                    <a href="/" class="standard-logo"><img src="images/logo.png" alt="Rentier Logo"></a>
                </div>

            </div><!-- #logo end -->

            <!-- Primary Navigation
            ============================================= -->
            <nav id="primary-menu" class="style-3">

                <ul>
                    <li><a href="${pageContext.request.contextPath}/">
                        <div>Home</div>
                    </a>

                    </li>

                    <li><a href="#">
                        <div>Kurtki / Płaszcze</div>
                    </a>

                    </li>

                    <li><a href="#">
                        <div>Marynarki</div>
                    </a>

                    </li>

                    <li><a href="#">
                        <div>Kamizelki</div>
                    </a>

                    </li>

                    <li><a href="#">
                        <div>Spodnie</div>
                    </a>
                    </li>

                    <li><a href="#">
                        <div>Koszule</div>
                    </a>
                    </li>
                    <li><a href="#">
                        <div>Garnitury</div>
                    </a>
                    </li>

                </ul>

                <div id="top-cart">
                    <a href="cart.html"><i class="icon-shopping-cart"></i><span>5</span></a>
                </div><!-- #top-cart end -->

            </nav><!-- #primary-menu end -->

        </div>

    </div>

</header><!-- #header end -->