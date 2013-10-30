<?php
class AnalyticsAction extends PublicAction {
   public function link(){
       $groups=[1=>10,2=>20,3=>30,4=>40,5=>50,6=>60,7=>70];
       $i = 0;
       $j = 0;
       $all = 0;
       $re = M('Club')->field("name,gid,total_rate")->order("total_rate DESC")->select();
       foreach ($groups as $key => $value) {
               //$all = $j;
               while ($i<$value &&  count($re[$j+$i])!=0) {
               $re[$j+$i]['group']=$key;
               $all=$j+$i;
               $i++;
               
           } 
           $j += $i;
           $i = 0;
       }

       $re[] = array('name'=>'','group'=>7,'gid'=>0);
       $re[] = array('name'=>'','group'=>7,'gid'=>55);
       $re[] = array('name'=>'','group'=>7,'gid'=>75);
       //sort($re);
       $re = array_sort($re, 'gid', $type = 'asc');

       foreach ($re as $key => $value) {
         $nodes[] = ['name'=>$value['name'],'group'=>$value['group']];
         
       }
       //dump($nodes);die;
       $key = '';
       $value = '';
       $info = M('User_group')->field('uid,gid')->select();
       foreach ($info as $key => $value) {
                $uids[] = $value['uid'];
       }
       sort($uids);
       $uids = array_unique($uids);
       foreach ($info as $key => $value) {
          $array[$value['uid']]['count'] += 1;
          $array[$value['uid']]['gid'][] = $value['gid'];
       }

       //dump($array);die;
       foreach ($array as $key => $value) {
         if ($value['count'] > 1) {
           $array2[$key] = $value;
         }
       }
       $key = '';
       $value = '';
       foreach ($re as $key => $value) {
           $gids[] = $value['gid'];
       }
       $i = 0;
       //$j = 0;
       $key = '';
       $value = '';

       //dump($gids);
       foreach ($gids as $key => $value) {
           foreach ($gids as $key2 => $value2) {
               if($key <= $key2) break;
               $links2[$i]['source'] = $value;
               $links2[$i]['target'] = $value2;
               $links2[$i]['value'] = 0;
               foreach ($array2 as $key3 => $value3) {
                  $gid_arr = $value3['gid'];
                  if ( in_array($value, $gid_arr) &&  in_array($value2, $gid_arr)) {
                      $links[$i]['source'] = $value+0;
                      $links[$i]['target'] = $value2+0;
                      $links[$i]['value'] += 1;

                  }
               }               
               $i++;
           }
       }
       unset($links2);
       $key = '';
       $value = '';
       foreach ($links as $key => $value) {
         $link3[] = ['source'=>$value['source'],'target'=>$value['target'],'value'=>$value['value']];
       }
       unset($links);
       $json_arry = ['nodes'=>$nodes,'links'=>$link3];

       $filename="./upload/json/link.json";
       $file=fopen($filename,"w");
      // dump($file);die;
       fwrite($file,json_encode($json_arry));
       fclose($file);
       //dump($json_arry[1]);die;
       echo json_encode($json_arry);
       
   }
   public function creatBad(){
          //dump($_POST);die;
          //echo $this->_post('status');die;
              //return false;
        $info = creatfilterlist("./static/pbc.txt");
//echo $info;
        //dump($info);die;
        $json = json_encode($info);
        echo $json;
        //$this->success($json);
       // $filename="./upload/json/bads.json";
       // $file=fopen($filename,"w");
       // fwrite($file,json_encode($json));
       // fclose($file);
       // echo "bads OK";
  }
}
