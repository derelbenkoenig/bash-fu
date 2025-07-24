alias l='ls -AlF'


# open IDE from terminal, but detach from terminal (inherit env vars from shell... I think)
alias idea='nohup idea >/dev/null & disown %%'
alias clion='nohup clion >/dev/null & disown %%'
alias pycharm='nohup pycharm >/dev/null & disown %%'

alias off='shutdown now'

# shorthand for rebuild java projects
alias mbuild='mvn clean install -DskipTests -Dcobertura.skip -Dmaven.clover.skip -Dcheckstyle.skip'
alias grebuild='./gradlew spotlessApply clean build'

alias view='vim -R'

alias rtfm='man'
alias info='info --vi-keys'

# fixed-string grep, recursive, ignore binary files, include line numbers
alias frep='grep -rFIn'

# edit a script that you have on your path, wherever it is (often ~/bin or /usr/local/bin)
function pathvim {
	vim $(which $1)
}

# print stuff to terminal with syntax highlighting... I think I only use the first one
alias highlight='highlight -O xterm256'
alias source-highlight='source-highlight -f esc256'

# BitWarden functions
function loadBwSession {
	if [ -f ~/.bwsession ] ; then
		export BW_SESSION="$(cat ~/.bwsession)"
	fi
}

function bwLogin {
	touch ~/.bwsession
	chmod 600 ~/.bwsession
	bw login --raw > ~/.bwsession \
		&& export BW_SESSION="$(cat ~/.bwsession)"
}

function bwLogout {
	rm -f ~/.bwsession
	bw logout
}

function bwList {
	bw list items | jq -r '.[].name'
}

# print millisecond timestamp... sometimes acts funny within command substitution
function millis {
	echo "$(($(date $@ +%s%N) / 1000000))"
}

function trd {
	local arg
	case "$1" in
		"" | eol ) arg='\r\n' ;;
		* ) arg="$1" ;;
	esac
	tr -d "$arg"
}

function in-all-panes {
	local WINDOW
	local PANE
	for WINDOW in $(tmux list-windows -F '#I'); do
		for PANE in $(tmux list-panes -t ${WINDOW} -F '#D'); do
			tmux send-keys -l -t $PANE "$@"
			tmux send-keys -t $PANE Enter
		done
	done
}

function namew-dir {
    tmux renamew ${PWD##*/}
}
