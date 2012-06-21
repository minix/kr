class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :present_id, :username
end
