'use strict'

describe 'Service: ActivitiesSrvc', () ->

  # load the service's module
  beforeEach module 'courseV7App'

  # instantiate service
  ActivitiesSrvc = {}
  beforeEach inject (_ActivitiesSrvc_) ->
    ActivitiesSrvc = _ActivitiesSrvc_

  it 'should do something', () ->
    expect(!!ActivitiesSrvc).toBe true
