describe("EventsController.action.indexAction", function() {
  var $controller, $fixture, $httpBackend, $scope;
  $fixture = [
    { id: 1,
      title: "event1",
      description: "test" },
    { id: 2,
      title: "event2",
      description: "test"
    }
  ];

  $scope = null;
  $controller = null;
  $httpBackend = null;
  beforeEach(module("angularApp"));

  beforeEach(inject(function($injector) {
    $scope = $injector.get('$rootScope').$new();
    $controller = $injector.get('$controller');
    $httpBackend = $injector.get("$httpBackend");
    return $httpBackend.when('GET', '/events.json').respond($fixture);
  }));

  beforeEach(function() {
    return this.addMatchers({
      toEqualData: function(expect) {
        return angular.equals(expect, this.actual);
      }
    });
  });

  return it("creates an events collection with index request", function() {
    $controller(eventsController.action.indexAction, {
      $scope: $scope
    });
    expect($scope.events).toEqualData([]);
    $httpBackend.flush();
    expect($scope.events.length).toBe(2);
    return expect($scope.events).toEqualData($fixture);
  });
});

