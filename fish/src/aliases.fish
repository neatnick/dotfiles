# TODO: maybe different defaults depending on the directory
#       e.g. use the -t option to sort by time modified in Downloads
# look into CLICOLOR anc LC_COLLATE=C
function ll -d "Lists the contents of a directory with the prefered flags"
  command ls -AlFhOG $argv
end

# overwrite python to target python3
alias python="python3"
alias pip="pip3"


function hide -d "Hides a given file in finder"
  chflags hidden $argv
end

function show -d "Shows a given file in finder"
  chflags nohidden $argv
end


# right now just kills all .DS_Store files, maybe expand?
# also maybe start at root if it gets called with sudo
# TODO: can a function tell its calling user?
function cleanup
  find ~ -name ".DS_Store" -exec rm '{}' \;
end


# Aliases for quickly accessing and sourcing these files
function source_profile -d "Sources the config.fish file"
  set -l CUR_DIR (pwd)
  source ~/.config/fish/config.fish
  cd $CUR_DIR
end

function edit_profile -d "Opens the fish cofig files with atom"
  code ~/.config/fish
end


# Lists all globally installed npm packages
function npm-list-global -d "Lists all globally installed npm packages"
  npm list -g --depth=0
end


# Synergy Commands
function restart-synergy -d "Restarts the synergy background service"
  launchctl unload /Library/LaunchAgents/com.symless.synergy.synergy-service.plist
  sudo killall synergy-core
  launchctl load /Library/LaunchAgents/com.symless.synergy.synergy-service.plist
end
