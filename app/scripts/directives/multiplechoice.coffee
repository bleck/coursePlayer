'use strict'

angular.module('courseV7App')
  .directive('multipleChoice', ($rootScope, $timeout) ->
    templateUrl: 'views/directive_partials/multiplechoice.html'
    replace: true
    restrict: 'E'
    scope: {
      questionText: '@'
      answers: '@'
      answerId: '@'
      questionNum: '@'
      incorrectText: '@'
    }
    link: (scope, element, attrs) ->
      #Non scope functions (private)
      checkForCorrect = ->
        if parseInt(scope.answerId) is parseInt(scope.selectedAnswer.answerId)
          return true
        else
          return false

      activateQuestion = ->
        if scope.questionNum is scope.$parent.currentlyActiveQuestion
          $timeout ->
            scope.$apply ->
              scope.currentlyActive = true
              $rootScope.$emit 'setIncorrectText', scope.incorrectText
        else
          scope.currentlyActive = false

      #Events
      scope.$watch 'selectedAnswer.answerId', ->
        if scope.selectedAnswer.answerId isnt "none"
          $rootScope.$emit 'selectionMadeInActivity'

      #Messaging events using the $rootScope
      $rootScope.$on 'activateQuestion', (e, qNum) ->
        if qNum is parseInt(scope.questionNum) then scope.currentlyActive = true else scope.currentlyActive = false

      $rootScope.$on 'checkAnswer', ->
        if scope.currentlyActive
          $rootScope.$emit 'returnCheckAnswer', checkForCorrect()

      $rootScope.$on 'resetIndividualActivities', ->
        setInitValues()

      #Initialization
      setInitValues = ->
        scope.answersObj = scope.$eval scope.answers
        scope.selectedAnswer =
          answerId: "none"
        scope.currentlyActive = false
        #Changing questionNum and answerId to int
        scope.questionNum = parseInt scope.questionNum

      setInitValues()
      activateQuestion()
  )
