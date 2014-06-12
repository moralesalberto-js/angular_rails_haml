describe "EventsCtrl", ->
  $fixture = [
    { id: 1, title : "test", description : "test"}
  ]

  $scope = null
  $controller = null
  $httpBackend = null

  beforeEach module("Events")

  beforeEach inject($injector) ->
    $scope = $injector.get('$rootScope').$new()
    $controller = $injector.get('$controller')
    $httpBackend = $injector.get("$httpBackend")
    $httpBackend.when('GET', '/events.json').respond($fixture)

  it "creates an events collection model", ->
    $controller(EventsCtrl, {$scope : $scope })
    expect($scope.events).toBeUndefined()
    $httpBackend.flush()
    expect($scope.events.length).toBe(1)
    expect($scope.events).toEqual $fixture
