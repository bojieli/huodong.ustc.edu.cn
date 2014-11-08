<?php
/* For http://huodong.ustc.edu.cn/Crx */
$index = array(
    'zuixinfabu'=>'最新发布',
    'pingjiazuijia'=>'评价最佳',
    'xiazaizuiduo'=>'下载最多',
    'sousuo'=>'搜索',
    'shangchuanapk'=>'上传APK',
    'xuanzeshebei'=>'选择设备',
    'shouji'=>'手机',
    'pingban'=>'平板',
    'quanbushebei'=>'全部设备',
    'jiaocheng'=>"教程",
    'it-work'=>"它工作正常吗？",
    'vote-for-it'=>"请投票"
    );
/* For http://huodong.ustc.edu.cn/Crx/course */
$course =  array(
    'returnToMainPage' => "返回扩展瀑布流", 
    'jiacheng-long'=>"教程",
    'jiaocheng-title'=>"Google Chrome 运行Android的apk程序步骤：",
    'course-step-1'=>"下载适合你系统的运行环境ARChon",
    'course-step-2'=>"打开 chrome://flags/#enable-nacl，这一项 ，重启浏览器
    (非常重要)",
    'course-step-3'=>"使用此平台转化你喜欢的安卓APK并下载后缀名为.crx的文件",
    'course-step-4'=>"将其拖到chrome://extensions/页面完成安装",
    'faq'=>"常见问题",
    "faq-title"=>"我还是无法正常使用APK转化后的谷歌扩展，怎么办？",
    "faq-question-1"=>"问题一：浏览器提示不支持WebGL",
    "faq-answer-1"=>'解决方案：打开谷歌浏览器高级设置里面的 "使用硬件加速模式" 一项,重启浏览器,如果还是WebGL错误，那就打开chrome://flags/#ignore-gpu-blacklist 这一项',
    "faq-question-2"=>"问题二：扩展卡在图标页面",
    "faq-answer-2"=>"解决方案：检查自己是否完成了教程步骤的第二步",
    "faq-question-3"=>'问题三：安装扩展提示"无法添加来自此网站的应用、扩展程序和用户脚本。"',
    "faq-answer-3"=>"解决方案：扩展程序不能直接安装，需参照教程步骤的第四步。",
    "faq-question-4"=>"问题四：扩展打开后闪退",
    "faq-answer-4"=>"解决方案：如果您能正常运行至少一个程序，说明只是这个程序本身的兼容性问题，可以期待下一个版本修复该问题。",
    "faq-question-other"=>"其他问题",
    "faq-answer-other"=>'解决方案：先检查自己是否完成教程步骤的每一步，或者将程序.crx后缀改成.zip，解压，在开发者模式中载入该文件夹，看是否正常运行。最后还是无法解决请向我<a style="color:blue" target="_blank"  href="https://github.com/ustcltx/apk2crx">反馈</a>。',
    "how-to-install-archon"=>"怎么安装ARChon？",
    "why"=>"为什么？"
    );
/* For http://huodong.ustc.edu.cn/Crx/create */
$create= array(
    'app-create-name' => "一个将安卓程序APK转成谷歌浏览器拓展CRX的在线转化器", 
    'upload'=>"上传",
    'working'=>"正在工作..."
    );
/* For http://huodong.ustc.edu.cn/Crx/help */
$help  = array(
    'help-1-1' => "1、解压下载到的压缩包", 
    'help-1-2'=>'2、在chrome://extensions/,勾上开发者模式，点击"加载正在开发的扩展程序...",载入上步解压后的文件夹',
    'why-install-archon-this-way'=>"为什么要这样安装谷歌扩展？",
    'help-2-1'=>"或许处于安全考虑，谷歌浏览器是无法直接安装非应用商店的扩展的。必须在开发者模式打开下，将crx文件拖到chrome://extensions/界面来完成安装扩展。"
    );
    $info  = array(
        'download' => "下载", 
    );
    return array_merge($index,$course,$create,$help,$info);
?>