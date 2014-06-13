
// this is the Controller that handles the main page of the app
// it has a few buttons that traverse the different functionality in the app
var angularAppController = function ($scope, $location, $resource) {

  $scope.showEventsListing = function() {
    $location.path("events_list");
  };

  $scope.newEvent = function () {
    $location.path("events_new");
  }
};
