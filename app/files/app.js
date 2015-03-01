/* /srv/salt/awesome-app/files/app.js

   A simple Node.js web application that
   returns some static content, rendered via Salt.

   Shamefully stolen from StackOverflow:
   http://stackoverflow.com/questions/4720343/loading-basic-html-in-node-js
*/

var http = require('http');
var fs = require('fs');


fs.readFile('./index.html', function (err, html) {
    if (err) {
        throw err; 
    }       
    http.createServer(function(request, response) {  
        response.writeHeader(200, {"Content-Type": "text/html"});  
        response.write(html);  
        response.end();  
    }).listen(1337, '0.0.0.0');
});

console.log('Server listening on port 1337');
