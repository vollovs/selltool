var http = require('http');
var express = require('express')
	, midware = require('./lib/midware');
var port = parseInt(process.env.PORT,10) || 5000;
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var app = express();

var Config = require('./lib/config');
var config = Config().getProdConfig();

app.config = config;

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '/app/')));

//API
require('./api/crud')(app);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});


http.createServer(app).listen(port, function(){
	console.log('Service start at localhost:' + port);
});

