###############################################################################
# htop
#
# an interactive process viewer for Linux
#
# http://hisham.hm/htop/
#
# See also: $HOME/.htoprc
###############################################################################

# For htop to display correctly all running processes, it needs to run as root.
htop() {
  sudo htop "$@"
}
