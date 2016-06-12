/**
 * Created by ashun on 16/6/12.
 */

(function() {
    'use strict';

    angular
        .module('subscribe', ['ngResource'])
        .controller('subscribeCtrl', subscribeCtrl);

    function subscribeCtrl($scope, $rootScope, $resource) {
        $scope.subscribe = function () {
            var stockId = $scope.stockId;
            var username = document.getElementById("mylogin").innerHTML;
            var uptag = 0;
            var downtag = 0;
            var volumetag = 0;
            var amounttag = 0;
            var bigdealtag = 0;
            if ($scope.limitup == true) {
                uptag = 1;
            }
            if ($scope.limitdown == true) {
                downtag = 1;
            }
            if ($scope.bigdeal == true) {
                bigdealtag = $scope.bigdealnum;
            }
            if ($scope.volume == true) {
                volumetag = $scope.volumenum;
            }
            if ($scope.amount == true) {
                amounttag = $scope.amountnum;
            }

            $resource('http://localhost:8084/subscribe/add').get({
                //String username, int limitup, int limitdown, int infomine, int bigdeal, int volume, int amount,String stockId
                username: username,
                limitdown: downtag,
                limitup: uptag,
                bigdeal: bigdealtag,
                volume: volumetag,
                amount: amounttag,
                stockId: stockId,
                infomine: 0
                }).$promise.then(
                    function (response) {
                        alert("订阅成功!");
                    }, function (error) {
                        alert("订阅失败,请重试!");
                    });

        }
    }

})();
