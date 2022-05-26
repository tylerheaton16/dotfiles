curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > $HOME/.local/bin/cs
chmod +x $HOME/.local/bin/cs
$HOME/.local/bin/cs setup
