# To run these tests
# fire your browser and go to localhost:3000/teaspoon

describe "EventsController.action.indexAction", ->
  $fixture = [
    { id: 1, title : "event1", description : "test"},
    { id: 2, title : "event2", description : "test"}
  ]

  $scope = null
  $controller = null
  $httpBackend = null

  beforeEach module("angularApp")

  beforeEach inject ($injector) ->
    $scope = $injector.get('$rootScope').$new()
    $controller = $injector.get('$controller')
    $httpBackend = $injector.get("$httpBackend")
    $httpBackend.when('GET', '/events.json').respond($fixture)

  beforeEach ->
    this.addMatchers({
      # the Resource hase extra properties which make simple .toEqual not work.
      # reference:
      # http://vaporbase.com/postings/integrating-angular-dot-js-with-rails-part-2
      toEqualData: (expect) ->
        angular.equals(expect, this.actual)
    })

  it "creates an events collection with index request", ->
    $controller(eventsController.action.indexAction, {$scope : $scope })
    expect($scope.events).toEqualData []
    $httpBackend.flush()
    expect($scope.events.length).toBe(2)
    expect($scope.events).toEqualData $fixture
