#! /bin/bash
# Small script to automate setting up Git global configurations and copying RSA key automatically.

echo "Installing necessary packages..."
sleep 3
# for Ubuntu --> sudo apt-get install git xclip ssh -y
# for Arch
pacman -Sy --noconfirm xclip
echo " "
echo " "

echo "Setting up Git global configuration..."
sleep 3
git config --global user.name "Kadar Anwar"
git config --global user.email "kadaranwar07@gmail.com"
echo " "
echo " "

echo "Starting SSH agent..."
sleep 5
eval "$(ssh-agent -s)"
echo " "
echo " "

echo "Generating SSH key..."
sleep 5
echo | ssh-keygen -t rsa -b 4096 -C "kadaranwar07@gmail.com" -P ''
echo " "
echo " "

echo "Adding SSH key to SSH-Agent..."
sleep 5
mkdir /home/kadar/.ssh && ssh-add /home/kadar/.ssh/id_rsa
echo " "
echo " "

echo "Copying SSH key to clipboard"
sleep 5
xclip -sel clip < /home/kadar/.ssh/id_rsa.pub
echo " "
echo " "

echo "Setup complete. Can now paste the RSA key into GitHub account!"
sleep 5
