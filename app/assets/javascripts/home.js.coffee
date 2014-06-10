# This code corresponds to partitioning Angular
# to see if it is more modular to create angular apps
# for each of the resources in this app

# This is the home controller, and it defines the 'name' model
# and it is used in the view
#
# The view has a div that defines the ng-app as 'Home'
# then it wraps everything in a controller it calls 'HomeCntl'
# wich corresponds to this controller

app = angular.module 'Home', []

app.controller "HomeCntl", @HomeCntl = ($scope) ->
  $scope.name = 'Angular ng'
