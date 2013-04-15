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
	public function rss(){
	$webroot='http://huodong.ustc.edu.cn/';
		$posters=M('Poster')->field('name,aid,description,poster,publish_time')->order('publish_time desc')->limit(10)->select();
	$focus = $posters[0];
	$head ="<?xml version='1.0' encoding='utf-8'?>
	".
	'<rss version="2.0"
		xmlns:content="http://purl.org/rss/1.0/modules/content/"
		xmlns:wfw="http://wellformedweb.org/CommentAPI/"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:atom="http://www.w3.org/2005/Atom"
		xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
		xmlns:slash="http://purl.org/rss/1.0/modules/slash/"
	>
	 <channel>
        <title>今日海报焦点</title>
        <image>
            <title>'.$focus['name'].'</title>
            <link>'.$webroot.'Poster/singlePage?aid='.$focus['aid'].'</link>
            <url>'.$webroot.'upload/poster/thumb/thumb_'.$focus['poster'].'</url>
        </image>
        <description>'.trim(strip_tags($focus['description'])).'</description>
        <link>'.$webroot.'Poster/singlePage?aid='.$focus['aid'].'</link>
        <language>zh-cn</language>
        <docs>'.$webroot.'Poster/singlePage?aid='.$focus['aid'].'</docs>
        <generator>huodong.ustc.edu.cn</generator>';
	unset($posters[0]);
	foreach($posters as $poster){
		$items .= 
		'
	<item>
            <title>'.$poster['name'].'</title>
            <link>'.$webroot.'Poster/singlePage?aid='.$poster['aid'].'</link>
            <description>'.trim(strip_tags($poster['description'])).'</description>
            <author>'.$poster['author'].'</author>
            <pubDate>'.date('c',$poster['publish_time']).'</pubDate>
            <comments>'.$webroot.'Poster/singlePage?aid='.$poster['aid'].'</comments>
        </item>';
		}
	$end = '
	</channel>
	</rss>';
	header("Content-type:text/xml");
    echo $head.$items.$end;
	}
}
?>