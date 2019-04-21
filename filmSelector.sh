#!/bin/sh

# pulls in a random film name from ./films.txt or from the command line (single quote multiple word titles)
# looks up teh film in the omdb API, and outputs teh fields I care about
# params:
#    film name (or part thereof) OPTIONAL
# created: 21-apr-19
# author: mccalni
# https://github.com/mccalni/films
#  
# depends:
#    registered at omdbapi.com and got an apikey and activated it
#    bash
#    curl
#    jq
#    quote.sh installed in /bin/ see https://github.com/mccalni/namshubs
#    items added to the films list are in the format film title ((+label)* (@project)* anything else you want to add)* - so if anything other than film title in the row, the first plus sign delimits the film title 
#       e.g matrix reloaded +sciFi +dystopian @wachowskis some other blurb that should make a snide ref to it not being as good as the first one
#       The format follows todo.txt faithfully except for askign that the film name be first then followed by zero or more plus signs. http://todotxt.org/
#       I use todo.txt http://todotxt.org/ to add films to the list. I have setup an alias f so I can type: f add point break +theGoodOne @swayze @petty @reeves @busey


OMDBKEY=yourKeyHere


if [ -z "${1}" ]
then
   # get random film name and strip out meta-data
   FILM=$(/bin/quote.sh ./films.txt)
else 
   FILM=$1
fi
echo $FILM

#get rid of annoying windows carriage returns ^M's, and the other stuff we don;t need to query the omdb
FILM=$(echo $FILM|sed 's/ +.*//;s/ /+/g;s///')

#echo "http://www.omdbapi.com/?t=$FILM\&apikey=$OMDBKEY"
#submit to omdb and pretty print json response (you can get xml response if you prefer &r=xml

curl -s "http://www.omdbapi.com/?t=$FILM\&apikey=$OMDBKEY" | jq '.Response, .Title, .Rated, .Year, .Runtime, .Genre, .Plot, .imdbRating'

# add where to watch
#https://www.justwatch.com/uk/search?q=paper%2Bplanes
#https://apis.justwatch.com/content/title/paper+planes/
# POST to this URL: https://apis.justwatch.com/content/titles/en_GB/popular/ query="film name" - still not working
