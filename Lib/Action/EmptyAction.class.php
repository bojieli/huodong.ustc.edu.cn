<?php 
 class EmptyAction extends Action{ 
 	
 	//所请求的模块不存在时，默认执行的模块  
    public function index(){  
        header("HTTP/1.0 404 Not Found");//404状态码  
        $this->display("Public:404"); //显示自定义的404页面模版  
    } 

    function _empty(){ 
        header("HTTP/1.0 404 Not Found");//使HTTP返回404状态码 
        $this->display("Public:404"); 
    } 
 } 
 ?>