
#contient les informations nécessaires au lancement de notre serveur

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController