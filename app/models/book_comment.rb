class BookComment < ApplicationRecord
	belongs_to :Book
	belongs_to :user
end
