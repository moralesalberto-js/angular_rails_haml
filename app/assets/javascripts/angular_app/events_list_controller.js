
// Show the events for the user
// By default show all the user events
var eventsListController = function ($scope, $resource) {

  var loadEvents = function () {
    $scope.events = $resource('/events.json').query()
  };


  loadEvents();

};

