.PHONY: dev
dev:
	ruby dev/sinatra/app.rb

.PHONY: test
test:
	bundle exec rake

.PHONY: fmt
fmt:
	bundle exec standardrb --fix
