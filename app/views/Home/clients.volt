<table class='table table-striped'>
	<thead><tr><th colspan='2'>{{model}}</th></tr></thead>
		<tbody>
		{% for object in objects %}
			<tr>
			<td>{{object.toString()}}</td>
			<td class='td-center'><a class='btn btn-primary btn-xs edit' href='{{"/frm/"~object.getId()}}' id='{{ object.getId() }}'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span></a></td>
			</tr>
		{% endfor %}
		</tbody>
</table>
{% if script_foot is defined %}
    {{ script_foot }}
{% endif %}
