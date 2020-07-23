require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app/", __FILE__)
require 'game'
require 'player'
$:.unshift File.expand_path("./../lib/view/", __FILE__)
require 'board'
require 'board_case'
require 'io/console'

game = Game.new.play #lance le jeu


