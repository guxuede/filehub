<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script charset="utf-8" src="/resources/script/jquery-1.8.3.js"></script>

<link rel="stylesheet" href="/resources/jquery.minicolors/jquery.minicolors.css" />
<script charset="utf-8" src="/resources/jquery.minicolors/jquery.minicolors.min.js"></script>

<link rel="stylesheet" href="/resources/jquery.jwysiwyg/jquery.wysiwyg.css">
<script charset="utf-8" src="/resources/jquery.jwysiwyg/jquery.wysiwyg.js"></script>

<link rel="stylesheet" href="/resources/jquery.date_input/jquery.date_input.css">
<script charset="utf-8" src="/resources/jquery.date_input/jquery.date_input.min.js"></script>

<link rel="stylesheet" href="/resources/css/style.css">

<style type="text/css">
 .vmsg{
 	border: none;
	display: inline-block;
	width: 16px;
	height: 16px;
	background-repeat: no-repeat;
 }
 .info{
 	background-image: url("/resources/img/info.gif")
 }
 .success{
 	background-image: url("/resources/img/success.gif")
 }
 .error{
 	background-image: url("/resources/img/error.gif")
 }
 .warning{
 	background-image: url("/resources/img/warning.gif")
 }
</style>
</head>
<body>

	<header>
	
		<h1><a href="page.html">ADMINIUM</a></h1>
		
		<form action="" method="post" class="searchform">
			<input type="text" class="text" value="Search..." />
			<input type="submit" class="submit" value="" />
		</form>
		
		
		<section class="userprofile">
			<ul>
				<li><a href="#"><img src="/resources/images/avatar.gif" alt="" /> enstyled</a>
					<ul>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
						<li><a href="index.html">Logout</a></li>
					</ul>
				</li>
			</ul>
		</section>		<!-- .userprofile ends -->
			
	</header>		<!-- #header ends -->




	
	<aside>
		
		<ul id="nav">
			<li><a href="#"><strong><img src="/resources/images/dashboard.png" alt="" /> Dashboard</strong></a></li>
			<li><a href="#"><img src="/resources/images/pages.png" alt="" /> Pages</a></li>
			<li><a href="#" class="collapse"><img src="/resources/images/media.png" alt="" /> Media</a>
				<ul>
					<li><a href="#">Photos</a></li>
					<li><a href="#">Video</a></li>
					<li><a href="#">Audio</a></li>
				</ul>
			</li>
			<li><a href="#"><img src="/resources/images/calendar.png" alt="" /> Calendar</a></li>
			<li><a href="#"><img src="/resources/images/users.png" alt="" /> Users</a>
				<ul>
					<li><a href="#">Add new user</a></li>
					<li><a href="#">User groups</a></li>
				</ul>
			</li>
			<li><a href="#"><img src="/resources/images/settings.png" alt="" /> Settings</a></li>
			<li><a href="#"><span>12</span> <img src="/resources/images/support.png" alt="" /> Support</a></li>
		</ul>
		
		
		<section class="status_box">
			<ul>
				<li><a href="#" class="online" title="Online">Web server 1</a></li>
				<li><a href="#" class="online" title="Online">Web server 2</a></li>
				<li><a href="#" class="warning" title="Warning">DB server</a></li>
				<li><a href="#" class="offline" title="Offline">Mail server</a></li>
			</ul>
		</section>
		
	</aside>		<!-- aside ends -->
	
	
	
	
	
	
	<section id="content">
		
		<div class="breadcrumb">
			<a href="#">Adminium</a> &raquo; <a href="#">Section title</a> &raquo; <a href="#">Subsection title</a> &raquo; <a href="#">Page title</a>
		</div>		<!-- .breadcrumb ends -->
		
		
		<h2>Statistics</h2>
		
		
		<div class="stats_charts">
		
			<table class="stats" rel="line" cellpadding="0" cellspacing="0" width="100%">
				<thead>
					<tr>
						<td>&nbsp;</td>
						<th scope="col">01.03</th>
						<th scope="col">02.03</th>
						<th scope="col">03.03</th>
						<th scope="col">04.03</th>
						<th scope="col">05.03</th>
						<th scope="col">06.03</th>
						<th scope="col">07.03</th>
						<th scope="col">08.03</th>
						<th scope="col">09.03</th>
						<th scope="col">10.03</th>
						<th scope="col">11.03</th>
						<th scope="col">12.03</th>
						<th scope="col">13.03</th>
						<th scope="col">14.03</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th>Page views</th>
						<td>2967</td>
						<td>2356</td>
						<td>1882</td>
						<td>1820</td>
						<td>2510</td>
						<td>2803</td>
						<td>3000</td>
						<td>2290</td>
						<td>1600</td>
						<td>1920</td>
						<td>1550</td>
						<td>1270</td>
						<td>2200</td>
						<td>2481</td>
					</tr>
					
					<tr>
						<th>Unique visitors</th>								
						<td>2042</td>
						<td>1856</td>
						<td>1082</td>
						<td>1220</td>
						<td>1510</td>
						<td>1803</td>
						<td>2180</td>
						<td>1705</td>
						<td>940</td>
						<td>1020</td>
						<td>1150</td>
						<td>680</td>
						<td>1500</td>
						<td>1781</td>
					</tr>
					
					<tr>
						<th>Sales</th>								
						<td>929</td>
						<td>263</td>
						<td>697</td>
						<td>436</td>
						<td>342</td>
						<td>989</td>
						<td>1151</td>
						<td>941</td>
						<td>371</td>
						<td>556</td>
						<td>120</td>
						<td>213</td>
						<td>821</td>
						<td>583</td>
					</tr>
				</tbody>
			</table>
			
		</div>		<!-- .stats_charts ends -->
		
				
		
		<table width="100%" cellpadding="0" cellspacing="0" class="today_stats">
			<tr>
				<td><strong>2481</strong> page views <span class="goup">+53%</span></td>
				<td><strong>1781</strong> unique visitors <span class="goup">+53%</span></td>
				<td><strong>583</strong> sales <span class="godown">-12%</span></td>
				<td class="last"><strong>12</strong> support requests</td>
			</tr>
		</table>
		
		
		<br />
		
		
		<h2>Table listing</h2>
		
		<form action="" method="post">
					
			<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
			
				<thead>
					<tr>
						<th width="10"><input type="checkbox" class="check_all" /></th>
						<th>Page title</th>
						<th>Status</th>
						<th>Date created</th>
						<th>Author</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Aorem ipsum dolor</a></strong></td>
						<td>Published</td>
						<td>20.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Zn ac libero nunc, vel congue neque</a></strong></td>
						<td>Published</td>
						<td>18.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Borem ipsum dolor</a></strong></td>
						<td>Published</td>
						<td>20.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Aaa In ac libero nunc, vel congue neque</a></strong></td>
						<td>Published</td>
						<td>18.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Lorem ipsum dolor</a></strong></td>
						<td>Published</td>
						<td>20.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">In ac libero nunc, vel congue neque</a></strong></td>
						<td>Published</td>
						<td>18.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">Lorem ipsum dolor</a></strong></td>
						<td>Published</td>
						<td>20.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
					
					<tr>
						<td><input type="checkbox" /></td>
						<td><strong><a href="#">In ac libero nunc, vel congue neque</a></strong></td>
						<td>Published</td>
						<td>08.03.2010</td>
						<td><a href="#">John Doe</a></td>
						<td class="delete"><a href="#"><img src="/resources/images/close.png" alt="Delete" title="Delete" /></a></td>
					</tr>
				</tbody>
				
			</table>
			
			
			
			<div class="tableactions">
				<select>
					<option>Actions</option>
					<option>Delete</option>
					<option>Edit</option>
				</select>
				
				<input type="submit" class="submit tiny" value="Apply to selected" />
			</div>		<!-- .tableactions ends -->
			
			
			<div class="table_pagination right">
				<a href="#">&laquo;</a>
				<a href="#" class="active">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">&raquo;</a>
			</div>		<!-- .pagination ends -->
						
		</form>
		
		
		
		<br />
		<br />
		<hr />
		<br />
		
		
		
		<h2>Messages</h2>
		
		<div class="message errormsg"><p>An error message goes here</p></div>

		<div class="message success"><p>A success message goes here</p></div>

		<div class="message info"><p>An informative message goes here</p></div>
		
		<div class="message warning"><p>A warning message goes here</p></div>
		
		
		<br />
		
		
		<h2>HUD Messages</h2>
		<p>Click on the links to see how the HUD messages works:</p>
		
		<a href="#" class="demo_success"><strong>Success message</strong></a> | 
		<a href="#" class="demo_error"><strong>Error message</strong></a> | 
		<a href="#" class="demo_info"><strong>Info message</strong></a> | 
		<a href="#" class="demo_custom"><strong>Custom message</strong></a>
		
		
		<br />
		<br />
		<hr />
		<br />
		
		
		<h2>Progress bars</h2>
		
		<div class="progress_bar small">
			<div class="progress_complete" style="width: 25%;">
				<span>25%</span>
			</div>
		</div>
		
		<div class="progress_bar small">
			<div class="progress_complete green" style="width: 50%;">
				<span>50%</span>
			</div>
		</div>
		
		<div class="progress_bar small">
			<div class="progress_complete red" style="width: 75%;">
				<span>75%</span>
			</div>
		</div>
		
		<div class="progress_bar small">
			<div class="progress_complete orange" style="width: 100%;">
				<span>100%</span>
			</div>
		</div>
		
		<p><em>Click on each bar to see it animated.</em></p>
		
		
		
		<br />
		
		
		
		<h2>Big progress bars</h2>

		<div class="progress_bar">
			<div class="progress_complete" style="width: 25%;">
				<strong><span title="25%">25%</span></strong>
			</div>
		</div>
		
		<div class="progress_bar">
			<div class="progress_complete green" style="width: 50%;">
				<span>50%</span>
			</div>
		</div>
		
		<div class="progress_bar">
			<div class="progress_complete red" style="width: 75%;">
				<span>75%</span>
			</div>
		</div>
		
		<div class="progress_bar">
			<div class="progress_complete orange" style="width: 100%;">
				<span>100%</span>
			</div>
		</div>
		
		<p><em>Click on each bar to see it animated.</em></p>



		<br />
		<hr />
		<br />
		
		
		
		<h2>Sliders</h2>
				
		<div class="slider" style="width: 50%;"></div>
		<br />
		<div class="slider-range" style="width: 99%;"></div>
		
		
		
		<br />
		<hr />
		<br />
		
		
		<h2>Forms</h2>
		
		<form action="" method="post">
			<p>
				<label>Small input label:</label><br />
				<input type="text" size="30" class="text" /> 
				<span class="note">*A note</span>
			</p>
			
			
			<p>
				<label>Medium input label:</label><br />
				<input type="text" size="60" class="text error" /> 
				<span class="note error">Error!</span>
			</p>
			
			
			<p>
				<label>Big input label:</label><br />
				<input type="text" size="100" class="text" />
			</p>
				
			
			<p>
				<label>Textarea label:</label><br />
				<textarea rows="7" cols="103"></textarea>
			</p>
			
			
			<p>
				<label>WYSIWYG editor:</label><br />
				<textarea class="wysiwyg" cols="100"></textarea>
			</p>
			
			
			<br />
			
			
			<p><label>Select label:</label> 
			
				<select class="styled">
					<optgroup label="Group 1">
						<option>Option one</option>
						<option>Option two</option>
						<option>Option three</option>
					</optgroup>
					
					<optgroup label="Group 2">
						<option>Option one</option>
						<option>Option two</option>
						<option>Option three</option>
					</optgroup>
					
					<optgroup label="Group 3">
						<option>Option one</option>
						<option>Option two</option>
						<option>Option three</option>
					</optgroup>							
				</select></p>
				
				
			
			<p>
				<label>Starting date:</label> 
				<input type="text" class="text date_picker" />
				
				&nbsp;&nbsp;
				
				<label>Ending date:</label> 
				<input type="text" class="text date_picker" />
			</p>
			
			
			<br />			
			
									
			<p class="fileupload">
				<label>Default file input label:</label> 
				<input type="file" class="file" />
			</p>
						
			<label>Custom file input label:</label> 
			<input type="file" class="file styled" title="Select file 1" /> 
			<input type="file" class="file styled" title="Select file 2" />
			
			
			<br />
			<br />
			
			
			<p class="onoffswitch">
				<input type="checkbox" class="onoffbtn" checked="checked" />
				<label>Checkbox label</label>
			</p>
			
			<p class="onoffswitch">
				<input type="checkbox" class="onoffbtn" />
				<label>Checkbox label</label>
			</p>
			
			
			
			<p>
				<label>Color picker:</label> 
				<input type="text" class="color_picker" />
			</p>
			
			
			<p>
				<input type="checkbox" class="checkbox" checked="checked" id="cbdemo1" /> <label for="cbdemo1">Checkbox label</label> 
				<input type="checkbox" class="checkbox" id="cbdemo2" /> <label for="cbdemo2">Checkbox label</label>
			</p>


			<p>
				<label><input type="radio" class="radio" name="demo" checked="checked" /> Radio button label</label>
				<label><input type="radio" class="radio" name="demo" /> Radio button label</label>
			</p>
			
			
			<p>
				<input type="submit" class="submit" value="Submit" />
				<input type="submit" class="submit" value="BIGGER SUBMIT" />
				<input type="submit" class="submit green" value="Green submit" />
				<input type="submit" class="submit red" value="Red submit" />
				<input type="submit" class="submit disabled" disabled="disabled" value="Disabled" />
			</p>
		</form>
		
		
		<br />
		<hr />
		<br />
		
		
		<h2>Galleries with drag &amp; drop</h2>
		
		<ul class="imglist">
			<li>
				<img src="/resources/images/thumb1.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6076/6056122514_f25be488a0_b.jpg" class="modal" rel="gallery" title="Summer boat">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb2.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6010/5966972771_145b06344f_b.jpg" class="modal" rel="gallery" title="Sozopol bay">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb3.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5311/5897768528_eccb7a67ee_b.jpg" class="modal" rel="gallery" title="Stones">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb4.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5263/5897766402_0a7d894296_b.jpg" class="modal" rel="gallery" title="Gate">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb1.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6076/6056122514_f25be488a0_b.jpg" class="modal" rel="gallery" title="Summer boat">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb2.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6010/5966972771_145b06344f_b.jpg" class="modal" rel="gallery" title="Sozopol bay">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb3.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5311/5897768528_eccb7a67ee_b.jpg" class="modal" rel="gallery" title="Stones">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb4.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5263/5897766402_0a7d894296_b.jpg" class="modal" rel="gallery" title="Gate">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb1.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6076/6056122514_f25be488a0_b.jpg" class="modal" rel="gallery" title="Summer boat">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb2.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6010/5966972771_145b06344f_b.jpg" class="modal" rel="gallery" title="Sozopol bay">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb3.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5311/5897768528_eccb7a67ee_b.jpg" class="modal" rel="gallery" title="Stones">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb4.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5263/5897766402_0a7d894296_b.jpg" class="modal" rel="gallery" title="Gate">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb1.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6076/6056122514_f25be488a0_b.jpg" class="modal" rel="gallery" title="Summer boat">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb2.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm7.static.flickr.com/6010/5966972771_145b06344f_b.jpg" class="modal" rel="gallery" title="Sozopol bay">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb3.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5311/5897768528_eccb7a67ee_b.jpg" class="modal" rel="gallery" title="Stones">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
			
			<li>
				<img src="/resources/images/thumb4.jpg" alt="" />
				<ul>
					<li class="view"><a href="http://farm6.static.flickr.com/5263/5897766402_0a7d894296_b.jpg" class="modal" rel="gallery" title="Gate">View</a></li>
					<li class="delete"><a href="#">Delete</a></li>
				</ul>
			</li>
		</ul>
		
		
		
		
		<br />
		<hr />
		<br />
		

		
		<h2>Text boxes</h2>
		
		<div class="textbox">
			<h2>Full width text box</h2>
			
			<div class="textbox_content">
				<p>Fusce cursus auctor faucibus. Sed sem sem, tristique a volutpat non, sagittis eget velit. Aliquam sodales risus sed mauris tincidunt posuere. Phasellus lacus leo, blandit quis posuere ut, adipiscing non leo. Vivamus massa nulla, mollis ac commodo rutrum, venenatis at tortor. Cras sed consectetur diam. Phasellus vitae lectus ullamcorper magna varius hendrerit at a odio. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>

				<p>Vestibulum adipiscing tincidunt pharetra. Nulla ornare sodales vulputate. Quisque convallis fringilla dolor at consequat. Duis vitae arcu sit amet risus dapibus varius. Aenean risus urna, dignissim sed congue ut, pharetra sed nibh. Nam lacinia scelerisque laoreet. Mauris et nulla quis metus volutpat bibendum.</p>
			</div>
		</div>
		
		
		
		
		<div class="textbox half left">
			<h2>Half width left text box</h2>
			
			<div class="textbox_content">
				<p>Fusce cursus auctor faucibus. Sed sem sem, tristique a volutpat non, sagittis eget velit. Aliquam sodales risus sed mauris tincidunt posuere. Phasellus lacus leo, blandit quis posuere ut, adipiscing non leo. Vivamus massa nulla, mollis ac commodo rutrum, venenatis at tortor. Cras sed consectetur diam.</p>
			</div>
		</div>
		
		
		
		<div class="textbox half right">
			<h2>Half width right text box</h2>
			
			<div class="textbox_content">
				<p>Vestibulum adipiscing tincidunt pharetra. <a href="#" class="tt" title="Tooltip example">Tooltip link</a>. Nulla ornare sodales vulputate. Quisque convallis fringilla dolor at consequat. Duis vitae arcu sit amet risus dapibus varius. Aenean risus urna, dignissim sed congue ut, pharetra sed nibh. Nam lacinia scelerisque laoreet. Mauris et nulla quis metus volutpat.</p>
			</div>
		</div>
		
		
		
		<div class="clear"></div>
		
		
		
		<br />
		<hr />
		<br />

		
		
		
		<h2>Chat / Discussion</h2>
		
		<br />
		
		<div class="chat">
			
			<div class="chat_users">
				<h3>In this discussion</h3>
				<ul>
					<li><a href="#" class="remove"><img src="/resources/images/close.png" alt="" /></a> <a href="#"><img src="/resources/images/avatar.gif" alt="" /> Emil Nikov</a></li>
					<li><a href="#" class="remove"><img src="/resources/images/close.png" alt="" /></a> <a href="#"><img src="/resources/images/avatar_m.gif" alt="" /> John Doe</a></li>
					<li><a href="#" class="remove"><img src="/resources/images/close.png" alt="" /></a> <a href="#"><img src="/resources/images/avatar_f.gif" alt="" /> Sarah Jones</a></li>				
				</ul>
			</div>
			
			
		
			<div class="chat_messages">
				<h3>Discussion title</h3>
				<ul>
					<li>
						<span>Yesterday, 15:32</span>
						<a href="#" class="avatar"><img src="/resources/images/avatar.gif" alt="" /></a> 
						<a href="#" class="username">Emil Nikov</a>
						
						<p>What do you think about the new layout and colors?</p>
					</li>
					
					<li>
						<span>12 hours ago</span>
						<a href="#" class="avatar"><img src="/resources/images/avatar_m.gif" alt="" /></a> 
						<a href="#" class="username">John Doe</a>
												
						<p>Love it!</p>
					</li>
					
					<li class="sysmsg">
						<span>20 minutes ago</span>
						<strong>Sarah Jones</strong> joined the discussion.
					</li>
					
					<li>
						<span>15 minutes ago</span>
						<a href="#" class="avatar"><img src="/resources/images/avatar_f.gif" alt="" /></a> 
						<a href="#" class="username">Sarah Jones</a>				
						
						<p>Hey, guys, this looks GREAT!</p>
					</li>
				</ul>
				
				<form action="" method="post">
					<img src="/resources/images/avatar.gif" alt="" />
					<input type="text" class="text" />
					<input type="submit" class="submit" value="Send" />
				</form>
			</div>
			
		</div>		<!-- .chat ends -->
		
		
		
	</section>		<!-- #content ends -->









