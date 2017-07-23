require("spec_helper")

  describe(Store) do

       it("converts the first letter of name to uppercase") do
     store= store.create({:name => "finagle"})
     expect(store.name()).to(eq("Finagle"))
   end

#validates prences of a name
    it("validates presence of a name") do
      srore =Store.new({:name => ""})
       expect(store.save()).to(eq(false))
     end

    describe(".errors") do
       it ("returns error message") do
        store=Store.new({:name => ""})
         expect(store.errors()).to(eq(true))
       end
    end

    it("ensures the length of the name is at most 10 characters") do
        client = Client.new({:name => "a".*(16)})
         expect(client.save()).to(eq(false))
       end


  describe("#brand") do
     it("tells which brand it belongs to") do
       test_brand = Brand.create({:name => "list"})
       test_store = Store.create({:name => "task", :brand_id => test_brand.id})
       expect(test_store.brand()).to(eq(test_store))
     end
   end
 end
