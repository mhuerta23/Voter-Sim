class People
  attr_accessor :name

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end

# class Player < People
# end

class World < People
  def initialize
    @politicians = [] # Stores all politicians
    @voters = [] # Stores all voters
  end

  def main_menu
    puts "**** Welcome to Voter Sim 2016****"
    puts
    puts '*' * 50
    puts "What would you like to do?"
    puts "[C]:Create, [L]:List, [U]:Update, or [D]:Delete?"
    option = gets.chomp.downcase
    case option
    when "c" then create
    when "l" then list
    when "u" then update
    when "d" then delete
    else
      puts "That is not an option."
      puts
      main_menu
    end
  end

  def create # create voter or politician profile
    puts
    puts "What profile type would you like to create?"
    puts "[V]:Voter or [P]:Politician?"
    person = gets.chomp.downcase
    case person
    when "v"
      puts
      puts "Name?"
      voter_name = gets.chomp.downcase
      puts
      puts "Politics?"
      puts "[L]:Liberal, [C]:Conservative, [T]:Tea Party, [S]:Sociailist, or [N]:Neutral?"
      politics = gets.chomp.downcase
      case politics
      when "l"
        politics = "Liberal"
      when "c"
        politics = "Conservative"
      when "t"
        politics = "Tea Party"
      when "s"
        politics = "Socialist"
      when "n"
        politics = "Neutral"
      else
        puts "That's not an option, please enter again."
        create
      end
      voter = People.new(voter_name, politics) # creates new voter object
      @voters << voter # pushes new voter to Voters array
      puts
      puts "New voter added!"
      puts
      main_menu
    when "p"
      puts
      puts "Name?"
      pol_name = gets.chomp.downcase
      puts
      puts "Party?"
      puts "[D]:Democrat or [R]:Republican?"
      party = gets.chomp.downcase
      case party
      when "d"
        party = "Democrat"
      when "r"
        party = "Republican"
      else
        puts "That's not an option, please enter again."
        create
      end
      politician = People.new(pol_name, party) # creates new politician object
      @politicians << politician # pushes new politicians to Politicians array
      puts
      puts "New politician added!"
      puts
      main_menu
    else
      puts
      puts "That's not an option."
      create
    end
  end
  # finish
end

fresh_start = World.new
fresh_start.main_menu
