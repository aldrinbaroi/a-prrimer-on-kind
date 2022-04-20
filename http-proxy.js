
const express = require('express');
const httpProxy = require('http-proxy');
// let mReq = require('request');
const _ = require('underscore');

// Create a proxy and listen on port 3000
const proxy = httpProxy.createProxyServer({});
const app = express();
app.get('*', function(req, res) {
  // Prints "Request GET https://httpbin.org/get?answer=42"
  var mReq = _.clone(req);
  mReq.host = '127.0.0.1';
  //mReq.method = req.method;
  //mReq.url = req.url;
  //mReq.on = req.on;
  console.log('Request', req.method, req.url, req.host);
  console.log('mReq   ', mReq.method, mReq.url, mReq.host);
  // proxy.web(req, res, { target: `http://127.0.0.1:40429` });
  proxy.web(mReq, res, { target: `http://127.0.0.1:40429` });
});
const server = app.listen(3001, '10.0.0.8');

