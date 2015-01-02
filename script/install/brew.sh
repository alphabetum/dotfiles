#!/usr/bin/env bash

# Install programs and applications using Homebrew and Homebrew Cask.

# http://brew.sh/
# http://caskroom.io/

###############################################################################
# Homebrew - Update
###############################################################################

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

###############################################################################
# Homebrew - Taps
#
# `brew tap` allows you to add more Github repos to the list of formulae that
# brew tracks, updates and installs from.
#
###############################################################################

# alphabetum-taps
#
# My custom taps.
#
# https://github.com/alphabetum/homebrew-taps
brew tap alphabetum/taps

# homebrew-completions
#
# Shell completion formulae for the Homebrew package manager
#
# https://github.com/Homebrew/homebrew-completions
brew tap homebrew/completions

# homebrew-dupes
#
# These formulae duplicate software provided by OS X, though may provide more
# recent or bugfix versions.
#
# https://github.com/Homebrew/homebrew-dupes
brew tap homebrew/dupes

# homebrew-games
#
# Game formulae for the Homebrew package manager
#
# https://github.com/Homebrew/homebrew-games
brew tap homebrew/games

# homebrew-head-only
#
# These formulae are unversioned (they have no stable release) so are only
# available as the latest version from e.g. a version control system.
#
# https://github.com/Homebrew/homebrew-head-only

brew tap homebrew/head-only

# homebrew-science
#
# These formulae provide software tailored to scientific endeavours. Need to
# store large amounts of data in a sparse matrix, solve a huge optimization
# problem or process the images from your space telescope? Maybe we can help!
#
# https://github.com/Homebrew/homebrew-science
brew tap homebrew/science

# brew-desc.rb
#
# Searchable descriptions for Homebrew formulas
#
# https://github.com/telemachus/homebrew-desc
brew tap telemachus/homebrew-desc

###############################################################################
# Homebrew - Formula
###############################################################################

# ----------------------------------------------------------------------------
# Utilities and Basic Programs
# ----------------------------------------------------------------------------

# GNU Core Utilities
#
# For using in place of outdated OS X versions.
#
# https://www.gnu.org/software/coreutils
#
# NOTE: To use, add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# moreutils
#
# moreutils is a growing collection of the unix tools that nobody thought to
# write long ago when unix was young, eg, `sponge`.
#
# http://joeyh.name/code/moreutils/
brew install moreutils

# findutils
#
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
#
# http://www.gnu.org/software/findutils/
brew install findutils

# GNU sed
#
# sed (stream editor) isn't an interactive text editor.
#
# https://www.gnu.org/software/sed/
#
# NOTE: overwriting the built-in `sed`
brew install gnu-sed --default-names


# GNU Bash
#
# Bash 4. Newer than OS X default.
#
# http://www.gnu.org/software/bash/
#
# NOTE: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# GNU wget
#
# GNU Wget is a free software package for retrieving files using HTTP, HTTPS
# and FTP, the most widely-used Internet protocols.
#
# https://www.gnu.org/software/wget/
#
# NOTE: including support of IRIs, Internationalized Resource Identifiers,
# which are similar to URI, but allow unicode charaters to be used.
brew install wget --with-iri

# RingoJS and Narwhal.
#
# Ringo is a CommonJS-based JavaScript runtime written in Java and based on the
# Mozilla Rhino JavaScript engine.
#
# http://ringojs.org
#
# Narwhal is a cross-platform, multi-interpreter, general purpose JavaScript
# platform. It aims to provide a solid foundation for building JavaScript
# applications, primarily outside the web browser. Narwhal includes a package
# manager, module system, and standard library for multiple JavaScript
# interpreters.
#
# https://github.com/280north/narwhal
#
# NOTE: the order in which these are installed is important. See:
# http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# ----------------------------------------------------------------------------
# More recent versions of some OS X tools.
# ----------------------------------------------------------------------------

brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

###############################################################################
# brew.d
###############################################################################

