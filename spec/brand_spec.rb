require("spec_helper")

  describe(Brand) do
  #capitalize the first letter
       it("converts the first letter of name to uppercase") do
     brand= brand.create({:name => "finagle"})
     expect(brand.name()).to(eq("Finagle"))
   end


#validates prences of a name
    it("validates presence of a name") do
      brand =Brand.new({:name => ""})
       expect(brand.save()).to(eq(false))
     end
#redirects page whrn erroe is made
    describe(".errors") do
       it ("returns error message") do
         brand = Brand.new({:name => ""})
         expect(brand.errors()).to(eq(true))
       end
    end




  describe("#store") do
     it("tells which store it belongs to") do
       test_store = Store.create({:name => "list"})
       test_brand = Brand.create({:name => "task", :store_id => test_store.id})
       expect(test_brand.store()).to(eq(test_brand))
     end
   end
 end
