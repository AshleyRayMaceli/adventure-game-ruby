	class Player
	attr_reader :name
	attr_accessor :health, :strength
	
	def initialize
		@name = "Warrior"
		@health = 100
		@strength = 80
	end
end

class AdventureTime
	attr_accessor :player, :rooms, :scenarios

	def initialize
		@player = Player.new
		@rooms = 10
		@scenarios = ["medicine", "enemy", "nothing"]
		start_game
	end

	def start_game
		puts ""
		puts "=============================="
		puts "Welcome #{self.player.name}! Your journey begins now!"
		puts "Your starting stats:"
		puts "HP: #{self.player.health}"
		puts "Strength: #{self.player.strength}"
		puts "=============================="
		puts ""
		enter_room
	end

	def enter_room
		while rooms > 0 do
		puts "Choose between door 1 and 2"
		user_input = gets.chomp.to_i
		if user_input == 1
			random_scenario
		else user_input == 2
			random_scenario
		end
		end

		case rooms
		when rooms = 0
			puts ""
			puts "=============================="
			puts "You have reached the end of your journey. You have become wiser and stronger, #{self.player.name}."
			puts "Your final stats:"
			puts "HP: #{self.player.health}"
			puts "Strength: #{self.player.strength}"
			puts "=============================="
			puts ""
			return false
		end
	end

	def random_scenario
	scenario = self.scenarios.shuffle.last
		if scenario == "medicine"
		medicine
		end
		if scenario == "enemy"
		enemy
		end
		if scenario == "nothing"
		nothing
		end
	end

	def fists_or_sword
		puts "You want to attack! Use your fists [1] or your sword [2]"
		attack_choice = gets.chomp.to_i
		if attack_choice == 1
			self.player.strength += rand(30..60)
			self.player.health -= rand(5..15)
			puts "Put 'em up! POW! SMACK! You hit the enemy! You gained some strength but hurt yourself a little in the process. No pain, no gain!"
			puts "HP: #{self.player.health}"
			puts "Strength: #{self.player.strength}"
		end
		if attack_choice == 2
			self.player.strength += rand(50..100)
			puts "You unleashed your sword and slayed the monster! Your strength has increased!"
			puts "Strength: #{self.player.strength}"
		end	
	end

	def medicine
	self.player.health += rand(50..100)
	puts "You picked up an elixir potion! Your total HP is now #{self.player.health} points!"
	self.rooms -= 1
	end

	def enemy
	puts "There is an enemy in here! You need to fight! Would you like to do? Attack (1) or defend (2)?"
	attack_or_defend = gets.chomp.to_i
		if attack_or_defend == 1
			fists_or_sword
		end
		if attack_or_defend == 2
			self.player.health -= rand(10..20)
			puts "You chose to defend! It only hurt you a little (HP: #{self.player.health}). You escaped safely."
		end
		self.rooms -= 1
	end

	def nothing
	puts "This room is empty. Let's go through another door."
	self.rooms -= 1
	end
end

AdventureTime.new