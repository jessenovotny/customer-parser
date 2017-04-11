class Customer < ApplicationRecord
	attr_accessor :children, :child
	# after_save :find_parents
	# belongs_to :parent, :class_name => 'Customer', :foreign_key => 'parent_id'
	# has_many :children, 



	def initialize
		super
		@children = []
		@child = false
	end


end
