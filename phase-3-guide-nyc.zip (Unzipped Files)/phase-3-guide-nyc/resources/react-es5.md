# React ES5

```js
const Timeline = React.createClass({
  getInitialState: function() {
    return { tweets: [] };
  },

  componentDidMount: function() {
    this.fetchTweets();
  },

  fetchTweets: function() {
    $.ajax({
      url: '/tweets/recent',
      method: 'GET'
    })
    .done(function(response) {
      this.setState({
        tweets: response
      })
    }.bind(this))
  },

  render: function() {
    return (
      <section>
        <ul>
          {this.state.tweets.map(function(tweet) {
             return <Tweet />;
          })
        </ul>
      </section>
    )
  }
})
```