<?php
/* For http://huodong.ustc.edu.cn/Crx */
$index = array(
    'zuixinfabu'=>'Nuevos',
    'pingjiazuijia'=>'Colaborar',
    'xiazaizuiduo'=>'Hot',
    'sousuo'=>'Buscar',
    'shangchuanapk'=>'Subir',
    'xuanzeshebei'=>'Seleccionar dispositivo ',
    'shouji'=>'Movil',
    'pingban'=>'Pad',
    'quanbushebei'=>'TODO',
    'jiaocheng'=>"Guia",
    'it-work'=>"¿Funciona? ",
    'vote-for-it'=>"Votanos!",
     'translation-jobs'=>"Trabajo de Traducción",
      'information-bar'=>"Información"
    );
/* For http://huodong.ustc.edu.cn/Crx/course */
$course =  array(
    'returnToMainPage' =>"Volver a la pagina principal", 
    'jiacheng-long'=>"Tuturiales y guias",
    'jiaocheng-title'=>"Paso a paso de como usar aplicaciones Android en Chrome con cualquier Sistema Operativo: ",
    'course-step-1'=>"Instalar ARChon Runtime. ",
    'course-step-2'=>"Abrir y habilitar el flag: chrome://flags/#enable-nacl, luego reiniciar Google-Chrome. (Importante!)",
    'course-step-3'=>'Instalar las aplicaciones Android de la página principal o convertir tus aplicaciones Android preferidad con "Online APK-CRX Converter. ',
    'course-step-4'=>"Arrastrar y soltar las extenciones de Google Chrome en la página chrome://extensions/  y esta será instalada en tu navegador. ",
    'faq'=>"FAQ",
    "faq-title"=>"No puedo correr las extensiones de Google Chrome que se convierte desde aplicaciones de Android normalmente.",
    "faq-question-1"=>"1. Error del navegador: Tu navegador no soporta WebGL.",
    "faq-answer-1"=>'Habilitar la opción "Utilizar aceleración por hardware cuando esté disponible" en configuración avanzada de Google Chrome y reiniciar Chrome. Si no funciona, necesitas habilitar el flag: chrome://flags/#ignore-gpu-blacklist. ',
    "faq-question-2"=>"2. Las aplicaciones se tildan en el inicio. ",
    "faq-answer-2"=>"Comprobar la versión de ARChoninstalada (ej. 32 en ves de 64) y comprobar si realizaste el segundo paso del tutorial. ",
    "faq-question-3"=>"3. Error del navegador: Aplicaciones, extensiones y scripts no pueden ser agregados desde este sitio.",
    "faq-answer-3"=>"No puedes instalar extenciones de Chrome en tu navegador directamente, realizar el cuarto paso de este tutorial para instalar aplicaciones.",
    "faq-question-4"=>"Algunas aplicaciones dejan de funcionar en la pantalla de carga inmediatamente.",
    "faq-answer-4"=>"Si puedes ejecutar correctamente otra aplicación, significa que esta aplicación no es compatible con la versión actual de ARChon y necesitas esperar una nueva versión.",
    "faq-question-other"=>"Otras cosas a considerar: ",
    "faq-answer-other"=>'Comprobar si completaste todos los pasos del tutorial, o cambiar la extención del archivo de tu Aplicación de .crx a .zip, descomprimirla  cargarla usando el botón "Cargar extensión descomprimida..." en  Configuración >> Extenciones. Si sigues teniendo problemas para ejecutar tu aplicación, puedes comentar tu problema en <a style="color:blue" target="_blank"  href="https://github.com/ustcltx/apk2crx">mi repositorio de GitHub</a> . ',
    "how-to-install-archon"=>"¿Como instalar ARChon? ",
    "why"=>"¿Por qué? "
    );
/* For http://huodong.ustc.edu.cn/Crx/create */
 $create= array(
    'app-create-name' => "Coversor APK-CRX Online", 
     'upload'=>"Subir",
     'working'=>"Cargando"
    );
/* For http://huodong.ustc.edu.cn/Crx/help */
$help  = array(
    'help-1-1' => "1. Descomprimir el archivo", 
    'help-1-2'=>'2. ir a  chrome://extensions/ , habilitar Modo de desarrollador，pulsar "Cargar extención descomprimida", buscar la carpeta "vladikoff-archon-xxx" y seleccionarla. ',
    'why-install-archon-this-way'=>"Por qué necesitas instalar extenciones de Google Chrome? ",
    'help-2-1'=>"Por cuestiones de seguridad Google Chrome no permite instalar extenciones de terceros directamente. Necesitas habilitar el Modo de Desarrollador, arrastrar y soltar las extenciones en la página chrome://extensions/ y estas se instalarán en tu navegador. "
    );
      $info  = array(
        'download' => "Descargar", 
          'cixiazai'=>"Downloads",
        'ctime'=>"Formation Time",
        'application-details'=>"Application Details",
        'product-name'=>"Product Name",
         'apk-name'=>"APK Name",
         'version-name'=>"Version Name",
         'file-size'=>"File Size",
         'vote-title'=>"Result of Vote for Application Testing",
        'all-versions'=>"All Versions",
         'go-to-disqus'=>"Switch to Disqus",
        'go-to-duoshuo'=>"Switch to Duoshuo",
        'app-signature'=>"APK Signature",
          'view-all-the-same-signature-apks'=>"View all the same signature apks",
    );
    return array_merge($index,$course,$create,$help,$info);
?>