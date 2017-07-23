class Store < ActiveRecord::Base
	has_many :stores_shoes
    has_many :brands, through: :stores_shoes #creating many to many relationship.

	#validates the number of characters input by the user.
	validates(:name, {:presence => true, :length => { :maximum => 10}})


		#changes the input to  the first latter to capital.
	before_save(:uppercase_name)

	private

	      define_method(:uppercase_name) do
	        self.name=(name().capitalize())
	      end

end
