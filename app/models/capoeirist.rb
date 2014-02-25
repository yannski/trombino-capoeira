class Capoeirist
  include Mongoid::Document
  
  CONSTANT_CORDAS = [ "débutant" => "crua",
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
  
  validates :age, numericality: { even: true }
  validates :cord, inclusion: { in: CONSTANT_CORDAS }
end