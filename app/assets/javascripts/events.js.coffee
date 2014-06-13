app = angular.module 'Events', ['ngResource']

# factory to make resource calls one liners
# make sure to add the .json for this to work
app.factory 'Event', ($resource) ->
  $resource('/events/:id.json', {id: '@id'})

app.controller "EventsCtrl", @EventsCtrl = ($scope, Event) ->
  #example of a one liner call to get the events, this goes to events/index
  $scope.events = Event.query()

