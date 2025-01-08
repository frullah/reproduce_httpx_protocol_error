require "httpx"

puts "HTTPX version: #{HTTPX::VERSION}"

connection = HTTPX.
  # retries request when connection is closed.
  plugin(:retries, max_retries: 1, retry_change_requests: true).
  with(
    origin: "http://localhost:3100",
    fallback_protocol: "h2", # HTTP/2
    persistent: true,
  )

response = connection.get("")
JSON.parse(response.body)

sleep 1 # delay to make connection timeout. See `http2SessionTimeout` in server/app.js

response = connection.get("")
if response.is_a?(HTTPX::ErrorResponse)
  puts "Error occurred: #{response.error.message}"
else
  puts "No error occurred"
  puts "Response: #{response.body}"
end

