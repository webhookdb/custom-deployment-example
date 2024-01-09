# custom-deployment-example

Demonstration of how to assemble multiple [WebhookDB](https://github.com/webhookdb/webhookdb) gems into a single deployment.

Use this repo when you have to build redistributable replicators,
rather than forking the main repo and adding them to `replicator_ext`.

See <https://docs.webhookdb.com/guides/custom-integrations/#distributing-your-own-replicators>
for more information.

## Adding gems

Add `webhookdb` and other Gems to the `Gemfile`. See `Gemfile` for more details.

### Using gems from a private GitHub repo

You'll add something like this to your Gemfile:

```ruby
gem "webhookdb-enterprise", git: "https://github.com/webhookdb/webhookdb-enterprise.git", ref: "main"
```

To access a private repo, you need to generate a Fine Grained Access Token with the 'Content' read permission.
Or use a Personal Access Token.

Then in your build configuration (the environment variables available when you build yoru app,
whether in the Docker build, or Heroku, or whatever):

```
BUNDLE_GITHUB__COM=<token with 'github_pat_mylongtoken':x-oauth-basic
```

## Running integration tests

You can run the integration tests in the main WebhookDB repo:

```shell
$ INTEGRATION_TESTS=true RACK_ENV=development bundle exec rspec `bundle info webhookdb --path`/integration/
```

### Excluding non-production groups

You will need some gems (`faker`, `fluent_fixures`, `rspec`) available to run integraiton tests
on a staging/development server. But you probably don't want them on production.
In your build configuration, add the following (use whatever groups you do not want on production):

```
BUNDLE_WITHOUT=nonproduction
```
