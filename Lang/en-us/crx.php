<?php
/* For http://huodong.ustc.edu.cn/Crx */
$index = array(
    'zuixinfabu'=>'Newest',
    'pingjiazuijia'=>'Favor',
    'xiazaizuiduo'=>'Hot',
    'sousuo'=>'Search',
    'shangchuanapk'=>'Upload',
    'xuanzeshebei'=>'Select Device',
    'shouji'=>'Phone',
    'pingban'=>'Pad',
    'quanbushebei'=>'ALL',
    'jiaocheng'=>"Guide",
    'it-work'=>"It work ? ",
    'vote-for-it'=>"Vote for it !",
     'translation-jobs'=>"Translation Jobs",
      'information-bar'=>"Information"
    );
/* For http://huodong.ustc.edu.cn/Crx/course */
$course =  array(
    'returnToMainPage' => "Return to the Homepage", 
    'jiacheng-long'=>"Tutorial & Guide",
    'jiaocheng-title'=>"Step-by-Step Way to Run Android Apps Inside Chrome on Any Desktop Operating System: ",
    'course-step-1'=>"Install the ARChon Runtime. ",
    'course-step-2'=>"Open and enable the flag: chrome://flags/#enable-nacl,then restart Google-Chrome. (Important!)",
    'course-step-3'=>'Install existing android apps in the homepage or convert your favourite android apps by "Online APK-CRX Converter. ',
    'course-step-4'=>"Drag and drop the Google-Chrome extensions into the chrome://extensions/ page in the browser and it will be installed in your browser. ",
    'faq'=>"FAQ",
    "faq-title"=>"I can`t run the google-chrome extensions which is converted from android apps normally and how to deal with it ?",
    "faq-question-1"=>"1. Browser Error: Your browser does not support the WebGL.",
    "faq-answer-1"=>'Check the option "Use hardware acceleration when available" in advanced settings of Google-Chrome and restart Chrome.If it does not work,you need to open and enable the flag: chrome://flags/#ignore-gpu-blacklist. ',
    "faq-question-2"=>"2. All apps get stuck at the icon when launching. ",
    "faq-answer-2"=>"Check if you had the wrong ARChon thing installed (i.e. 32 instead of 64) and check if you finished the second step of the tutorial. ",
    "faq-question-3"=>"3. Browser Error: Apps, extensions and user scripts cannot be added from this website.",
    "faq-answer-3"=>"You can`t install Google-Chrome extensions into your browser directly and you should follow the 4th step to install apps.",
    "faq-question-4"=>"Some apps crash in loading screen immediately. ",
    "faq-answer-4"=>"If you can run at least one app normally,it shows they have the common application compatibility issues for ARChon Runtime and you just need to wait for the new version of the ARChon Runtime. ",
    "faq-question-other"=>"Other issues: ",
    "faq-answer-other"=>'First check if your complete each step of the tutorial or change your the suffix of your app from crx to zip,unzip it,load it using Unpacked Extension button in Chrome Extension settings and click launch.If you still have some problem to run your app,you can report the bugs and other Issues to <a style="color:blue" target="_blank"  href="https://github.com/ustcltx/apk2crx">my GitHub repository</a> . ',
    "how-to-install-archon"=>"How to install ARChon ? ",
    "why"=>"Why ? "
    );
/* For http://huodong.ustc.edu.cn/Crx/create */
 $create= array(
    'app-create-name' => "Online APK-CRX Converter", 
     'upload'=>"Upload",
     'working'=>"Working"
    );
/* For http://huodong.ustc.edu.cn/Crx/help */
$help  = array(
    'help-1-1' => "1. Unzip the file", 
    'help-1-2'=>'2. Go to chrome://extensions/ , enable Developer Mode，click on the Unpacked Extension button , navigate to the vladikoff-archon-xxx folder,hightlight it and click Open . ',
    'why-install-archon-this-way'=>"Why do you need to install Google-Chrome Extension in this way ? ",
    'help-2-1'=>"Perhaps for security reasons, Google-Chrome is unable to install third-party extensions directly . You must enable Developer Mode, drag and drop the Google-Chrome extensions into the chrome://extensions/ page in the browser and it will be installed in your browser. "
    );
      $info  = array(
        'download' => "Download", 
        'cixiazai'=>"Downloads",
        'ctime'=>"Formation Time",
        'application-details'=>"Application Details",
        'product-name'=>"Product Name",
         'apk-name'=>"APK Name",
         'version-name'=>"Version Name",
         'vote-title'=>"Result of Vote for Application Testing",
        'all-versions'=>"All Versions",
         'go-to-disqus'=>"Switch to Disqus",
        'go-to-duoshuo'=>"Switch to Duoshuo"
    );
    return array_merge($index,$course,$create,$help,$info);
?>