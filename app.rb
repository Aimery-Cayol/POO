require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")


while player1.life_points > 0 && player2.life_points >0
		sleep 3
		puts "------------------------------------"
		puts "Voici l'état de chaque joueur :"
		sleep 3
		puts player1.show_state
		puts player2.show_state
		sleep 3
		puts "Passons à la phase d'attaque :"
		sleep 3
		puts player1.attacks(player2)
			if player2.life_points < 0
				break 
			end 
		sleep 3
		puts player2.attacks(player1)
end 
#binding.pry