# Visual Studio Code

This configuration for Visual Studio Code is compatible with both Linux and macOS.

Only some of the files are tracked in the `bindle` git repository, but the
additional files will be generated by Visual Studio Code at runtime.

This location within the `.config` directory is already the default for Linux,
but macOS will require this directory be symlinked from
`~/Library/Application Support/Visual Studio Code`. This should be accomplished
using the following command:

    bindle customize vscode

This will run the script found in
[`${BINDLE_PATH}/script/customize/vscode`
](https://github.com/alphabetum/dotfiles/blob/master/script/customize/vscode)
