<div id="jumbotron" class="ui segment">
	<h1 class="ui header">Phalcon-jQuery
	<div class="sub header">{{ expr[1] }}</div>
	</h1>
	<div class="ui brown message">
		<div class="header">What's new ?</div>
		<div class="content">Phalcon-JQuery 2.0 (with Semantic-UI) is coming soon</div>
	</div>
	<p>{{ q["bt-download"] }}</p>
	<p>{{ expr[3] }}</p>
	<pre><code class="language-javascript">{
    "require": {
        "jcheron/phalcon-jquery": "~v1.0.0"
    }
}</code></pre>
	<p>{{ expr[4] }}</p>
	<pre><code class="language-bash">composer install</code></pre>
</div>
{% if hasScript==true %} {{ script_foot }} {% endif %}
