
require 'pry'



class Player
	attr_accessor :name, :life_points

	def initialize (name)
		@name = name 
		@life_points = 10
	end



	def show_state
		print @name
		print " a "
		print @life_points
		puts " points de vie."
	end 


	def gets_damage(int)
		@life_points = @life_points - int 

		if @life_points <= 0
			puts "Le joueur #{@name} est mort !"
		end 
	end 


	def attacks(player)
		puts "Le joueur #{@name} attaque le joueur #{player.name}"
		damages = compute_damage
		sleep 1
		puts "il lui inflige #{damages} points de dommages"
		player.gets_damage(damages)

	end

	def compute_damage
		return rand(1..6)
	end










end


#binding.pry




