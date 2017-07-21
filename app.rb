require("bundler/setup")
  Bundler.require(:default)
  also_reload("lib/**/*.rb")

  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file } #loading individual files when required

  #loads first web page 'index'
  get("/") do
    erb(:index)
  end

  get("/start") do
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

  post("/stores") do
    name = params.fetch("name")
    store = Store.new({:name => name, :id => nil})
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
      erb(:success)
    else
      erb(:errors) #catching errors
    end
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

  patch("/stores/:id") do
    store_id = params.fetch("id").to_i()
    @store = Store.find(store_id)
    brand_ids = params.fetch("brand_ids")
    @store.update({:brand_ids => brand_ids})
    @brands = Brand.all()
    erb(:store_details)
  end

  # redirect code

  # delete('/tasks/:id') do
  #   @task = Task.find(params.fetch("id").to_i()
  #   if @task.destroy()
  #     redirect("/tasks")
  #   else
  #     erb(:task)
  #   end
  # end
