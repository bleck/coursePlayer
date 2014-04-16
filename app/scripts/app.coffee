'use strict'

angular.module('courseV7App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .constant('COURSEPLAYER', {
    "VERSION" : "0.1"
    "ENVIRONMENT" : "DEV"
  })
  .config ($routeProvider) ->
    $routeProvider
      .when '/:courseId/:pageId',
        templateUrl: (params) ->
          if params.courseId is "NONE" then return 'views/none.html'
          'views/' + params.courseId + params.pageId + ".html"
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/NONE/0'
