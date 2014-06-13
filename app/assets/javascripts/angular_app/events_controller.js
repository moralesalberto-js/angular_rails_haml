var EventsController = function ($scope, $location) {

  var loadEvents = function () {
    $scope.events = [{title: 'one here'}];
  };

  $scope.showListing = function() {
    loadEvents();
    $location.path("events_list")
  };

  $scope.newEvent = function () {
    $location.path("events_new")
  }


}
