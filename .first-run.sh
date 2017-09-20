#
# Sets up a brand-new Raspberry Pi
# Inspired by https://makezine.com/2017/09/07/secure-your-raspberry-pi-against-attackers/
#

# Create new sudo user and lock default 'pi' account
if [ $(whoami) = "pi" ]
then
  echo "-Creating new account 'boss'"
  sudo /usr/sbin/useradd --groups sudo -m boss
  echo "-Changing default password for 'boss'"
  sudo passwd boss
  echo "-Changing root password"
  sudo passwd root
  echo "Locking 'pi' user"
  sudo passwd --lock pi
  echo "-Please log back in as 'boss' and execute this script again!"
else
  echo "-Enabling 2-factor authentication"
  sudo apt-get update && sudo apt-get install -y libpam-google-authenticator
  google-authenticator 
fi 


