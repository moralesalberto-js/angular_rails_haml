
app = angular.module 'Projects', []

app.controller "ProjectsCtrl", @PostsCtrl = ($scope, $http) ->
  $http.get('/projects.json').success (data) ->
    $scope.projects = data
