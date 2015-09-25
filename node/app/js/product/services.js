angular.module('tool.product.services',['ngResource'])
.factory('Product', function($resource) {
	return $resource('/api/t/product/:id', {id: '@id'}, {
		update: {method:'PUT'}
	});
})
.factory('Category', function($resource) {
	return $resource('/api/t/category/:id', {id: '@id'}, {
		update: {method:'PUT'}
	});
});