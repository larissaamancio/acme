class BookMark < ActiveRecord::Base #favoritos

	belongs_to :user
  belongs_to :list

	has_many :users, dependent: :destroy
	has_many :lists, dependent: :destroy
	
end