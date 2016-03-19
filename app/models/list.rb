class List < ActiveRecord::Base
	#att_accessible :name, :privacy

	belongs_to :user
	has_many :tasks, dependent: :destroy
end