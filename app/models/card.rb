class Card
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String
  field :user, type: String

  def to_hash
    {
      id:     id.to_s,
      status: status,
      user:   user
    }
  end

end