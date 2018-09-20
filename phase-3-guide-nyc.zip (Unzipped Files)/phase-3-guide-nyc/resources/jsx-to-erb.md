# JSX to ERB

## Display all tweets on screen (index.html.erb)

```erb
<div class="container">
  <% @tweets.each do |tweet| %>
    <%= render 'tweet', locals: {data: tweet}%>
  <% end %>
</div>
```

## React Component `ListTweets` (ListTweets.es6.jsx)

```js
class ListTweets extends React.Component {
  render(){
    let date = [{},{},{}]
    return(
      <ul>
        {
          this.props.data.map((tweet, idx) => {
            return (<Tweet key={idx} data={tweet}/>)
          })
        }
      </ul>
      )
  }
}
```
-------------------------------------------------

## Partial template for one tweet (_tweet.html.erb)

```erb
<li class="tweet">
  <img class="avatar" src= <%= data.avatar_url %> alt="" />
  <div class="tweet-content">
    <p>
      <span class="full-name"><%= data.username %></span>
      <span class="username"><%= data.handle %></span>
      <span class="timestamp">- 6m</span>
    </p>
    <p><%= data.content %></p>
  </div>
</li>
```


##React component `Tweet` (Tweet.es6.jsx)

```js
class Tweet extends React.Component{
    render(){
      let data = this.props.data
      return (
        <li className="tweet">
          <img className="avatar" src={data.avatar_url} alt="" />
          <div className="tweet-content">
            <p>
              <span className="full-name">{data.username}</span>
              <span className="username">{data.handle}</span>
              <span className="timestamp">- 6m</span>
            </p>
            <p>{data.content}</p>
          </div>
        </li>
      )
    }
}
```