<header class="header header-custom header-fixed header-one">

    <div class="container">

        <nav class="navbar navbar-expand-lg header-nav">

            <div class="navbar-header">

                <a id="mobile_btn" href="javascript:void(0);">

                    <span class="bar-icon">

                        <span></span>

                        <span></span>

                        <span></span>

                    </span>

                </a>

                <a href="<?= route('website.homepage') ?>" class="navbar-brand logo">

                    <img src="{{getFile(basicControl()->logo_driver,basicControl()->logo)}}" class="img-fluid" alt="Logo">

                </a>

            </div>

            <div class="main-menu-wrapper">

                <div class="menu-header">

                    <a href="<?= route('website.homepage') ?>" class="menu-logo">

                        <img src="{{getFile(basicControl()->logo_driver,basicControl()->logo)}}" class="img-fluid" alt="Logo">

                    </a>

                    <a id="menu_close" class="menu-close" href="javascript:void(0);">

                        <i class="fas fa-times"></i>

                    </a>

                </div>

                <ul class="main-nav">

                    <li class="<?= !isset($_SERVER['PATH_INFO']) && route('website.homepage') == url($_SERVER['REQUEST_URI']) ? 'active' : '' ?>"><a href="<?= route('website.homepage') ?>">Home</a></li>

                    <li class="<?= isset($_SERVER['PATH_INFO']) && route('website.about') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>"><a href="<?= route('website.about') ?>">About Us</a></li>

                    <li class="has-submenu <?= isset($_SERVER['PATH_INFO']) && route('website.services') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>">

                        <a href="#">Services <i class="fas fa-chevron-down"></i></a>

                        <ul class="submenu">

                            <li><a href="<?= route('website.services') ?>">Integrated Wellness</a></li>

                            <li><a href="<?= route('website.services') ?>">Integrated Holiday</a></li>

                            <li class="has-submenu"><a href="#">Infraspace Properties</a>
                                <ul class="submenu inner-submenu">
                                    <li><a href="<?= route('website.services') ?>">Agriculture Eco Farm Lands</a>
                                    </li>
                                    <li><a href="<?= route('website.services') ?>">Affordable housing (Coming soon)</a>
                                    </li>
                                </ul>
                            </li>

                            <li><a href="<?= route('website.services') ?>">Integrated Fashions</a></li>

                            <li><a href="<?= route('website.services') ?>">Fortuelife Foundation (CFS)</a></li>

                            <li><a href="<?= route('website.services') ?>">Fortune Life Technologies</a></li>



                        </ul>

                    </li>

                    <li class="<?= isset($_SERVER['PATH_INFO']) &&route('website.business') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>"><a href="<?= route('website.business') ?>">Business Plan</a></li>

                    <li class="<?= isset($_SERVER['PATH_INFO']) &&route('website.contact') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>"><a href="<?= route('website.contact') ?>">Contact Us</a></li>

                    <li class="login-link <?= isset($_SERVER['PATH_INFO']) && route('login') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>"><a href="<?= route('login') ?>">Log In</a></li>

                    <li class="login-link <?= isset($_SERVER['PATH_INFO']) && route('register') == url($_SERVER['PATH_INFO']) ? 'active' : '' ?>"><a href="<?= route('register') ?>">ERegister</a></li>

                    <li class="register-btn">

                        <a href="<?= route('login') ?>" class="btn btn-primary log-btn"><i class="feather-lock"></i>Log
                            In</a>

                    </li>

                    <li class="register-btn">

                        <a href="<?= route('register') ?>" class="btn reg-btn"><i class="feather-user"></i>Register</a>

                    </li>

                </ul>

            </div>

        </nav>

    </div>

</header>
