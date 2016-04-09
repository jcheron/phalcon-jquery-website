<div class="jumbotron">
	<p class="lead">
	{{ expr[1] }}
	</p>
	<p><a class="btn btn-primary btn-lg" href="https://github.com/jcheron/phalcon-jquery/archive/v1.0.5.zip" role="button">
	<span class="octicon octicon-mark-github"></span>
	{{ expr[2] }} <span class="label label-info">Phalcon-jQuery Azhar v1.0.5</span></a></p>
	{{ expr[3] }}
	<pre><code class="language-javascript">{
    "require": {
        "jcheron/phalcon-jquery": "~v1.0.0"
    }
}</code></pre>
<p>{{ expr[4] }}</p>
	<pre><code class="language-bash">composer install</code></pre>
</div>
{% if hasScript==true %}
{{ script_foot }}
{%
 endif %}