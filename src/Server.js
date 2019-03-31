const http = require('http');

exports.serveImpl = function (port) {
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