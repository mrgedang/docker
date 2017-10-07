<?php
header('Content-Type: application/json');
require_once 'limonade/lib/limonade.php';

dispatch('/', 'home');
function home()
{
	$arr_data = array(
		1 => "/ -> Home page (this page)", 
		2 => "/hello -> Hello page", 
		3 => "/hello/you -> We say hello for you",
	);
	$json_out = json_encode($arr_data, JSON_UNESCAPED_SLASHES);
	return $json_out;
}

dispatch('/hello/:name', 'hello');
function hello()
{
	$name = params('name');
	$arr_data = array('Nama' => $name);
	$json_out = json_encode($arr_data);
	return $json_out;
}

run();
?>