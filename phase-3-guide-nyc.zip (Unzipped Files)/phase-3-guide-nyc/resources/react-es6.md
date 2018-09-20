# React ES6

```js
class Timeline extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: []
    };
    this.fetchTweets = this.fetchTweets.bind(this);
  }

  componentDidMount() {
    this.fetchTweets();
  }

  fetchTweets() {
    $.ajax({
      url: '/tweets/recent',
      method: 'GET'
    })
    .done((response) => {
      this.setState({
        tweets: response
      })
    })
  }

  render() {
    return (
      <section>
        <ul>
          {this.state.tweets.map((tweet) => <Tweet />)}
        </ul>
      </section>
    );
  }
}
```