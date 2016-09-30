# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/Ben/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/Ben/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
source ~/.config/fish/aliases.fish

set GOPATH $HOME/go

set PATH /Users/Ben /Users/Ben/.stack/programs/x86_64-osx/ghc-7.10.2/bin /Users/Ben/bin /usr/local/Cellar/cabal-install/1.22.0.0/bin /usr/local/Cellar/ghc/7.8.4/bin /usr/local/bin/arcanist/bin ./node_modules/.bin /Applications/Sublime Text.app/Contents/SharedSupport/bin /usr/bin /usr/local/bin /bin /usr/sbin /sbin
set PATH ./vendor/bin $PATH
set PATH /Users/Ben/.composer/vendor/bin $PATH
set PATH /Users/Ben/.local/bin $PATH
set PATH ~/.local/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH /usr/local/lib/python2.7/site-packages/requests $PATH
set PATH /usr/local/lib/python2.7/site-packages/supervisor $PATH
set PATH /Users/Ben/.stack/programs/x86_64-osx/ghc-7.10.2/bin $PATH
set PATH ~/.phpenv/bin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH ./scripts $PATH
set PATH ~/projects/google-cloud-sdk/bin $PATH

set EDITOR nvim
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH "$NPM_PACKAGES/bin:$PATH"
set MANPATH "$NPM_PACKAGES/share/man:(manpath)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/Ben/Downloads/google-cloud-sdk/path.bash.inc ]
  source '/Users/Ben/projects/google-cloud-sdk/path.bash.inc'
end

# The next line enables shell command completion for gcloud.
if [ -f /Users/Ben/Downloads/google-cloud-sdk/completion.bash.inc ]
  source '/Users/Ben/projects/google-cloud-sdk/completion.bash.inc'
end
