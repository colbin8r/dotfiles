# Used for Hermes https://hermes-agent.nousresearch.com/

# Hermes Agent command
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

alias signal-restart='launchctl kickstart -k gui/$(id -u)/org.asamk.signal-cli'
