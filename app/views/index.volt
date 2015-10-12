<!DOCTYPE html>
<html>
	<head>
		<title>phalcon-jQuery</title>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/x-icon" href="public/img/favicon.ico" />
		{{ javascript_include("https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js") }}
		{{ javascript_include("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js") }}
		{{ stylesheet_link("css/bootstrap.min.css") }}
		{{ stylesheet_link("css/styles.css") }}
		{{ stylesheet_link("css/prism.css") }}
	</head>
	<body>
	<header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
	<div class="container">
	{{q["navbarJS"]}}
	</div>
	</header>
	<div class="bs-docs-header">
		<div class="container">
			<h1><span class="harabara">phalcon</span> <span id="jquery">jQuery</span></h1>
			<p>jQuery, jQuery UI and Twitter Bootstrap library for phalcon MVC Framework</p>
		</div>
	</div>
	<div class="img-rounded container" id="content">
		<div class="row">
			<div class="col-md-9" role="main">
				<div id="response">
				{{ content() }}
				</div>
			</div>
			<div class="col-md-3" role="complementary"></div>
		</div>
	</div>
	<div class="sitemap">
		<div class="container">
			<p class="copyright">© Kobject.net 2008-2015 - <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_new">Apache 2 Licence</a></p>
			<p class="copyright">Created with <a href="https://phalconphp.com/" target="_new">Phalcon</a> & <a href="index" target="_self">Phalcon-jQuery</a></a></p>
			
		</div>
	</div>
	{{ script_foot }}
	{{ javascript_include("js/lib/prism.js") }}
</body>
</html>