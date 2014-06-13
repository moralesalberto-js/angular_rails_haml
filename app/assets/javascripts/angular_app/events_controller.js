var EventsController = function ($scope, $location) {

  var loadEvents = function () {
    $scope.events = [{title: 'one here'}];
  };

  $scope.showListing = function() {
    $location.path("events_list")
  };

  loadEvents();

}
