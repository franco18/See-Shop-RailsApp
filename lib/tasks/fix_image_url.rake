namespace :db  do
  desc "Fill image_url for promos and brands that have been already created"
  task fix_image_url: :environment do
    fix_brands
    fix_promos
  end

  def fix_brands
    brands = Brand.all
    brands.each do |brand|
      brand.image_url = brand.avatar.url
      brand.save
    end
  end

  def fix_promos
    promos = Promo.all
    promos.each do |promo|
      promo.image_url = promo.image.url
      promo.save
    end
  end
end