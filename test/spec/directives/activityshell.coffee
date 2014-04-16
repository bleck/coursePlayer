'use strict'

describe 'Directive: activityShell', () ->

  # load the directive's module
  beforeEach module 'courseV7App'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<activity-shell></activity-shell>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the activityShell directive'
