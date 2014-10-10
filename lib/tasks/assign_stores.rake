namespace :db  do
  desc "Fill image_url for promos and brands that have been already created"
  task assign_stores: :environment do
    assign_stores
  end

  def assign_stores
    promos = Promo.all
    promos.each do |promo|
      brand = promo.brand
      brand.stores.each do |store|
        promo.stores << store
      end
    end
  end
end