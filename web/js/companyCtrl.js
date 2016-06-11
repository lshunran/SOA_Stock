/**
 * Created by ashun on 16/6/11.
 */


(function() {
    'use strict';

    angular
        .module('company', ['ngResource'])
        .controller('companyCtrl', companyCtrl);
    
    function companyCtrl($scope, $rootScope, $resource) {
        $scope.catalogs = ['历史价格','历史成交量','历史价格变动','历史涨跌幅'];
        
    }

})();
