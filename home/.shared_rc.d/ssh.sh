###############################################################################
# ssh.sh
#
# SSH shell settings.
#
# See also: $HOME/.ssh
###############################################################################

# generate_ssh_config
#
# Usage:
#   generate_ssh_config
#
# Description:
#   Combine the contents of `.ssh/config.d` and `.ssh/default.sshconfig` into
#   a `.ssh/config` file that is then used as the config file for `ssh`.
#
#   This function can be called directly in order to manually generate a new
#   `.ssh/config` file, since commands other than `ssh` will use the
#   generated configuration.
generate_ssh_config() {
  printf "\
###############################################################################
# .ssh/config
#
# This is a generated ssh config file that is created by a wrapper around the
# \`ssh\` command in order to combine multiple ssh config files.
#
# WARNING: DO NOT EDIT THIS FILE DIRECTLY. IT WILL BE OVERWRITTEN.
#
# More information: ~/.shared_rc.d/ssh.sh
###############################################################################
" > ~/.ssh/config
  cat ~/.ssh/config.d/* >> ~/.ssh/config
  cat ~/.ssh/default.sshconfig >> ~/.ssh/config
}

# generate_ssh_key
#
# Usage:
#   generate_ssh_key "user@host.tld"
#
# Description:
#   Generates an ssh key. The generated file uses the following format:
#     <local.host>_<remote_user>@<remote host>_id_rsa
#     <local.host>_<remote_user>@<remote.host>_id_rsa
#
#   More information: http://askubuntu.com/a/423297
generate_ssh_key() {
  [[ -z "${1:-}" ]] && printf "<user@host.tld> required.\n" && return 1
  local _local_host
  local _username
  local _remote_host

  _local_host="$(hostname)"
  _remote_host="$(echo "${1}" | awk -F '@' '{print $2}')"
  if [[ -z "${_remote_host:-}" ]]
  then
    _remote_host="$(echo "${1}" | awk -F '@' '{print $1}')"
    ssh-keygen \
      -t rsa \
      -b 4096 \
      -C "${_remote_host}_id_rsa" \
      -f "${HOME}/.ssh/${_local_host}_${_remote_host}_id_rsa"
  else
    _username="$(echo "${1}" | awk -F '@' '{print $1}')"
    ssh-keygen \
      -t rsa \
      -b 4096 \
      -C "${_username}@${_remote_host}_id_rsa" \
      -f "${HOME}/.ssh/${_local_host}_${_username}@${_remote_host}_id_rsa"
  fi
}

# Alias `ssh` to a function that combines the contents of `.ssh/config.d` and
# `.ssh/config` into a `.ssh/config-all` file that is then used as the config
# file for `ssh`.
#
# More information: http://superuser.com/q/247564
_SSH_CMD="$(which ssh)"
ssh() {
  generate_ssh_config
  "$_SSH_CMD" "$@"
}
