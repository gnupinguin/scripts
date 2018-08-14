# scripts
 Some useful scripts
<h3>translate</h3> 
Translate text.<br/>
<code>$ ./translate -from[source_language] -to[destination_language] -key[yandex_translation_key] [-text[text_line]]</code><br/>
<h3>create_perl</h3> 
make finished perl files;<br/>
<code>create_perl list of filenames</code>
<h3>good_eye</h3>
This script every 25 minutes minimizes all open windows on desktop
<h3>Home_Server</h3>
This is a simple project that allows you to browse the file system through a browser. Any file, except for the directory, can be downloaded. For the project must be installed Mojolicious(web-server) and Mojolicious::Plugin::RenderFile (files rendering). For install::<br /><code>cpan -i Mojolicious Mojolicious::Plugin::RenderFile</code><br />
For start project you need to add root parameter (directory for browsing, example: root=/home/user/Data) in your enviroment and execute in Home_Server directory:<br />
<code>morbo hello.pm daemon </code> 
<h3>decode-mp3-tags.pl</h3>
The script for decoding mp3 tags(ID3) from cp1251.
<code>decode-mp3-tags.pl *.mp3 </code> 
