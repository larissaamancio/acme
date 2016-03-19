class Task < ActiveRecord::Base 
	#attr_accessble :text

	belongs_to :list
end