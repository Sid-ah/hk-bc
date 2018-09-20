# If React were Written in Ruby

```ruby
class Timeline << React::Component {
  def initialize(props) {
    super(props)
    @state = { tweets: [] }
  }

  def component_did_mount() {
    self.fetchTweets();
  }

  def fetch_tweets() {
    open('/tweets/recent') do |response|
      self.setState({tweets: response})
    end
  }

  def render() {
    # Assumes JSX exist in Ruby
    return (
      <section>
        <ul>
          <% @state.tweets.each do |tweet| %>
            <Tweet data=<% tweet %> />
          <% end %>
        </ul>
      </section>
    );
  }
}
```