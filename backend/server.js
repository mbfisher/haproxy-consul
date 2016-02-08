require('http').createServer(function (req, res) {
    res.end(JSON.stringify(req.headers));
}).listen(3000);
