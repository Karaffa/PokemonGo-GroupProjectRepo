import sys
reload(sys)
sys.setdefaultencoding('utf-8')
from TwitterSearch import *
try:
    tso = TwitterSearchOrder() # create a TwitterSearchOrder object
    tso.set_keywords(['#pokemongo']) # let's define all words we would like to have a look for
    
    tso.set_include_entities(False) # and don't give us all those entity information

    # it's about time to create a TwitterSearch object with our secret tokens
    ts = TwitterSearch(
        consumer_key = 'hYkPQ5KEiiW2DQ9C4j18zLxOr',
        consumer_secret = 'AIy3C3iLF0naKZwzqYpDVVPaJ4No9dHfhVfU3FNSXPMxm3JBZk',
        access_token = '364225120-7ShlW2NuzNJsVbmLmnhFxrwutxtnjp3ZNTyyA8tP',
        access_token_secret = 'NmjeuLwV9OzgeASyFyIVPn5ySJwGNgsie57ZXfoZA4m78'
     )

     # this is where the fun actually starts :)
    for tweet in ts.search_tweets_iterable(tso):
        print( '@%s tweeted: %s' % ( tweet['user']['screen_name'], tweet['text'] ) )

except TwitterSearchException as e: # take care of all those ugly errors if there are some
    print(e)
