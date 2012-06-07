class Like < ActiveRecord::Base
  attr_accessible :likeable_id, :likeable_type, :user_id

end
