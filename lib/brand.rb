class Brand < ActiveRecord::Base
	has_many :stores_shoes
    has_many :stores, through: :stores_shoes #creating many to many relationship

	#Active Record Validations making sure the form is not submitted blank
	validates(:name, :presence => true)

	#changes the input to capitileze_name
	before_save(:titlecase_name)

private

    define_method(:titlecase_name) do
      self.name = (name().capitalize())
    end
end
