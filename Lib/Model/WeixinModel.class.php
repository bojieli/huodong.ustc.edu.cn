<?php 
class WeixinModel extends Model {
public function getTidByKeyword($keyword){
	return M('Keyword')->field('rid')->where(['keyword'=>$keyword])->find()['rid'];
}
public function getResponseByRid($rid){
    return M('Response')->where(['rid'=>$rid])->select();
}
public function getResponseByKeyword($keyword){
    return $this->getResponseByRid($this->getTidByKeyword($keyword));
}
}
?>