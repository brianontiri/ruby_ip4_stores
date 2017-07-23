class Brand < ActiveRecord::Base
	has_many :stores_shoes
    has_many :stores, through: :stores_shoes #creating many to many relationship

	#Active Record Validations making sure the form is not blank.
	validates(:name, :presence => true)

	#changes the input to  the first latter to capital.
	before_save(:uppercase_name)

private

    define_method(:uppercase_name) do
      self.name = (name().capitalize())
    end
end
