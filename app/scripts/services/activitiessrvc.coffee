'use strict'

angular.module('courseV7App')
  .factory 'ActivitiesSrvc', () ->
    # Service logic
    # ...

    meaningOfLife = 42

    # Public API here
    {
      someMethod: () ->
        meaningOfLife
    }
