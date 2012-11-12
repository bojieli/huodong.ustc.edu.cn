<?php
class MapAction extends PublicAction{
	public function index(){
		  $this->assign('poster',M('Poster')->field('name,aid')->order('publish_time desc')->select());
		  $this->assign('club',M('Club')->field('name,gid')->order('gid desc')->select());
		  $this->display();
	}
	public function update(){
		$n=0;
		$fqu='daily';
		$webroot='http://huodong.ustc.edu.cn/';
		$file=fopen("sitemap.xml","w") or exit("Unable to open file!");
		$posters=M('Poster')->field('name,aid')->order('publish_time desc')->select();
		$clubs=M('Club')->field('name,gid')->order('gid desc')->select();
	foreach($posters as $poster){
		$poster_url.='
		<url>
		<loc>'.$webroot.'Poster/singlePage?aid='.$poster['aid'].'</loc>
		<lastmod>'.date('c').'</lastmod>
		<changefreq>'.$fqu.'</changefreq>
		<priority>0.8</priority>
		</url>'
        ;
		$n++;
	};
	foreach($clubs as $club){
		$club_url.='
		<url>
		<loc>'.$webroot.'Club/intro?gid='.$club['gid'].'</loc>
		<lastmod>'.date('c').'</lastmod>
		<changefreq>'.$fqu.'</changefreq>
		<priority>0.8</priority>
		</url>
		<url>
		<loc>'.$webroot.'Club/manage?gid='.$club['gid'].'</loc>
		<lastmod>'.date('c').'</lastmod>
		<changefreq>'.$fqu.'</changefreq>
		<priority>0.8</priority>
		</url>
		<url>
		<loc>'.$webroot.'Timeline?gid='.$club['gid'].'</loc>
		<lastmod>'.date('c').'</lastmod>
		<changefreq>'.$fqu.'</changefreq>
		<priority>0.8</priority>
		</url>
		';
		$n=$n+3;
	};
	$add_websites=array(
		'',
		'Club',
		'mlxh',
		'User/login',
		'User/register',
		'Map',
		'Poster/index?order=new',
		'Poster/index?order=near',
		'Poster/index?order=hot',
		'Poster/index?order=follow',
		'static/help/aboutus.html',
		'static/help/howtouse.html',
		'static/help/contactus.html',
		'static/help/UpdateLog.html',
		'Club/index',
		'Club/index?filter=club',
		'Club/index?filter=gradUnion',
		'Club/index?filter=studentUnion',
		'Club/index?filter=other',
	);
	foreach($add_websites as $add_website){
		$add.='
		<url>
		<loc>'.$webroot.$add_website.'</loc>
		<lastmod>'.date('c').'</lastmod>
		<changefreq>'.$fqu.'</changefreq>
		<priority>1.0</priority>
		</url>';
		$n++;
	};
	$head='<?xml version="1.0" encoding="UTF-8"?>
	<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
';
	$end='
	</urlset>
	<!--生成时间'.date('Y-m-d H:i:s').'-->
	';
		$content=$head.$add.$poster_url.$club_url.$end;
		fputs($file,$content);
		fclose($file);
		echo "We have ".$n." websites";
	}
}
?>