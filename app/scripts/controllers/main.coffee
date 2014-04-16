'use strict'

angular.module('courseV7App')
  .controller 'MainCtrl', ($scope, $routeParams, $location) ->
    $scope.course =
      courseName: $routeParams.courseId
      pageNum: $routeParams.pageId

    $scope.activityData = {}

    $scope.loadNextPage = ->
      newPageId = parseInt($routeParams.pageId)+1
      $location.url($routeParams.courseId + "/" + newPageId)
