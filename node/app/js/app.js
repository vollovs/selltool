'use strict';

angular.module('appModule', ['ngRoute','ngResource',
                                             'tool.product.services',
                                             'tool.product.controllers',
                                             ]).config(function($routeProvider) {

	$routeProvider.when('/', {
		templateUrl : 'views/home.html'
	}).when('/service', {
		templateUrl : 'views/service.html'
	}).when('/register', {
		templateUrl : 'views/register.html'
	}).when('/products', {
		templateUrl : '/views/product/list.html',
		controller : 'ProductCtrl'
	}).when('/about', {
		templateUrl : 'views/about.html'
	}).when('/500', {
		templateUrl : 'views/500.tpl.html'
	}).otherwise({
		redirectTo : '/'
	});

});


