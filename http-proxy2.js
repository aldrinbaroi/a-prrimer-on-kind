
var http = require('http');
var httpProxy = require('http-proxy');
var express = require('express');
var app = express();
const _ = require('underscore');


// Proxy Address
var proxyAddresses = [
    {
        host: "127.0.0.1",
        port: 40429
    }
];

/**
 * Get port from environment and store in Express.
 */

var port = 3001; // normalizePort(process.env.PORT || '9090');
app.set('port', port);

//Create a set of proxy servers
var proxyServers = proxyAddresses.map(function (target) {
    return new httpProxy.createProxyServer({
        target: target
    });
});

/**
 * Create HTTP server.
 */

var server = http.createServer(function(req, res){
    var proxy = proxyServers.shift();
    var mreq = _.clone(req);
    mreq.host = "127.0.0.1";
    proxy.web(mreq, res);
    proxyServers.push(proxy);
});

function onError() {
	;
}

function onListening() {
	;
}

/**
 * Listen on provided port, on all network interfaces.
 */
server.listen(port, function(){console.log("server is listening on port " + port);});
server.on('error', onError);
server.on('listening', onListening);


