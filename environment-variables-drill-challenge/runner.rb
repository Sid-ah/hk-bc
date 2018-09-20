require 'octokit'

def user_recap(user)
  <<-TEXT.gsub(/^\s+/, "")
    Your GitHub username is #{user.login}.
    You have #{user.followers} followers on GitHub.
    You are following #{user.following} users.
  TEXT
end


# Create the client object which will make requests to the GitHub API,
# using an access token to authenticate as a specific user.
client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])


# Use the client to request data for the authenticated user.
user = client.user
puts user_recap(user)
