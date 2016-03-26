class List < ActiveRecord::Base

	belongs_to :user
	has_many :tasks, dependent: :destroy

	scope :privacy, -> {
	  where(:privacy => true)
	}

  scope :except_for_user, lambda { |user| where("user_id <> ?", user) }


end

