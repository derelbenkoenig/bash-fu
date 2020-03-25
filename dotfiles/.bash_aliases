alias l='ls -AlF'

# copy to clipboard
alias clip='xclip -sel clip'

# take screenshot, save to predictable path
function snip {
	scrot $@ '/home/rbenson/Pictures/Screenshot-%Y-%m-%d-%H-%M-%S.png'
}

# open IDE from terminal, but detach from terminal (inherit env vars from shell... I think)
alias idea='nohup idea >/dev/null & disown %%'
alias clion='nohup clion >/dev/null & disown %%'
alias pycharm='nohup pycharm >/dev/null & disown %%'

# also, browsers
alias firefox='nohup firefox &>/dev/null & disown %%'
alias google-chrome='nohup google-chrome &>/dev/null & disown %%'

alias off='shutdown now'

# shorthand for rebuild java projects
alias mbuild='mvn clean install -DskipTests -Dcobertura.skip -Dmaven.clover.skip -Dcheckstyle.skip'
alias grebuild='./gradlew spotlessApply clean build'

# generate and view coverage report for maven project with cobertura
function covfefe {
	mvn clean install cobertura:cobertura -Dcobertura.haltOnFailure=false && \
		firefox target/site/cobertura/index.html
}

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
		export BW_SESSION=$(cat ~/.bwsession)
	fi
}

function bwLogin {
	touch ~/.bwsession
	chmod 600 ~/.bwsession
	# not sure if this umask is actually useful
	( umask 177 ; bw login --raw > ~/.bwsession \
		&& export BW_SESSION=$(cat ~/.bwsession) )
}

function bwLogout {
	rm -f ~/.bwsession
	bw logout
}

# print millisecond timestamp... sometimes acts funny within command substitution
function millis {
	echo "$(($(date $@ +%s%N) / 1000000))"
}

# start zookeeper and kafka (you must kill kafka before killing zookeeper, and don't forget to
# kill these before you try to shut down the machine, or else it will take a long time to shut down
function startKafka {
	$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
	sleep 8;
	$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties &
}

function stopKafka {
	kill %2
	wait %2
	kill %1
	wait %1
}