# Load all files in brew.d if it exists.
_brewd="$DOTFILES/script/install/brew.d"
if [ -e "$_brewd" ]; then
  for f in "$_brewd"/*
    do
      source "$f"
  done
fi

###############################################################################
# Homebrew - Linking
###############################################################################

# linkapps
#
# link apps installed with homebrew. Pass the `--local` flag in order to
# symlink apps to ~/Applications.
#
# NOTE: first unlinking apps to cleanup old links that apparently sometimes
# stick around.
brew unlinkapps --local
brew linkapps --local

###############################################################################
# Homebrew Cask
###############################################################################

# install brew cask
brew install caskroom/cask/brew-cask


###############################################################################
# Homebrew Cask - Taps
#
# `brew tap` allows you to add more Github repos to the list of formulae that
# brew tracks, updates and installs from.
###############################################################################

# homebrew-cask-versions
#
# Alternate versions of Casks for homebrew-cask
#
# https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions

# Caskroom-fonts
#
# Caskroom-fonts is a Homebrew Tap which allows you to use the same friendly
# Homebrew-style CLI workflow for the administration of binary font files on
# your Mac.
#
# https://github.com/caskroom/homebrew-fonts
brew tap caskroom/fonts

###############################################################################
# Homebrew Cask - Fonts
###############################################################################

# Sauce Code Powerline
#
# Source Code Pro is a set of monospaced OpenType fonts that have been designed
# to work well in coding environments. This family of fonts is a complementary
# design to the Source Sans family. Sauce Code Powerline is derived from Source
# Code Pro for Powerline users.
#
# https://github.com/powerline/fonts/tree/master/SourceCodePro
brew cask install font-sauce-code-powerline

###############################################################################
# Homebrew Cask - Applications
###############################################################################

# VirtualBox
#
# VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product.
#
# http://www.virtualbox.org
#
# NOTE: Installing first since it's important and other casks use it.
brew cask install virtualbox

# Amethyst
#
# Tiling window manager for OS X similar to xmonad, written in pure
# Objective-C.
#
# http://ianyh.com/amethyst/
brew cask install amethyst

# Android Studio
#
# https://developer.android.com/sdk/index.html
brew cask install android-studio

# Atom
#
# A hackable text editor for the 21st Century.
#
# http://atom.io
brew cask install atom

# Brackets
#
# Adobe's open source text editor built with and focused on web technologies.
#
# http://brackets.io
brew cask install brackets

# Breach
#
# A new modular browser. Entirely written in Javascript. Free. Hackable.
#
# http://breach.cc
brew cask install breach

# Cakebrew
#
# The Mac App for Homebrew.
#
# http://www.cakebrew.com
brew cask install cakebrew


# Cargo
#
# Cargo is a tool that allows Rust projects to declare their various
# dependencies, and ensure that you'll always get a repeatable build.
#
# https://crates.io/
brew cask install cargo

# Codebox
#
# Open source cloud & desktop IDE.
#
# https://www.codebox.io
brew cask install codebox

# Consul
#
# Consul is a tool for service discovery, monitoring and configuration.
#
# http://www.consul.io/
brew cask install consul

# Elm
#
# A functional reactive language for interactive applications
#
# http://www.elm-lang.org
brew cask install elm-platform

# Gimp
#
# GIMP is the GNU Image Manipulation Program. It is a freely distributed piece
# of software for such tasks as photo retouching, image composition and image
# authoring.
#
# http://www.gimp.org
brew cask install gimp

# GnuCash
#
# GnuCash is open source personal and small-business financial-accounting
# software.
#
# http://www.gnucash.org
brew cask install gnucash

# The Haskell Platform
#
# http://www.haskell.org/platform/
brew cask install haskell-platform

# Inkscape
#
# Inkscape is an open-source vector graphics editor similar to Adobe
# Illustrator, Corel Draw, Freehand, or Xara X that used Scalable Vector
# Graphics (SVG), an open XML-based W3C standard, as the native format.
#
# https://inkscape.org/en/
brew cask install inkscape

# iTerm2
#
# iTerm2 is a replacement for Terminal and the successor to iTerm.
#
# http://www.iterm2.com/
brew cask install iterm2-nightly

# KindleGen
#
# KindleGen is a command line tool which enables publishers to work in an
# automated environment with a variety of source content including HTML, XHTML
# or EPUB. KindleGen converts this source content to a single file which
# supports both KF8 and Mobi formats enabling publishers to create
# great-looking books that work on all Kindle devices and apps.
#
# http://www.amazon.com/gp/feature.html?docId=1000765211
brew cask install kindlegen

# Light Table
#
# A text editor and IDE build with JavaScript.
#
# http://www.lighttable.com/
# https://github.com/LightTable/LightTable
brew cask install lighttable

# MacTex
#
# MacTeX is an OS X-specific redistribution of TeX Live, a typesetting
# environment.
#
# http://www.tug.org/mactex/
brew cask install mactex

# Packer
#
# Packer is a tool for creating identical machine images for multiple platforms
# from a single source configuration.
#
# http://www.packer.io/
brew cask install packer

# pd-extended - PureData
#
# Pure Data (aka Pd) is an open source visual programming language. Pd enables
# musicians, visual artists, performers, researchers, and developers to create
# software graphically, without writing lines of code.
#
# http://puredata.info/
# http://puredata.info/downloads/pd-extended
brew cask install pd-extended

# pgAdmin
#
# pgAdmin is the most popular and feature rich Open Source administration and
# development platform for PostgreSQL
#
# http://pgadmin.org
brew cask install pgadmin3

# Secrets
#
# A database of hidden settings for Mac OS X
#
# http://secrets.blacktree.com
brew cask install secrets

# Spectacle
#
# Move and resize windows with ease. Window control with simple, customizable
# keyboard shortcuts.
#
# http://spectacleapp.com
brew cask install spectacle

# Vagrant
#
# Create and configure lightweight, reproducible, and portable development
# environments.
#
# http://www.vagrantup.com
brew cask install vagrant

# Vico
#
# Vico is a programmers text editor with a strong focus on keyboard control and
# uses vi key bindings.
#
# http://www.vicoapp.com
brew cask install vico

# VimR
#
# A Vim GUI for OS X
#
# http://vimr.org/
brew cask install vimr

# VLC - vlc-nightly
#
# VLC is a free and open source cross-platform multimedia player and framework
# that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and
# various streaming protocols.
#
# http://www.videolan.org/vlc/
brew cask install vlc-nightly

# Zed
#
# Zed is a fully offline-capable, open source, keyboard-focused, text and code
# editor for power users.
#
# http://zedapp.org
brew cask install zed


###############################################################################
# Docker
#
# https://www.docker.com/
#
# Installing last because it requires a multi-step process and depends on
# casks.
###############################################################################


brew install boot2docker
# To have launchd start boot2docker at login:
#     ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
# Then to load boot2docker now:
#     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
brew install docker

###############################################################################
# Cleanup
###############################################################################

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

###############################################################################
# Application Aliasing
#
# Custom brew commands for creating spotlight-recognizable application aliases.
#
# Uses the alias-app command line tool: https://github.com/alphabetum/alias-app
###############################################################################

brew aliasapps
brew cask aliasapps
