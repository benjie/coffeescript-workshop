CoffeeScript/Node workshop
==========================

This workshop is only meant to be an hour long, so I'm afraid I'll be
rushing through quite a lot of stuff. Do feel free to ask me any
questions you have after the workshop. If you get stuck either ask your
neighbour or my lovely assistant Jem.

Getting this code
-----------------

Visit [GitHub.com/benjie/coffeescript-workshop][] (this is probably
redundant).

[Click through to releases][] in the bar above.

Download the Zip file of the latest release and unzip it somewhere -
e.g. your Desktop - rename it to `csworkshop`

(Please note if you're familiar with git you're more than welcome to
clone the repository instead of downloading the zip.)

Getting Node Running
--------------------

### Windows

Grab and install this: [Node Windows Installer][].

Then go to Start > Programs > Node.js and run Node.js Command Prompt.

Change into the `csworkshop` folder on your Desktop with:

    > cd Desktop
    > cd csworkshop

### Mac

Homebrew? Good on you: `brew install node`

Otherwise: [Node Mac Installer][].

Then open a terminal (or iTerm if you're blessed with awesomeness) to
the `csworkshop` folder - the easiest way to do this is to drag the folder
onto your Terminal icon.

### Linux

DON'T install Node 0.6.x from your repos, it's ridiculously out of date!

Simplest is to use [nvm](https://github.com/creationix/nvm) to download and manage your nodejs

Here's two ... one-liners for yo terminal, so open it up...

    wget -qO- https://raw.github.com/creationix/nvm/v0.4.0/install.sh | sh

now close your terminal ... and open it again (yes, really. reopen it)

    nvm install 0.10 && nvm alias default 0.10 && echo "My nodejs should be installed, here's the version:" && node -v

You're too damn cool for me to have to tell to have a terminal open,
right? Probably the only reason you're running X is so you can give your
terminal a pretty background...

... I miss Linux. Anyway, `cd` into the `csworkshop` directory.

### All platforms

Now you're in your platforms terminal/console, please run the following
commands:

    npm install -g coffee-script nodemon node-inspector
    npm install
    node index.js

Connecting
----------

You should be able to browse to [localhost:3333][] and be greeted with a
traditional programming phrase.

There are these other pages available too:

* [/shout/words_go_here][] - capitalise text from the URL
* [/delay/5000][] - wait for it... *gee, 5 seconds is long in internet
  time*
* [/count/27][] - count from 1 to 27
* [/fibonacci/19][] - the 19th Fibonacci number

[Node Windows Installer]: http://nodejs.org/dist/v0.10.26/node-v0.10.26-x86.msi
[Node Mac Installer]: http://nodejs.org/dist/v0.10.26/node-v0.10.26.pkg
[Node Linux Binaries]: http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x86.tar.gz
[GitHub.com/benjie/coffeescript-workshop]: https://github.com/benjie/coffeescript-workshop
[Click through to releases]: https://github.com/benjie/coffeescript-workshop/releases
[localhost:3333]: http://localhost:3333/
[/shout/words_go_here]: http://localhost:3333/shout/words_go_here
[/delay/5000]: http://localhost:3333/delay/5000
[/count/27]: http://localhost:3333/count/27
[/fibonacci/19]: http://localhost:3333/fibonacci/19
