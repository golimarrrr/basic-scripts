# basic-scripts

* **zmd5sum.sh**: returns md5sum of the uncompressed content of gzip files, useful as 2 identical files produce 2 different gzipped files:

![image](https://user-images.githubusercontent.com/3762732/228513315-6ca93f2e-5c42-448a-955d-941a6eace5e6.png)

* **html_file_browser.sh**: browse local HTML files in a folder using "Previous" and "Next" buttons, like what (for example) Windows Photo Viewer does for image files
* **dokuwiki2redmine.pl**: _really_ basic DokuWiki (MediaWiki) to Redmine (Textile) converter
* **downloadAllSharepointListAttachments.html**: in SharePoint lists with attachments, by default you can open or download only one at a time. With this HTML+JS code, you can create a "Download all attachments" button: add a Content Editor webpart, click Edit Source and insert this code inside
* **JxlToPoi.java**: reads a JXL workbook sheet and writes its data and style to a POI workbook sheet
* **AntipodeFinder.html**: easily find your antipodes in a Leaflet map:


![image](https://user-images.githubusercontent.com/3762732/201923461-68f7ea4e-883f-4fce-97a1-8f0be105a841.png)

* **youtube_cmd.sh**: command line youtube player, using ddgr + youtube-dl + mpv:


![youtube_cmd](https://user-images.githubusercontent.com/3762732/217211169-ae9f6392-9eb0-4b94-b71a-9d9d617f225a.gif)

* **diffxlsx.sh**: like `diff` but for Excel files. Converts them to CSV with `xlsx2csv` and diffs them. Useful for files with few differences, for example to check what was changed between two versions of the same file
