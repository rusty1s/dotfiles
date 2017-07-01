install_ruby() {
  rbenv init
  rbenv install "$1"
  rbenv global "$1"
  eval "(rbenv init -)"
}

gem_install() {
  gem install "$1"
}
