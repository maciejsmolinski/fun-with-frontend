const http = require('http');

exports.serveStaticImpl = function (port) {
  return function (message) {
    return function () {
      const server = http.createServer(function (req, res) {
        res.write(message);
        res.end();
      });

      server.listen(port);
    }
  }
}

exports.serveDynamicImpl = function (port) {
  return function (callback) {
    return function () {
      const server = http.createServer(callback);
      server.listen(port);
    }
  }
}