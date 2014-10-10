namespace :db  do
  desc "Fill image_url for promos and brands that have been already created"
  task assign_stores: :environment do
    assign_stores
  end

  def assign_stores
    promos = Promo.all
    promos.each do |promo|
      brand = promo.brand
      promo.stores = brand.stores
      promo.save
    end
  end
end