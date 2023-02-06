class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    

    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    expensive_goods = BakedGood.all.order(price: :desc)
    expensive_goods[0].to_json
  end
end
