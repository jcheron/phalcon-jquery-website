<!DOCTYPE html>
<html language="{{ lang }}">
	<head>
		<title>phalcon-jQuery</title>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/x-icon" href="public/img/favicon.ico" />
		{{ stylesheet_link("https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css") }}
		{{ stylesheet_link("css/styles.css") }}
		{{ stylesheet_link("https://cdnjs.cloudflare.com/ajax/libs/prism/1.4.1/themes/prism-okaidia.min.css") }}
	</head>
	<body>
	<header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
	<div class="ui container">
	{{q["navbarJS"]}}
	</div>
	</header>
	<div class="bs-docs-header">
		<div class="ui container">
			<h1><span class="harabara">phalcon</span> <span id="jquery">jQuery</span></h1>
			<p>{{ expr[0] }}</p>
		</div>
	</div>
	<div class="img-rounded ui container" id="content">
		<div class="ui grid">
				<div class="thirteen wide column">
					<div id="response">
					{{ content() }}
					</div>
				</div>
				<div class="col-md-3 three wide column"></div>
		</div>
	</div>
	<div class="sitemap">
		<div class="ui container">
			<ul>
			<li class="copyright">Kobject.net © 2008-2015 - <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_new">Apache 2 Licence</a></li>
			<li class="copyright">Created with <a href="https://phalconphp.com/" target="_new">Phalcon</a> & <a href="index" target="_self">Phalcon-jQuery</a></a></li>
			</ul>
		</div>
	</div>
	{{ q["back"] }}
	{{ javascript_include("https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js") }}
	{{ javascript_include("https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js") }}
	{{ script_foot }}
	{{ javascript_include("js/lib/prism.js") }}
</body>
</html>