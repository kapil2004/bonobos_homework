require 'rails_helper'

RSpec.describe ProductsController, type: :request do

  describe "GET #search" do
    fixtures :products, :pieces, :styles

    it "responds successfully with a 200 status code" do
      get '/products/search'
      expect(response.status).to eq 200
    end

    it "responds with empty product when there is no match" do
      get "/products/search?term="
      product = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(product[:name]).to eq nil
    end

    it "responds with product when there is a exact match" do
      get "/products/search?term=washed chinos"

      product = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(product[:name]).to eq "washed chinos"
      expect(product[:pieces].size).to eq 5
      styles = product[:pieces].map{ |piece| piece[:style_name] }.uniq
      expect(styles).to eq ['jet blues', 'grey dogs']
    end

    it "responds with product when there is a fuzzy match" do
      get "/products/search?term=wish"

      product = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(product[:name]).to eq "washed chinos"
      expect(product[:pieces].size).to eq 5
      styles = product[:pieces].map{ |piece| piece[:style_name] }.uniq
      expect(styles).to eq ['jet blues', 'grey dogs']
    end
  end

end
