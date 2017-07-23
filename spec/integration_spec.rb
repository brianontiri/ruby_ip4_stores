require('spec_helper')

describe('adding a new store', {:type => :feature}) do
    it('allows a user to click a store to see the brands and details for it') do
      visit('/stores/new')
      # click_button('Add New store')
      fill_in('name', :with =>'Akim')
      click_button('Add')
      expect(page).to have_content('Success!')
    end
  end
  #functionality to view all stores
  describe('viewing all of the stores', {:type => :feature}) do
    it('allows a user to see all of the stores that have been created') do
      store = Store.new({:name => 'Akim', :id => nil})
      store.save()
      visit('/')
      click_link('Stores')
      expect(page).to have_content(store.name)
    end
  end
  #functiionality to see a single store
  describe('seeing details for a single store', {:type => :feature}) do
    it('allows a user to click a store to see the brandsand details for it') do
      test_store = Store.new({:name => 'Jane', :id => nil})
      test_store.save()
      test_brand = Brand.new({:name => " Kimani", :salon_id => test_store.id()})
      test_brand.save()
      visit('/stores')
      click_link(test_store.name())
      expect(page).to have_content(test_brand.name())
    end
  end
 #functionality to add a brand to  a store
  describe('adding brands to a store', {:type => :feature}) do
    it('allows a user to add a brand to a store') do
      test_store = Store.new({:name => 'Jane ', :id => nil})
      test_store.save()
      visit("/add")
      fill_in("Brand", {:with => "Kimani"})
      click_button("Add Brand")
      expect(page).to have_content("Success!")
    end
  end
