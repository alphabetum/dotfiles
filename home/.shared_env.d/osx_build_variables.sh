###############################################################################
# Build / Configure Environment Variables
###############################################################################

if is_osx; then
  export ARCHFLAGS='-arch x86_64'
  export CFLAGS='-arch x86_64'
  export LDFLAGS='-arch x86_64'
fi
