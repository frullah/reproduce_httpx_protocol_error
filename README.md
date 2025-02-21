**Summary:**

In httpx 1.4.0, I encountered a `protocol error` when using persistent connection, retries plugin, and HTTP/2.

As I understand, this occurs when the connection times out and doesn’t re-establish (by retries plugin). However, it works fine in version 1.3.3.


**Steps to reproduce:**

1. Clone this repository: https://github.com/frullah/reproduce_httpx_protocol_error
```sh
git clone https://github.com/frullah/reproduce_httpx_protocol_error
``


2. Run HTTP/2 server:
```sh
(cd server && npm install && node app.js)
```

3. Simulate request:
```sh
export BUNDLE_GEMFILE=Gemfile.error
bundle install && bundle exec ruby request.rb

unset BUNDLE_GEMFILE
```

4. You should see an error: `Error occurred: protocol error`

**Expected behavior:** No error should occur, as observed with httpx 1.3.3. This can be verifiedd using the following script:
```sh
export BUNDLE_GEMFILE=Gemfile.works
bundle install && bundle exec ruby request.rb

unset BUNDLE_GEMFILE
```