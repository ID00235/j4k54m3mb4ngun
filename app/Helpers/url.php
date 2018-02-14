<?php

function app_url($path){
	return url($path);
}

function web_url($path){
	return url('web/'.$path);
}
