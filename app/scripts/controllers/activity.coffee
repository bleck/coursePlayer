'use strict'

angular.module('courseV7App')
  .controller 'ActivityCtrl', ($scope, $rootScope) ->
    $scope.currentlyActiveQuestion = 1

    $rootScope.$on 'nextQuestionLoad', ->
      $scope.currentlyActiveQuestion++
      $rootScope.$emit 'activateQuestion', $scope.currentlyActiveQuestion

    $rootScope.$on 'resetActivities', ->
      $scope.currentlyActiveQuestion = 1
      $rootScope.$emit 'activateQuestion', $scope.currentlyActiveQuestion
