'use strict'

angular.module('courseV7App')
  .directive('activityShell', ($rootScope) ->
    templateUrl: 'views/directive_partials/activityShell.html'
    replace: true
    transclude: true
    restrict: 'E'
    scope: {
    	numberOfQuestions: '@'
    }
    link: (scope, element, attrs) ->
      scope.enableQuestion = (questionNum) ->
        $rootScope.$emit 'activateQuestion', questionNum

      scope.submitQuestion = ->
        $rootScope.$emit 'checkAnswer'

      scope.showNext = ->
        scope.questionSubmitted = false
        scope.answerSelected = false
        scope.btnState = "btn"
        scope.bottomState = "preSubmit"
        scope.currentQuestion= scope.currentQuestion+1
        scope.onLastQuestion = false
        $rootScope.$emit 'nextQuestionLoad'

      scope.viewResults = ->
        scope.questionSubmitted = true
        scope.answerSelected = false
        scope.btnState = "btn"
        scope.bottomState = "preSubmit"
        scope.onLastQuestion = false
        scope.statusDisplayed = true

      scope.resetActivity = ->
        $rootScope.$emit 'resetActivities'
        init()

      #Events
      scope.$watch 'answerSelected', ->
        if scope.answerSelected
          scope.btnState = "btn greenbtn"
        else
          scope.btnState = "btn"

      #Messaging events using the $rootScope
      $rootScope.$on 'setIncorrectText', (e, text) ->
        scope.incorrectText = text

      $rootScope.$on 'selectionMadeInActivity', ->
        scope.answerSelected = true

      $rootScope.$on 'returnCheckAnswer', (e, answerCorrect) ->
        scope.questionSubmitted = true

        if answerCorrect
          scope.correctAnswer = true
          scope.bottomState = "correct postSubmit"
          scope.answerTracker[scope.currentQuestion].state = 'correct'
          scope.amountCorrect+=1
        else
          scope.correctAnswer = false
          scope.bottomState = "incorrect postSubmit"
          scope.answerTracker[scope.currentQuestion].state = 'incorrect'
        if !scope.answerTracker[scope.currentQuestion + 1]
          scope.onLastQuestion = true

      #Initialization
      init = ->
        #Scope Vars
        scope.questionSubmitted = false
        scope.answerSelected = false
        scope.btnState = "btn"
        scope.bottomState = "postSubmit"
        scope.answerTracker = []
        scope.onLastQuestion = false
        scope.amountCorrect = 0
        scope.statusDisplayed = false
        scope.currentQuestion = 0
        for i in [0...scope.numberOfQuestions]
          scope.answerTracker.push({state: 'notAnswered'})

      init()
  )
