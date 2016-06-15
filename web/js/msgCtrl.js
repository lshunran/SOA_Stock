/**
 * Created by ashun on 16/6/13.
 */

(function() {
    'use strict';

    angular
        .module('msg', ['ngResource'])
        .controller('msgCtrl', msgCtrl);

    function msgCtrl($scope, $rootScope, $resource, $interval) {

        $interval(function(){
            var username = document.getElementById("mylogin").innerHTML;
            console.log(username);
            $resource('http://localhost:8084/subscribe/getmsg').get({
                username: username
            }).$promise.then(
                function (response) {
                    console.log(response);
                    console.log(response.msg);
                    $scope.msgs = response.msg;
                }, function (error) {
                    alert("订阅失败,请重试!");
                });
        },5000);


    }
})();