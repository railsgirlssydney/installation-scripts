set -e

echo "Installs Homebrew for installing other software"
/usr/bin/ruby -e "$(/usr/bin/curl -fsSkL raw.github.com/mxcl/homebrew/go)"

echo "Installs Git"
brew install git

echo "Updates Homebrew"
brew update


echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
curl -kL get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Install Ruby"
rvm install 2.6.3
rvm use 2.6.3 --default

gem install bundler --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

echo -n "Should be brew 2.1.9 or higher:       brew "
brew -v
echo -n "Should be git 2.22.0 or higher:           "
git --version
echo -n "Should be sqlite 3.24.0 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.29.9 or higher:          "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10
echo -n "Should be ruby 2.6.3:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 5.2.3 or higher:         "
rails -v
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions
don't match or errors are shown, something went wrong with the automated process
and we will help you do the installation the manual way at the event.

Congrats!"
