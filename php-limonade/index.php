<?php
require_once 'limonade/lib/limonade.php';

dispatch('/', 'home');
function home()
{
	return '<center><h3>Home Page</h3></center><hr><pre>
	RESTful with php.
	1. / -> Home page (this page)
	2. /hello -> Hello page
	3. /hello/yourname -> We say hello for you

	</pre>';
}

dispatch('/hello/:name', 'hello');
function hello()
{
	$name = params('name');
	return "<center><h3>Home Page</h3></center><hr><pre>
	Hello $name
	</pre>";
}

run();
?>