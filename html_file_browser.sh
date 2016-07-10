#!/bin/bash
# Browse local HTML files in a folder using "Previous" and "Next" buttons, like (for example) Windows Photo Viewer does for image files
# Based on http://stackoverflow.com/a/8786346
#
# Edit "my_files" path below, run and save output in .html file, and open it to start browsing
#
# _Very_ basic URL encoding implemented, as some browsers will not open the file instead

echo '
<html>
  <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <title>Browse all HTML files in directory</title> 
    <script>
	var cnt = -1;
	var webpageArray = ['

for htmlFile in my_files/*.html
do
	htmlFileUrlEnc=$(echo $htmlFile | sed 's/#/%23/g')
	echo \"$htmlFileUrlEnc\",
done

echo '      ]; 

	function loadNextPage(dir) {   
	  
		cnt+=dir;
		
		if (cnt<0)
			cnt=webpageArray.length-1; // wrap
		else if (cnt>= webpageArray.length)
			cnt=0; // wrap
			
		var iframe = document.getElementById("myframe"); 
		iframe.src = webpageArray[cnt]; 
		
		fileCurrent.innerHTML = webpageArray[cnt];
		filePos.innerHTML = (cnt+1) + "/" + webpageArray.length;
		
		return false; // mandatory!
		
	} 
    </script>
  </head> 

  <body>  

  <a href="#" onclick="return loadNextPage(-1)"> << Previous </a> | 
  <a href="#" onclick="return loadNextPage(1)"> Next >> </a>
  &nbsp;
  <div style="display:inline; font-family:monospace" id="fileCurrent">about:blank</div>
  &nbsp;
  <div style="display:inline" id="filePos"></div>
  <br>
  <iframe width="90%" height="90%" id="myframe" src="about:blank"></iframe> 
  </body> 
  </html>
'




