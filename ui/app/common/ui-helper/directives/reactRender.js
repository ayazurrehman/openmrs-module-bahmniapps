'use strict';

angular.module('bahmni.common.uiHelper')
    .directive('reactRender', function () {
        return {
            restrict: 'A',
            link: function (scope, elem) {
                if (!(elem[0].children && elem[0].children.length)) {
                    console.log(scope.$parent.visitHistory.activeVisit);
                    // eslint-disable-next-line no-undef
                    mountConsultation(elem[0], 'Diagnosis', {patient: scope.$parent.patient, visit: scope.$parent.visitHistory.activeVisit});
                }

                // eslint-disable-next-line angular/window-service
                window.addEventListener('ADD_DIAGNOSIS', function (event) {
                    console.log("Event Detail:");
                    console.log("Search Value:", event.detail.searchValue, "Order value:", event.detail.orderValue);
                });
            }
        };
    });
