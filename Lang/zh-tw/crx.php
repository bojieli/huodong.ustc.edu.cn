<?php
/* For http://huodong.ustc.edu.cn/Crx */
$index = array(
    'zuixinfabu'=>'最新發布',
    'pingjiazuijia'=>'評價最佳',
    'xiazaizuiduo'=>'下載最多',
    'sousuo'=>'搜索',
    'shangchuanapk'=>'上傳APK',
    'xuanzeshebei'=>'選擇設備',
    'shouji'=>'手機',
    'pingban'=>'平板',
    'quanbushebei'=>'全部設備',
    'jiaocheng'=>"教程",
    'it-work'=>"它工作正常嗎？",
    'vote-for-it'=>"請投票",
    'translation-jobs'=>"翻譯工作",
    'information-bar'=>"信息欄"
    );
/* For http://huodong.ustc.edu.cn/Crx/course */
$course =  array(
    'returnToMainPage' => "返回擴展瀑布流", 
    'jiacheng-long'=>"教程",
    'jiaocheng-title'=>"Google Chrome 運行Android的apk程序步驟：",
    'course-step-1'=>"下載適合你系統的運行環境ARChon",
    'course-step-2'=>"打開 chrome://flags/#enable-nacl，這一項 ，重啟瀏覽器
    (非常重要)",
    'course-step-3'=>"使用此平台轉化你喜歡的安卓APK並下載後綴名為.crx的文件",
    'course-step-4'=>"將其拖到chrome://extensions/頁面完成安裝",
    'faq'=>"常見問題",
    "faq-title"=>"我還是無法正常使用APK轉化後的谷歌擴展，怎麼辦？",
    "faq-question-1"=>"問題一：瀏覽器提示不支持WebGL",
    "faq-answer-1"=>'解決方案：打開谷歌瀏覽器高級設置裡面的 "使用硬件加速模式" 一項,重啟瀏覽器,如果還是WebGL錯誤，那就打開chrome://flags/#ignore-gpu-blacklist 這一項',
    "faq-question-2"=>"問題二：擴展卡在圖標頁面",
    "faq-answer-2"=>"解決方案：檢查自己是否完成了教程步驟的第二步",
    "faq-question-3"=>'問題三：安裝擴展提示"無法添加來自此網站的應用、擴展程序和用戶腳本。"',
    "faq-answer-3"=>"解決方案：擴展程序不能直接安裝，需參照教程步驟的第四步。",
    "faq-question-4"=>"問題四：擴展打開後閃退",
    "faq-answer-4"=>"解決方案：如果您能正常運行至少一個程序，說明只是這個程序本身的兼容性問題，可以期待下一個版本修復該問題。",
    "faq-question-other"=>"其他問題",
    "faq-answer-other"=>'解決方案：先檢查自己是否完成教程步驟的每一步，或者將程序.crx後綴改成.zip，解壓，在開發者模式中載入該文件夾，看是否正常運行。最後還是無法解決請向我<a style="color:blue" target="_blank"  href="https://github.com/ustcltx/apk2crx">反饋</a>。',
    "how-to-install-archon"=>"怎麼安裝ARChon？",
    "why"=>"為什麼？"
    );
/* For http://huodong.ustc.edu.cn/Crx/create */
$create= array(
    'app-create-name' => "一個將安卓程序APK轉成谷歌瀏覽器拓展CRX的在線轉化器", 
    'upload'=>"上傳",
    'working'=>"正在工作..."
    );
/* For http://huodong.ustc.edu.cn/Crx/help */
$help  = array(
    'help-1-1' => "1、解壓下載到的壓縮包", 
    'help-1-2'=>'2、在chrome://extensions/,勾上開發者模式，點擊"加載正在開發的擴展程序...",載入上步解壓後的文件夾',
    'why-install-archon-this-way'=>"為什麼要這樣安裝谷歌擴展？",
    'help-2-1'=>"或許處于安全考慮，谷歌瀏覽器是無法直接安裝非應用商店的擴展的。必須在開發者模式打開下，將crx文件拖到chrome://extensions/界面來完成安裝擴展。"
    );
    $info  = array(
        'download' => "下載", 
    );
    return array_merge($index,$course,$create,$help,$info);
?>