
The penn-memo-3.1 is our final version this time, and penn-memo-3.2 is a version for cuncumber test, so you can test all our features for now in penn-memo-3.1.

We have made some default memos and tags for you to see our features more clearly, you can see them by using command rake db:seed.

And we can distinguish admins and regular users now, but only in rails console can you change the user to be an admin for now.

When you sign up, it is a sign up page for all regular users, you can change the user into an admin in console, take the first user as an example:

open console first:
$ rails c

choose the first user:
$ u = User.first

change parameter admin to be true
$ u.admin = true

save this admin
$ u.save

and then if you run “rails s” and log in as u again, you can enter the admin page to edit memos.

