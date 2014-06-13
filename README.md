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
I want to create a familiar feel to the directory structure found in rails. I also want to
have the ability to have the concept of controller 'actions', rather than just a controller.
Read on, to understand how that is setup.

### angular_application.js
The intent is to be able to serve both a conventional rails app and the angular application
from the same server. So we have two separate javascripts that get compiled:

* application.js
* angular_application.js

The compiler directive for the asset pipeline is defined in /config/initializers/assets.rb
shown below:

```
Rails.application.config.assets.precompile += %w( angular_application.css angular_application.js )
Rails.application.config.assets.precompile += %w( teaspoon.css )
Rails.application.config.assets.precompile += %w( jasmine/1.3.1.js )
Rails.application.config.assets.precompile += %w( teaspoon-jasmine.js )
Rails.application.config.assets.precompile += %w( teaspoon-teaspoon.js )
```

