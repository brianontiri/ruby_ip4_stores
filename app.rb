require("bundler/setup")
  Bundler.require(:default)
  also_reload("lib/**/*.rb")

  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file } #loading individual files when required

  #loads first web page 'index'
  get("/") do
    erb(:index)
  end

  get("/top") do
    @brands = Brand.all()
    @stores = Store.all()
    erb(:top)
  end

  get("/brands") do
    @brands = Brand.all()
    erb(:brands)
  end

  get("/stores") do
    @stores = Store.all()
    erb(:stores)
  end

  get("/stores/new") do
    erb(:stores_form)
  end

  get("/brands/new") do
    erb(:brand_form)
  end

  get('/stores/:id') do
    @brands = Brand.all()
    @store = Store.find(params.fetch("id").to_i())
    erb(:store_details)
  end

  get('/brands/:id') do
    @stores = Store.all()
    @brand= Brand.find(params.fetch("id").to_i())
    erb(:brand_details)
  end

  get("/stores/:id/edit") do
     @store = Store.find(params.fetch("id").to_i())
     erb(:store_update)
   end

   get("/brands/:id/edit") do
     @brand = Brand.find(params.fetch("id").to_i())
     erb(:brand_update)
   end


  post("/stores") do
    name = params.fetch("name")
    store= Store.new({:name => name, :id => nil})
    if store.save()
      redirect("/stores/".concat(store.id().to_s()))  #implemented redirecting functionality
    else
      erb(:errors) #catching errors
    end
  end

  post("/brands") do
    name = params.fetch("name")
    brand = Brand.new({:name => name, :id => nil})
    if brand.save()
      redirect("/brands/".concat(brand.id().to_s()))
    else
      erb(:errors) #catching errors
    end
  end


   patch("/stores/:id") do
     store_id = params.fetch("id").to_i()
     @store = Store.find(store_id)
     brand_id = params.fetch("brand_id")
     @store.update({:brand_ids => brand_id})
     @brands = Brand.all()
     redirect("/stores")
   end

   delete("/stores/:id") do
     @store = Store.find(params.fetch("id").to_i())
     if @store.destroy()
       redirect("/stores")
     else
       erb(:errors)
     end
   end

   delete("/brands/:id") do
     @brand = Brand.find(params.fetch("id").to_i())
     if @brand.destroy()
      redirect("/brands")
     else
       erb(:errors)
     end
   end