<h1>Listing People</h1>
<table id="content">
	<tbody id="personTable">
			<c:forEach items="${people}" var="v_person">
			<tr data-identifier="${v_person.id}" data-haschanges="false" data-issaving="false">
				<td><a href="edit?id=${v_person.id}">${v_person.id}</a></td>
				<td><input class="date_selector" type="text" name="firstName" value="${v_person.firstName}" data-haschanges="false"></td>
				<td><input id="lastname" type="text" name="lastName" value="${v_person.lastName}" data-haschanges="false"></td>
				<td><span id="input" name="input">1<a>2</a>INPUT</span>3</td>
			</tr>
			</c:forEach>
	</tbody>
</table>
<a href="edit"> Add Person</a>
<textarea class="wysiwyg" cols="100"></textarea>
</body>
<script type="text/javascript">
	$('#personTable input').change(function(){
		$(this).attr('data-haschanges',true);
		$(this).parents('tr:first').attr('data-haschanges',true);
	});
	$('#personTable tr').mouseleave(function(){
		var $THIS=$(this);
		if($THIS.attr('data-haschanges')=="true" && $THIS.attr('data-issaving')=="false"){
			var formInput=$THIS.find('input[data-haschanges=true]');
			formInput.attr("readonly","readonly");
			$THIS.attr('data-issaving',true);
			var formData=formInput.serialize();
			formInput.each(function(){
				formData=formData+"&_filed="+$(this).attr('name');
			});
			var id=$THIS.attr('data-identifier');
			$.ajax({url:"/person/update/"+id,data:formData,type:"POST",success:function(r){
				console.log(r);
				$THIS.attr('data-issaving',false).attr('data-haschanges',false);
				formInput.attr('data-haschanges',false).removeAttr("readonly");
				$(r.fieldErrors).each(function(i,v){
					console.log(v.field,v.errormsg);
					var input=$THIS.find('input[name='+v.field+']');
					addVmessage(input,'error',v.errormsg);
				});
			}
			});
		}
	});
	
	//给指定的字段添加错误 
	function addVmessage(input,type,msg){
		var inputParent=input.parent();
		var vmsg=inputParent.children('input.vmsg.'+type);
		if(vmsg.length){
			vmsg.attr('title',msg);
		}else{
			$('<input class="vmsg" readonly="readonly">').addClass(type).attr('title',msg).appendTo(inputParent);
		}
	}
	//给form添加错误
	function addVmessageFrom(from,type,msg){
		var inputParent=input.parent();
		var vmsg=inputParent.children('input.vmsg.'+type);
		if(vmsg.length){
			vmsg.attr('title',msg);
		}else{
			$('<input class="vmsg" readonly="readonly">').addClass(type).attr('title',msg).appendTo(inputParent);
		}
	}
	//移除input 中指定的错误类型 
	function removeVmessage(input,type){
		var exp='input.vmsg';
		if(typeof(type) != 'undefined'){
			exp=exp+'.'+type
		}
		input.parent().children(exp).remove();
	}
	//移除form 中指定的错误类型 
	function removeVmessageForm(form,type){
		var exp='input.vmsg';
		if(typeof(type) != 'undefined'){
			exp=exp+'.'+type
		}
		form.find(exp).remove();
	}
	/*
		将data(json) 按照key(name) value 填充到表单中 
	*/
	function inputForm(form,data){
		$.each(data,function(name,value) {
			if(!(form.find('input[name='+name+']').val(value)).length){
				form.find('*[name='+name+']').text(value);
			}
		});
	}
</script>
</html>
