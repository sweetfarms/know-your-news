class News < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :title, scope: :user_id
end
