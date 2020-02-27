class Card
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String

end