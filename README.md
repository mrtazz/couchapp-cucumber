# cucumber scaffold for testing couchapps

## What it is
Couchapps are a great way to write web applications served directly by CouchDB.
Cucumber is a great way to test web applications in BDD manner. Naturally
these two belong together.

## What it does
Couchapps are tested with cucumber and selenium. Before each scenario, the
CouchDB `authentication_db` is changed so that the default `_users` db is not
touched by the tests. The names and logins are customizable in
`features/support/database.yml`.

## Contribute
If you want to contribute:

- Fork the project.
- Make your feature addition or bug fix.
- Commit
- Send me a pull request. Bonus points for topic branches

## Thanks
[Alex Lang](http://alex.io/) and [Lena Herrmann](http://lenaherrmann.net/) for
writing about testing couchapp/CouchDB, which was a lot of help.
