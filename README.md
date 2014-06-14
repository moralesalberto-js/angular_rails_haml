# NgApp -- My Calendar Events

This is a sample app combining rails4 and angular. It leverages the information found at:

* http://vaporbase.com/postings/integrating-angular-dot-js-with-rails-part-2
* https://github.com/Jaco-Pretorius/angular-rails
* http://www.jacopretorius.net/2013/04/using-ngresource-with-angularjs.html

In this example app, the user is able to authenticate with regular http and html forms,
then sets a user session. Once logged in, the user is redirected to a page that serves
an angular app, where the user can create, view, update events in a calendar.

The intent is for this app to combine both angular app(s) and rails http/html pages, both
working in unison, sharing the user session.


## I want to see it working RIGHT NOW

OK, then do the following:

```
bundle
rake db:migrate
rake db:seed
rails s

If you ran the db:seed, then you can sign-in as:
u: user1@test.com
p: 111

```


## Detailed Information


### Rails
This application has a User model and an Event (calendar event) model. There is a
SessionsController to manage authentication. This authentication is leveraged both
for rails and angular requests.

### Angular
The javascript directory structure looks like this:

```
| app
| -- assets
| ---- application.js
| ---- angular_application.js
| ---- angular_controllers
| ------ angular_app_controller.js
| ------ event_controller.js

```

### angular_application.js
The intent is to be able to serve both a conventional rails app and the angular application
from the same server. So we have two separate javascripts that get compiled:

* application.js
* angular_application.js

The compiler directive for the asset pipeline is defined in /config/initializers/assets.rb
shown below. There is also teaspoon and jasmine to for testing.

``` ruby
Rails.application.config.assets.precompile += %w( angular_application.css angular_application.js )
Rails.application.config.assets.precompile += %w( teaspoon.css )
Rails.application.config.assets.precompile += %w( jasmine/1.3.1.js )
Rails.application.config.assets.precompile += %w( teaspoon-jasmine.js )
Rails.application.config.assets.precompile += %w( teaspoon-teaspoon.js )
```

### Angular Controllers -- Actions actually
The part that seemed confusing is the concept of Controllers in Angular. Controllers are functions
that are usually used in the mapping of a route to a controller and a template. So in rails
that is more commonly associated with a Controller action not the controller. So in the routes
I map controller_actions rather than just the controller.

``` js
angularApp.config(function ($routeProvider, $httpProvider) {

  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

  $routeProvider.when('/events_list', {
    controller: 'eventsController.action.indexAction', templateUrl: 'events_list.html'
  });

  $routeProvider.when('/events_new', {
    controller: 'eventsController.action.newAction', templateUrl: 'events_new.html'
  });

});
```

The eventsController namespace looks like this:

```
var eventsController = function () {

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
      loadEvents($scope, $resource); // get the events from the server

      $scope.deleteEvent = function(theEvent) { // function that gets bound to the Delete button
        theEvent.$delete(); 
        loadEvents($scope, $resource);
      };
    },

    newAction : function ($scope, $resource, $location) {
      constructNewEvent($scope); // prepare the newEvent object

      $scope.save = function () { // function that gets bound to the button Save
        $resource('/events/:id.json').save($scope.theEvent);// Save the new calendar event to the server
        $location.path('/events_list'); // send them back to the listing
      };

    }

  };

  var self = {
    action : actionNamespace
  };

  return self;

}.call();
```


