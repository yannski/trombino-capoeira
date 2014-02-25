class Capoeirist
  include Mongoid::Document
  
  CONSTANT_CORDAS = [ "debutant" => "crua",
                      "aluno" => ["crua-amarelo", "amarelo", "amarelo-laranja", "laranja", "laranja-azul"],
                      "graduado" => ["azul", "azul-verde", "verde", "verde-roxa"],
                      "instrutor" => ["roxa", "roxa-marron"], 
                      "professor" => ["marron", "marron-vermelha"],
                      "mestrando" => "vermelha",
                      "mestre" => ["vermelha-blanca", "blanca"] ]
  
  field :first_name, type: String
  field :last_name, type: String
  field :apelido, type: String
  field :age, type: Integer
  field :cord, type: String
  field :city, type: String
  field :country, type: String
  field :trainer, type: String
  
  validates :age, numericality: { even: true, allow_blank: true  }
  validates :cord, inclusion: { in: CONSTANT_CORDAS }, :allow_blank => true
  validate :firstname_or_apelido
  
  def firstname_or_apelido
    errors.add(:first_name_or_apelido, "Le prénom ou l'apelido doit être renseigné.") if first_name.blank? || apelido.blank?
  end
end