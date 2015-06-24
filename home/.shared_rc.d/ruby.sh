###############################################################################
# Ruby
###############################################################################

# `ruby` on its own launches irb. Have `ruby` call `irb` when there is no
# argument.
ruby_or_irb() {
  if [ -z "$1" ]; then
    irb
  else
    ruby "$@"
  fi
}
alias ruby="ruby_or_irb"