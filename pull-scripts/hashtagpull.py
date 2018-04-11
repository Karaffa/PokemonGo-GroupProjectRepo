import twitter
from email.utils import parsedate
from time import strftime
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
api = twitter.Api(
    consumer_key='hYkPQ5KEiiW2DQ9C4j18zLxOr',
    consumer_secret='AIy3C3iLF0naKZwzqYpDVVPaJ4No9dHfhVfU3FNSXPMxm3JBZk',
    access_token_key='364225120-7ShlW2NuzNJsVbmLmnhFxrwutxtnjp3ZNTyyA8tP',
    access_token_secret='NmjeuLwV9OzgeASyFyIVPn5ySJwGNgsie57ZXfoZA4m78')

hashtags_to_track = [
    "#pokemongo",
]

results = api.GetStreamFilter(track=hashtags_to_track)

#results = api.GetSearch(
#        raw_query="q=twitter%20&result_type=recent&since=2018-04-04&count=30")
for line in results:
    timestamp = parsedate(line["created_at"])
    timetext = strftime("%H:%M:%S", timestamp)
    # Signal that the line represents a tweet
    if 'in_reply_to_status_id' in line:
        tweet = twitter.Status.NewFromJsonDict(line)

        # prints the username, tweet, and the time
        print("User: {user}, Tweet: '{tweet}', Time: '{time}'".format(
            user=tweet.user.screen_name,
            tweet=tweet.text,
            time=timetext))


