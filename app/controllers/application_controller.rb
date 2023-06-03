class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakery = Bakery.all
    bakery.to_json
  end

  get '/baked_goods' do
    baked_good = BakedGood.all
    baked_good.to_json
  end

  get '/bakeries/:id' do
    data = Bakery.find(params[:id])
    data.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    data = BakedGood.order(price: :desc)
    data.to_json
  end

  get '/baked_goods/most_expensive' do
    data = BakedGood.find_by(price: BakedGood.maximum("price"))
    data.to_json
  end


end
