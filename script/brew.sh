#!/usr/bin/env bash

# Install command-line tools using Homebrew.
#
# SUDO note: original script includes sudo commands. Currently disabling since
# homebrew is better without sudo. For information about which commands have
# been disabled or called again without sudo, see commented lines starding with
# SUDO

## Ask for the administrator password upfront.
# SUDO - DISABLE SUDO
#sudo -v

## Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
# SUDO - DISABLE SUDO
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# SUDO - DISABLE SUDO
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# SUDO - ENABLE WITHOUT SUDO
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install ngrep
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install zopfli

brew tap homebrew/completions

brew install elinks
brew install elixir
brew install flow
brew install htop
brew install hub
brew install leiningen
brew install lesspipe
brew install lua
brew install lynx
brew install macvim
brew install memcached
brew install mercurial
brew install mit-scheme
brew install node # also installs npm
brew install nvm
brew install ocaml
brew install opam
brew install pandoc
brew install rbenv
brew install redis
brew install riak
brew install scala
brew install siege
brew install sphinx
brew install stow
brew install tmux
brew install tmuxinator-completion
brew install the_silver_searcher
brew install wine
brew install winetricks


# install brew cask
brew install caskroom/cask/brew-cask

brew cask install virtualbox

brew cask install android-studio
brew cask install atom
brew cask install brackets
brew cask install breach
brew cask install cakebrew
brew cask install gnucash
brew cask install kindlegen
brew cask install lighttable
brew cask install mactex
brew cask install vimr
brew cask install secrets
brew cask install vagrant
brew cask install vico

# docker
brew install boot2docker
# To have launchd start boot2docker at login:
#     ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
# Then to load boot2docker now:
#     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
brew install docker


# Remove outdated versions from the cellar.
brew cleanup
