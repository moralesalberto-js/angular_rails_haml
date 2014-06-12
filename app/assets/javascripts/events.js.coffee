app = angular.module 'Events', []

app.controller "EventsCtrl", @EventsCtrl = ($scope, $http) ->
  $http.get('/events.json').success (data) ->
    $scope.events = data

