
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






class HumanPlayer < Player 
	attr_accessor :weapon_level

	def initialize (name)
		@name = name 
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		print @name
		print " a "
		print @life_points
		print " points de vie et une arme de niveau "
		puts @weapon_level
	end 


	def compute_damage 
		rand(1..6) * @weapon_level
	end 

	def search_weapon
		level = rand(1..6) 
		puts "Tu as trouvé une arme de niveau #{level}"
			if level > @weapon_level 
				@weapon_level = level
				puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
			else level < @weapon_level
				puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
			end
	end


	def search_health_pack
		rando = rand(1..6)
			if rando == 1
				puts "Tu n'as rien trouvé... "
			elsif rando.between?(2, 5) 
				@life_points = @life_points +50
				if @life_points >= 100
					@life_points = 100
				puts "Bravo, tu as trouvé un pack de +50 points de vie !"
				end
			elsif rando == 6
				@life_points = @life_points +80
				if @life_points >= 100
					@life_points = 100
				puts "Waow, tu as trouvé un pack de +80 points de vie !"
				end
			end 
		end 






end 

#binding.pry

#puts "end"

