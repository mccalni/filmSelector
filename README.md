<!-- toc -->

# INTRO
mccalni  
2019-04-21  
The usual stuff. Do what you like, but it ain't my fault. No warranty, no nothing. Be nice. See end of this file for CC0. 

## So, what is it? +theCat @redDwarf

Was driving us nuts, trying to remember which films we had on the children's list and then choosing one! Argh. This allows us to catch all the films we think of to watch, and pull out a random one 
from the list when we need it. 

In addition it looks up the film in the omdb API, and outputs the fields I care about. 

# SET IT UP

 1. register at [omdb API](https://omdbapi.com), get an apikey and activate it
 2. make sure you have bash, curl, and jq installed. This is a bash script!
 3. install (at least) quote.sh from my [namshub scripts](https://github.com/mccalni/namshubs)
 4. copy the films.txt and the randomFileSelect.sh files to a folder. I used ~/Dropbox/films/ so I can use on all my machines and share with my wife. 
 5. make the script executable  if it isn;t already:
```bash
chmod 755 randomFileSelect.sh
```
 6. setup a fr alias in ~/.bash_aliases  
```bash
$ cat ~/.bash_aliases  
alias fr='~/Dropbox/films/randomFilmSelect.sh'
source ~/.bash_aliases
```


# USING FilmSelector
## READ: 
  Type fr at the command line to get a film selection.
  Type fr 'some title' at the command line to lookup a specific film title 
 
## WRITE:
  1. use vi, vim, emacs, any text editor of your choice. On Android I currently use the Dropbox editor to edit the films.txt file. I will (one day) write an app that allows you add and select from a dedicated interface.

  2. items added to the films list are in the format film title ((+label)* (@project)* anything else you want to add)* - so if anything other than film title in the row, the first plus sign delimits the film title  
	e.g matrix reloaded +sciFi +dystopian @wachowskis some other blurb that should make a snide ref to it not being as good as the first one  
	  
The format follows [todo.txt](http://todotxt.org/) faithfully except for asking that the film name be first then followed by zero or more plus signs.  
	  
I use [todo.txt](http://todotxt.org/) to add films to the list. I have setup an alias f so I can type: 
```
f add point break +theGoodOne @swayze @petty @reeves @busey
```
## SYNC:
  I use Dropbox to sync the films.txt file across devices.

# TESTING
 I wrote it to run with bash on Ubuntu 18.04.2 LTS. I see no reason it won't work on anything else but YMMV.
 
# FURTHER WORK?

  - add a config file so can use with different files
  - add justwatch to tell you which streaming service it'll work on
  - all that other clever stuff you;re thinking - so fork it and add it if you like


# REFERENCES and Thanks
  - [todo.txt](http://todotxt.org/) a massive thank you to the excellent Gina Trapani for coming up with todo.txt and being generally inspiring.
  - [todo.txt reference](https://github.com/todotxt/todo.txt) is a todo.txt reference
  - Mindhacker - Ron Hale-Evans and Marty Hale-Evans - huge thanks to Ron and Marty for getting me thinking better
  - CommandLineFu, Waldiro, and the rest of the community for the sed info https://www.commandlinefu.com/commands/view/3802/to-print-a-specific-line-from-a-file
  - Snow Crash - Neal Stephenson - seriously, if you haven't read it, drop everything, right now, and go read it. Then read all his other books. 
  - my family - bearing with me while I got heavily sidetracked from choosing a film for everyone to watch....
  - [jbt's markdown editor](https://jbt.github.io/markdown-editor/) very nice MD editor

# LICENSE

This code is dedicated to the public domain to the maximum extent permitted by applicable law, pursuant to [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
