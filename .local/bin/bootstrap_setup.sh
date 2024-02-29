#!/bin/bash bash

setup_asdf(){
  echo '__asdf__'
}


setup_yaml_lg_server(){
  git clone https://github.com/redhat-developer/yaml-language-server.git ~/.cache/yaml-language-server
  cd ~/.cache/yaml-language-server || exit
  if [ -x "$(command -v yarn )" ]
  then
    npm install --global yarn
  fi
  yarn install && yarn run build
}

setup_yaml_lg_server
setup_asdf
