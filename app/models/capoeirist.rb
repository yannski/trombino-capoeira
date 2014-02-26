class Capoeirist
  include Mongoid::Document
  
  CONSTANT_CORDAS = [ 
                      ["debutant", ["crua"]],
                      ["aluno", ["crua-amarelo", "amarelo", "amarelo-laranja", "laranja", "laranja-azul"]],
                      ["graduado", ["azul", "azul-verde", "verde", "verde-roxa"]],
                      ["instrutor", ["roxa", "roxa-marron"]], 
                      ["professor", ["marron", "marron-vermelha"]],
                      ["mestrando", ["vermelha"]],
                      ["mestre", ["vermelha-blanca", "blanca"]]
                    ]
  
  field :first_name, type: String
  field :last_name, type: String
  field :apelido, type: String
  field :birthday, type: String
  field :cord, type: String
  field :city, type: String
  field :country, type: String
  field :trainer, type: String
  field :facebook_url, type: String
  
  validates :birthday, :format => { with: /\d{2}\/\d{2}\/\d{4}/ }, :allow_blank => true, :allow_nil => true
  validate :multidimensional_cord
  validates :facebook_url, :format => URI::regexp(%w(http https)), :allow_blank => true, :allow_nil => true
  validate :firstname_or_apelido
  
  def multidimensional_cord
    errors.add(:cord, "Cette corde n'existe pas.") if cord && !CONSTANT_CORDAS.flatten.include?(cord)
  end
  
  def firstname_or_apelido
    errors.add(:first_name_or_apelido, "Le prénom ou l'apelido doit être renseigné.") if first_name.blank? && apelido.blank?
  end
end