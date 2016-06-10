
(function() {
    'use strict';

    angular
        .module('platform', ['ngResource'])
        .controller('platformCtrl', platformCtrl);

    function platformCtrl($scope, $rootScope, $resource) {
        $scope.start = "";
        $scope.end = "";
        $scope.generateURL = function (box1,box2,box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,start,end) {
            var box = [];
            //var startDate = start || '2013-01-01';
            (box1 == true) ? box[0] = "&box1=true" : box[0] = "";
            (box2 == true) ? box[1] = "&box2=true" : box[1] = "";
            (box3 == true) ? box[2] = "&box3=true" : box[2] = "";
            (box4 == true) ? box[3] = "&box4=true" : box[3] = "";
            (box5 == true) ? box[4] = "&box5=true" : box[4] = "";
            (box6 == true) ? box[5] = "&box6=true" : box[5] = "";
            (box7 == true) ? box[6] = "&box7=true" : box[6] = "";
            (box8 == true) ? box[7] = "&box8=true" : box[7] = "";
            (box9 == true) ? box[8] = "&box9=true" : box[8] = "";
            (box10 == true) ? box[9] = "&box10=true" : box[9] = "";
            (box11 == true) ? box[10] = "&box11=true" : box[10] = "";
            (box12 == true) ? box[11] = "&box12=true" : box[11] = "";

            var baseURL = "http://localhost:8084/openplatform?";
            var finalURL = baseURL + "&stockCode=[code]"+box[0] + box[1] + box[2] + box[3] + box[4] + box[5] + box[6] + box[7] + box[8] + box[9] + box[10] + box[11] + "&start="+start +"&end="+end;
            $scope.final = finalURL;
            console.log(box);
            console.log(start);
            console.log(end);


            //console.log(num);
            // $resource('http://localhost:8084/openplatform').get({
            //     box1: box1,
            //     box2: box2,
            //     box3: box3,
            //     box4: box4,
            //     box5: box5,
            //     box6: box6,
            //     box7: box7,
            //     box8: box8,
            //     box9: box9,
            //     box10: box10,
            //     box11: box11,
            //     box12: box12,
            //     start: start,
            //     end: end || null
            //     //phoneNum: num
            // }).$promise.then(
            //     function (response) {
            //         console.log(response);
            //     }, function (error) {
            //         console.log(error);
            //     });

        }
        
    }
})();
