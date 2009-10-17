class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post_id
end
