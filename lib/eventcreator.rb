require_relative 'event'
require_relative 'date_parser'

class EventCreator
  def self.run
    puts "Salut, tu veux créer un événement ? Cool !"

    # Titre
    puts "Commençons. Quel est le nom de l'événement ?"
    title = gets.chomp

    # Date (avec parsing naturel)
    puts "Super. Quand aura-t-il lieu ? (ex : le 14 octobre à 15 h 30)"
    date_input = gets.chomp
    parsed_date = DateParser.parse(date_input)

    unless parsed_date
      puts "Désolé, je n'ai pas compris la date. Essaie avec un format comme : le 14 octobre à 15 h 30"
      return
    end

    # Durée
    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    duration = gets.chomp.to_i

    # Participants
    puts "Génial. Qui va participer ? Balance leurs e-mails (séparés par un point-virgule)"
    emails_input = gets.chomp
    attendees = emails_input.split(/\s*;\s*/)

    # Création de l'événement
    event = Event.new(parsed_date, duration, title, attendees)

    # Ajout à la liste globale d'événements
    $all_events ||= []
    $all_events << event

    # Confirmation
    puts "\nSuper, c'est noté, ton évènement a été créé !"
    puts "Voici les détails :"
    puts event.to_s
  end
end



