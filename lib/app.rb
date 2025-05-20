$all_events = []

require_relative 'user'
require_relative 'event'
require_relative 'eventcreator'
require_relative 'calendar_displayer'
require_relative 'date_parser'

# Exemple d'utilisation pour la classe User
julie = User.new("julie@email.com", 32, "sarlat")
bob = User.new("bob@email.com", 28, "paris")
riley = User.new("riley@riley.com", 7, "saran")

# Récupérer tous les utilisateurs
puts "\n--- Utilisateurs enregistrés ---"
User.all.each do |user|
  puts "Email: #{user.email}, Age: #{user.age}, City: #{user.city}"
end

# Création d'un événement de test
event = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
$all_events << event

puts "\n--- Événement de test ajouté ---"
puts event.to_s

# Recherche d'un utilisateur
puts "\nEntrez l'email de l'utilisateur que vous cherchez :"
input_email = gets.chomp
user_found = User.find_by_email(input_email)

if user_found
  puts "Utilisateur trouvé :"
  puts "Email : #{user_found.email}"
  puts "Âge : #{user_found.age}"
  puts "Ville : #{user_found.city}"
else
  puts "Aucun utilisateur trouvé avec l'email #{input_email}."
end

# Création d’un événement via l'utilisateur
puts "\nSouhaites-tu créer un événement ? (oui/non)"
response = gets.chomp.downcase

if response == "oui"
  EventCreator.run
else
  puts "Très bien, à une prochaine fois pour créer un événement !"
end

# Affichage du calendrier
puts "\nSouhaites-tu afficher le calendrier ? (oui/non)"
answer = gets.chomp.downcase

if answer == "oui"
  CalendarDisplayer.new($all_events).display

else
  puts "D'accord, à une prochaine fois pour consulter le calendrier !"
end
