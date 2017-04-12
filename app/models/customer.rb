class Customer < ApplicationRecord
	attr_accessor :children, :child

	def initialize
		super
		@children = []
		@child = false
	end

end
