// This is the controller to handle the Events
// It contains the functions to fetch data from the server
// It also contains the objects and functions to affect the UI
// like adding elements to a listing
// these functions can be accessed from the UI by writing
//
// Example how to access:
// eventsController.action.newAction
// eventsController.action.indexAction
var eventsController = function () {

  // INTERNAL VARIABLES AND FUNCTIONS
  //

  var loadEvents = function ($scope, $resource) {
    $scope.events = $resource('/events/:id.json', {id: '@id'}).query();
  };

  var constructNewEvent = function ($scope) {
    $scope.theEvent = {};
    $scope.theEvent.title = "";
    $scope.theEvent.description = "";
    $scope.theEvent.start_time = new Date();
    $scope.theEvent.end_time = new Date();
  };

  var actionNamespace = {
    indexAction : function ($scope, $resource, $location) {
      loadEvents($scope, $resource);

      $scope.deleteEvent = function(theEvent) {
        theEvent.$delete(); 
        loadEvents($scope, $resource);
      };
    },

    newAction : function ($scope, $resource, $location) {
      constructNewEvent($scope);

      $scope.save = function () {
        $resource('/events/:id.json').save($scope.theEvent);// Save the new calendar event to the server
        $location.path('/events_list');
      };

    }

  };

  // PUBLIC VARIABLES AND FUNCTIONS
  var self = {
    action : actionNamespace
  };

  return self;

}.call();

