#SECURE-SSH.SH
#AUTHOR JWAJER
#Creates a new ssh user called $1
#Adds a public key to that users authorized keys file
#Removes roots ability to ssh in

echo -e "What user do you want to add?: \c "
read user
sudo useradd $user

echo $user was created

sudo mkdir /home/$user/.ssh

sudo cp /home/jackson/sys265-scripts/linux/public-keys/SYS265Test.pub /home/$user/.ssh/authorized_keys

sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo chown -R $user:user /home/$user/.ssh

sudo printf' \n%s\n' 'PermitRootLogin no' >> /etc/ssh/sshd_config
sudo systemctl restart sshd
echo permit root login disabled
