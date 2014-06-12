NgApp -- Events
===============

This is a sample app combining rails4 and angular. This is a combination site that
allows the user to authenticate with regular http and html forms, then sets a user session.

Once logged in, the user is redirected to a page that serves and angular app.

The intent is for this app to combine both angular app(s) and rails http/html pages, both
working in unison, sharing the user session.

## Models
This application has a user model and an events table. A user authenticates and can 
see a calendar of events, can search for events and can create events.

### To run

```

bundle
rake db:migrate
rake db:seed
rails s

If you ran the db:seed, then you can sign-in as:
u: user1@test.com
p: 111

```



