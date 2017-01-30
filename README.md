# scripts
 Some useful scripts
<h3>translate</h3> 
translate text from russian to english or conversely; You need to add path to key_file at this script<br/>
<code>translate -l [destination language] -t [some text]</code><br/>
<h3>create_perl</h3> 
make finished perl files;<br/>
<code>create_perl list of filenames</code>
<h3>good_eye</h3>
This script every 25 minutes minimizes all open windows on desktop
<h3>Home_Server</h3>
This is a simple project that allows you to browse the file system through a browser. Any file, except for the directory, can be downloaded. For the project must be installed Mojolicious(web-server) and Mojolicious::Plugin::RenderFile (files rendering). For install::<br /><code>cpan -i Mojolicious Mojolicious::Plugin::RenderFile</code><br />
For start project you need to set $SERVER_ROOT_PATH (directory for browsing) in your enviroment and execute in Home_Server directory:<br />
<code>morbo hello.pm daemon </code> 
