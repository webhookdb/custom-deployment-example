install:
	bundle install
release:
	bundle exec foreman start release
run:
	bundle exec foreman start web
run-workers:
	bundle exec foreman start worker
integration-test:
	INTEGRATION_TESTS=true RACK_ENV=development bundle exec rspec `bundle info webhookdb --path`/integration/
pry:
	@bundle exec pry
