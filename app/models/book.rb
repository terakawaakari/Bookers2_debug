class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	has_many :likes, dependent: :destroy

	def likes_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
