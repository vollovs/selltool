angular.module('tool.product.controllers',['tool.configuration'])
.controller('ProductCtrl', function($scope, $http, Product, Category) {
	$scope.categories = Category.query();
	$scope.products = Product.query();
})
.controller("ProductListCtrl", function ($scope, $filter) {
	 
	var selectedCategory = null;
	 
	$scope.selectCategory = function (newCategory) {
		console.log('cat=' + newCategory.id.toString());
		selectedCategory = newCategory;
		
	}
	 
	$scope.categoryFilterFn = function (product) {
		//console.log('cat=' + selectedCategory.id + ', p.cat_id=' + product.category_id);
		return selectedCategory == null || product.category_id.toString() == selectedCategory.id.toString();
	}
})
.controller('ProductDetailCtrl',function($scope, $routeParams, Product) {
    $scope.id = $routeParams.id;
    
    $scope.p = Product.get({id : $routeParams.id},function(product) {
	    //$scope.mainImageUrl = property.images[0].name;
	});
    
    $scope.setImage = function(imageUrl) {
        //$scope.mainImageUrl = imageUrl;
    }
});
//.controller('CategoryCtrl', function($scope, $http, Category) {
//	
//});