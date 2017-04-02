Notes
=====

Here are some notes as I am using this project to learn some Elixir.

References
----------

https://github.com/mmmries/sqlitex

Elixir
------

### Repl spinning up this application

    iex -S  mix

### Some basic usage of sqlitex

    Sqlitex.with_db('test/fixtures/golfscores.sqlite3', fn(db) ->
      Sqlitex.query(db, "SELECT * FROM players ORDER BY id LIMIT 1")
    end)
    
    Sqlitex.with_db('test/fixtures/golfscores.sqlite3', fn(db) ->
      Sqlitex.query(
        db, 
        "INSERT INTO players (name, created_at, updated_at) VALUES ($1, $2, $3, $4)", 
        bind: ['Mikey', '2012-10-14 05:46:28.318107', '2013-09-06 22:29:36.610911'])
    end)

### Cowboy

Get documentation

    git clone https://github.com/ninenines/cowboy.git
    cd cowboy
    pacaur -S asciidoc dblatex
    make docs
    ls doc/ examples/


Sqlite
------

### List tables

    SELECT name FROM sqlite_master WHERE type='table'

# API Blueprint 

Examples of how I intend this REST API to behave

## Overall db info [/]

### List tables [GET]

+ Request JSON Message

    + Headers

            Accept: application/json

+ Response 200 (application/json)

    + Headers

            X-My-Message-Header: 42

    + Body

            [
              "some_table",
              "another_table"
            ]
