install_ruby() {
  rbenv init
  rbenv install "$1"
  rbenv global "$1"
  eval "(rbenv init -)"
}

gem_update() {
  true
}

gem_install() {
  gem install "$1"
}
