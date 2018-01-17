<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>"/>
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>"/>
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>"/>
	<?php } ?>   
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css"/>
	<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
	<link href="catalog/view/theme/default/stylesheet/stylesheet-mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:1200px)"  />
	<link href="catalog/view/theme/default/stylesheet/stylesheet-mobile-360.css" rel="stylesheet" type="text/css" media="screen and (max-width:480px)"  />
	 <script  src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
	 
	<script  src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
	
	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
		  media="<?php echo $style['media']; ?>"/>
	<?php } ?>
	<script   src="catalog/view/javascript/common.js"></script>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
	<?php } ?>
	<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>"></script>
	<?php } ?>
	<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="menu" class="hidden-lg" hidden="hidden">
	<div id="menu_mini_box">
		<ul>
			<li><a href="<?php echo $generalcatalog; ?>">Каталог</a></li>
			<li><a href="<?php echo $calculator; ?>">Расчет стоимости</a></li>
			<li><a href="<?php echo $aboutcompany; ?>">О компании</a></li>
			<!-- <li><a href="<?php echo $review; ?>">Отзывы</a></li> -->
			<li><a href="<?php echo $contacts; ?>">Контакты</a></li>
			<li><a href="<?php echo $special; ?>">Акции</a></li>
			<hr>
			<li><a class="red" href="<?php echo $our_work; ?>">Наши работы</a></li>
		</ul>
	</div>
</nav>

<main id="panel">
	<header>
		<div class="container visible-lg">
			<div class="row">
				<div class="col-sm-3 text-left" id="header-left">
					<h4 id="delivery">Доставка и установка:</h4>
					<h3 id="address_city">г. Санкт-Петербург и Лениградская область</h3>
				</div>
				<div class="col-sm-6">
					<div id="logo" class="text-center">
						<?php if ($logo) { ?>
						<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
															alt="<?php echo $name; ?>" class=""/></a>
						<?php } else { ?>
						<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
						<?php } ?>
					</div>
				</div>

				<div class="col-sm-3 text-right" id="header-right">
					<h4 id="time">График работы: 09:00 до 17:30</h4>
					<h3 id="phone">+7 (812) 965 30 61</h3>
					<h3 id="address">Уманский переулок, 71</h3>
				</div>
			</div>
		</div>
		<div class="container visible-lg" style="padding-top: 8px;">
			<div class="row border-top-dark border-bottom-dark font-type-georgia" id="navigation_bar">
				<div class="col-sm-2 coool text-center">
					<a href="<?php echo $aboutcompany; ?>"><h3>О компании</h3></a>
				</div>
				<div class="col-sm-2 coool text-center">
					<a href="<?php echo $calculator; ?>"><h3>Расчет стоимости</h3></a>
				</div>
				<div class="col-sm-2 coool text-center">
					<a href="<?php echo $generalcatalog; ?>"><h3>Каталог</h3></a>
				</div>
				<div class="col-sm-2 coool text-center">
					<a href="<?php echo $special; ?>"><h3>Акции</h3></a>
				</div>
				<!--<div class="col-sm-2 text-center">
					<a href="<?php echo $review; ?>"><h3>Отзывы</h3></a>
				</div>-->
				<div class="col-sm-2 coool text-center">
					<a href="<?php echo $contacts; ?>"><h3>Контакты</h3></a>
				</div>
			</div>
		</div>
		<div class="container hidden-lg border-bottom-dark">
			<div id="menu-mini" class="hidden-lg">
				<div id="menu_animation_box">
					<div id="d1"></div>
					<div id="d2"></div>
					<div id="d3"></div>
				</div>
				<h3>Меню</h3>
			</div>
			<div id="logo-mini" class="text-center">
				<?php if ($logo) { ?>
				<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
													alt="<?php echo $name; ?>" class=""/></a>
				<?php } else { ?>
				<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
				<?php } ?>
			</div>
		</div>
	</header>


