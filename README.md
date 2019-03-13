# skeleton-api

## Prerequisites

As we are using [GO modules](https://github.com/golang/go/wiki/Modules), which is a pretty new feature, you have to make sure you have `GO111MODULE=on` environmental variable exported.

Then, you can download all dependencies by running:

    go get

## Database

### Installation

We are using `PostgreSQL` database for the project but we are not limited to how can you use it on your local machine. You can either use a `Docker` container with `5432` port exposed or leverage a standalone [installation](https://www.postgresql.org/download/).

### Setup

For the database management, the following stack is used:

- `soda` - a small [CLI toolbox](https://gobuffalo.io/en/docs/db/toolbox) to manage the database
- `pop` - a [package](https://godoc.org/github.com/gobuffalo/pop) that makes it easy to do CRUD operations, run migrations, and build/execute queries
- `fizz` - a common [DSL](https://github.com/gobuffalo/fizz) for describing the database changes

To install all of these tools, you can just install dependencies as usual and do:

    go install github.com/gobuffalo/pop/soda

Once you have them installed, you may want to create and migrate your local database (make sure you have `$GOPATH/bin` in your system `$PATH`):

    soda create
    soda migrate

### Usage

To create a new migration, use the following command:

    soda generate FILE_TYPE name_of_migration

where `FILE_TYPE` can be either `fizz` or a raw `sql`.

Each time you want to upgrade your database, just perform:

    soda migrate up

And, analogously, to downgrade it, you can use:

    soda migrate down

To completely reset the entire database (drop and recreate its schema), do:

    soda migrate reset

## Code style

To keep the common styleguide within the entire codebase we use `gofmt` - a tool that automatically formats Go source code.

There are two scripts to help you with that:

1. `./scripts/lint.sh` is used to check whether you have some inconsistency across files
1. `./scripts/format.sh` does the actual formatting of the sourcecode

Additionally, you can leverage [`.editorconfig`](.editorconfig) file to help you editor automatically keep the consistency.
