echo "Welcome to TANTO's builder & do-all script!"
echo "🗡️    "
if [ ! -e tails ]
then
	pwd
	echo "tails dir not found, ergo∴"
	echo "Cloning Tails\' git index..."
	git clone https://git-tails.immerda.ch/tails
fi
echo "Attempting to update tails..."
cd tails
git pull
echo ""
echo "Attempting to checkout 'devel' branch..."
git checkout devel
echo "  Δ Updating sumodules..."
git submodule update --init
echo ""
echo "Checking for remote live-build branch..."
git branch --list --remotes --all | grep live-build
for REMOTE in `git branch --list --remotes --all | grep live-build`
do
echo "Found:" $REMOTE
sleep 0.1
done
sleep 9
echo
echo "Forking latest live-build branch to build T.A.N.T.O..."
git checkout --track $REMOTE
echo
sleep 0.5
echo
echo "Checking for tails' build dependencies:"
sudo apt install psmisc git rake libvirt-daemon-system dnsmasq-base ebtables qemu-system-x86 qemu-utils vagrant vagrant-libvirt vmdebootstrap
echo "Did it work? Are you root?"
sleep 0.3
echo
echo "  Grabbing an icon..."
curl https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Tanto_Kunimitsu.jpg/165px-Tanto_Kunimitsu.jpg > mini-tanto.jpg
git add *
sleep 0.1
echo
echo "Restarting libvirtd..."
sudo systemctl restart libvirtd
echo
sleep 0.5
echo
echo "Running additional checks for Tails' build system..."
echo
#!/bin/bash
# Trying this from tails' documentation
for group in kvm libvirt libvirt-qemu ;
do
	sudo adduser "$(whoami)" "$group"
done
# That's supposed to set the righ permissions, right there^
echo "♥"
sleep 0.8
echo
echo "Creating new branch \"tanto\" for T.A.N.T.O. Linux..."
git branch tanto
echo "Done working with the \`tails\` repo!"
git status
echo
git branch
cd ..
sleep 9
echo
echo "   -==============================================-   "
echo "T.A.N.T.O. is The Amnesic Network Toolkit for Offense."
echo "   -==============================================-   "
echo
sleep 9
echo
echo "Checking dependencies..."
echo
which sdmem
sleep 0.1
sudo apt install secure-delete -y
which sdmem
sdmem -fllv
echo
sleep 1
echo "MSG:Success.RAM_WIPED.Win!"
echo 
sleep 3
echo "<Insert Confetti Party Emojis Here>🗡️   🗡️   🗡️   "
sleep 1
echo ""
echo "Moving on to Kali..." && sleep 1
echo "CTRL+C now before it tries to mirror all of Kali\'s repos."
sleep 1
echo "9..."
sleep 1
echo "8..."
sleep 1
echo "7..."
sleep 1
echo "6..."
sleep 1
echo "5..."
sleep 1
echo "4..."
sleep 1
echo "3..." && sleep 1 && echo "2..." && sleep 1 && echo "1..."
sleep 1
#TODO: Maybe consider only grabbing the live-build scripts,
# and save the full git mirror for a cronjob on the gitLab CI server.
mkdir kali
echo "Mirroring or updating all Kali packages via git..."
cd kali
for LINE in `curl http://git.kali.org/gitweb/?a=project_index | sort | cut -d " " -f 1`
do
	if [ ! -e "kali/`echo $LINE | awk -F. '{print $1}'`" ]
	then
		git clone git://git.kali.org/$LINE
	else
		cd $LINE
		git pull
		cd ..
	fi
done
