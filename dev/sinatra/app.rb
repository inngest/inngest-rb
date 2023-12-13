#!/usr/bin/env ruby

require "sinatra"
require "json"
require "uri"
require "net/http"

dummy = {
  url: "http://localhost:4567/api/inngest",
  v: "0.1",
  deployType: "ping",
  sdk: "ruby:v0.0.1",
  framework: "sinatra",
  appName: "InngestApp",
  functions: [
    {
      id: "dummy",
      name: "Dummy",
      triggers: [
        {event: "test/dummy"}
      ],
      steps: {
        step: {
          id: :step,
          name: :step,
          runtime: {
            type: :http,
            url: "http://localhost:4567/api/inngest?fnId=dummy&step=step"
          },
          retries: {attempts: 3}
        }
      }
    }
  ]
}

before do
  content_type 'application/json'
end

get "/hello" do
  {message: "HELLO WORLD!!!"}.to_json
end

put "/api/inngest" do
  uri = URI("http://127.0.0.1:8288/fn/register")
  req = Net::HTTP::Post.new(uri, {"Content-Type" => "application/json"})
  req.body = dummy.to_json

  resp = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end

  case resp
  when Net::HTTPSuccess, Net::HTTPRedirection
    # OK
    puts resp.body
  else
    puts resp.value
  end
end
