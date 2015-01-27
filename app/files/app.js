/* /srv/salt/awesome-app/files/app.js

   A simple Node.js web application that
   reports the server's IP.
   Shamefully stolen from StackOverflow:
   http://stackoverflow.com/questions/10750303/how-can-i-get-the-local-ip-address-in-node-js
*/

var os = require('os');
var http = require('http');
var MongoClient = require('mongodb').MongoClient;

http.createServer(function (req, res) {
  var interfaces = os.networkInterfaces();
  var addresses = [];
  for (k in interfaces) {
      for (k2 in interfaces[k]) {
          var address = interfaces[k][k2];
          if (address.family == 'IPv4' && !address.internal) {
              addresses.push(address.address)
          }
      }
  }


  
  // Connect to the db
  MongoClient.connect("mongodb://localhost:27017/exampleDb", function(err, db) {
    if(!err) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end(JSON.stringify(addresses) + ' And connected to Mongo at {{mongo_url}}');
    }

    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(JSON.stringify(addresses) + ' But failed to connect to Mongo :(');
    
  });
}).listen(1337, '0.0.0.0');
console.log('Server listening on port 1337');
