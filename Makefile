.PHONY: dev
dev:
	ruby dev/sinatra/app.rb

.PHONY: test
test:
	bundle exec rake

.PHONY: fmt
fmt:
	bundle exec standardrb --fix

PHONY: inngest-dev
inngest-dev:
	inngest-cli dev -v -u http://127.0.0.1:4567/api/inngest
