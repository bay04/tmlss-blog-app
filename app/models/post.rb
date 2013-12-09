class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 2 }
	validates :body, presence: true, length: { in: 2..1000 }
end
