<?php 
class WeixinModel extends Model {
public function getTidByKeyword($keyword){
	return M('Weixin_keyword')->field('rid')->where(['keyword'=>$keyword])->find()['rid'];
}
public function getResponseByRid($rid){
    return M('Weixin_response')->where(['rid'=>$rid])->select();
}
public function getResponseByKeyword($keyword){
    return $this->getResponseByRid($this->getTidByKeyword($keyword));
}
}
?>