class Post < ActiveRecord::Base
#    validates :title, presence: true
    #받았을 때, title이 존재하면 보냄
  belongs_to :user
end
