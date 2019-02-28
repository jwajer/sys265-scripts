#SECURE-SSH.SH
#AUTHOR JWAJER
#Creates a new ssh user called $user
#Adds a public key to that users authorized keys file
#Removes roots ability to ssh in

#Creating a user of a given username
echo -e "What user do you want to add?: \c "
read user
sudo useradd $user
echo user  $user was created
sudo mkdir /home/$user/.ssh

#Copies the public key from my directory to directory of the new user
sudo cp /home/jackson/sys265-scripts/linux/public-keys/sys265.pub /home/$user/.ssh/authorized_keys

#Modifies directory permissions appropriately
sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo chown -R $user:user /home/$user/.ssh

#Disables root login
sudo printf' \n%s\n' 'PermitRootLogin no' >> /etc/ssh/sshd_config
sudo systemctl restart sshd
echo permit root login disabled

echo test123
