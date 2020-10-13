require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"



sleep 2

puts "Rentre ton prénom :"
prenom = gets.chomp
user = HumanPlayer.new("#{prenom}")
puts "Salut #{prenom}"


enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José")]


while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

		sleep 3
		puts "------------------------------------"
		puts "Voici ton état :"
		sleep 1
		puts user.show_state
		sleep 3


		puts "Quelle action veux-tu effectuer ?"

		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"

		puts "attaquer un joueur en vue :"
		print "0 - " 
		print " #{player1.show_state}"
		print "1 - " 
		puts " #{player2.show_state}"

		reponse = gets.chomp
		if reponse == "a" 
			user.search_weapon
		elsif reponse == "s" 
			user.search_health_pack
		elsif reponse == "0" 
			user.attacks(player1)
		elsif reponse == "1"
			user.attacks(player2)
		end 
		sleep 2
		puts "Les autres joueurs t'attaquent !"
		enemies.each do |n|
			if n.life_points >= 0
				n.attacks(user)
			end
		 end

end 


puts  "La partie est finie" 

sleep 1

if user.life_points > 0   
	puts "BRAVO ! TU AS GAGNE !"
else player1.life_points > 0 || player2.life_points >0
	puts "Loser ! Tu as perdu !"
end




