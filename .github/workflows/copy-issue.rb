require 'octokit'

puts ENV.fetch("src_repo")
puts ENV.fetch("src_repo_token")
puts ENV.fetch("dst_repo")
puts ENV.fetch("dst_repo_token")

def fetch_token(key)
  token = ENV.fetch(key, "")
  # 空文字だと401 Bad Credentials
  token.empty? ? nil : token
end

src_client = Octokit::Client.new(access_token: fetch_token("src_repo_token"))
src_client.auto_paginate = true
src_repo = ENV.fetch("src_repo")

dst_client = Octokit::Client.new(access_token: fetch_token("dst_repo_token"))
src_client.auto_paginate = true
dst_repo = ENV.fetch("dst_repo")
