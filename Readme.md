# heroku-run-local

A heroku plugin to run a command locally with the config vars of a
heroku app.

### Installation

```bash
$ heroku plugins:install git://github.com/deafbybeheading/heroku-run-local.git
```

#### Update

```bash
$ heroku plugins:update git://github.com/deafbybeheading/heroku-run-local.git
```

### Usage

`heroku run:local COMMAND`

Note that if you use any direct environment variable references in your command,
you'll need to escape them or quote them. Otherwise, they will be interpreted by
your shell before being passed to the Heroku CLI. For example:

```bash
$ heroku run:local psql '$DATABASE_URL'
Pager usage (pager) is off.
psql (9.4beta2, server 9.3.5)
SSL connection (protocol: TLSv1.2, cipher: DHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

d6i28tbalesa80=>
```

(This is more or less equivalent to `heroku pg:psql DATABASE_URL`).

## THIS IS BETA SOFTWARE

Thanks for trying it out. If you find any problems, please report an
issue and include your Heroku toolbelt version and your OS version.
