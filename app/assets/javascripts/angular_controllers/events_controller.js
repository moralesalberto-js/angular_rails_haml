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
  var theEvents = [];

  var loadEvents = function ($resource) {
    theEvents = $resource('/events.json').query();
  };

  var constructNewEvent = function ($scope) {
    $scope.theEvent = {};
    $scope.theEvent.title = "";
    $scope.theEvent.description = ""; 
  };


  var actionNamespace = {
    indexAction : function ($scope, $resource) {
      loadEvents($resource);
      $scope.events = theEvents; // We assign theEvents to the view events array
    },

    newAction : function ($scope, $resource) {
      // whatever preparation we need before showing
      // the new template
      constructNewEvent($scope);

      $scope.save = function () {
        $resource('/events/:id.json').save($scope.theEvent);// Save the new calendar event to the server
        constructNewEvent($scope);
      };


    }

  };

  // PUBLIC VARIABLES AND FUNCTIONS
  var self = {
    action : actionNamespace
  };

  return self;

}.call();

