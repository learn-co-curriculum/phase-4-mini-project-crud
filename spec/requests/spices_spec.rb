require 'rails_helper'

RSpec.describe "Spices", type: :request do

  it "does not have any unused routes" do
    expect { get "/spices/1" }.to raise_error(ActionController::RoutingError)
  end

  describe "GET /spices" do
    before do
      Spice.create([
        {
          title: "Allspice",
          image: "allspice.jpg",
          description: "Allspice description",
          notes: "Allspice notes",
          rating: 3.5
        },
        {
          title: "Caraway Seeds",
          image: "caraway.jpg",
          description: "Caraway description",
          notes: "Caraway notes",
          rating: 2
        }
      ])
    end
  
    it 'returns an array of all spices' do
      get '/spices'

      expect(response.body).to include_json([
        {
          id: a_kind_of(Integer),
          title: "Allspice",
          image: "allspice.jpg",
          description: "Allspice description",
          notes: "Allspice notes",
          rating: 3.5
        },
        {
          id: a_kind_of(Integer),
          title: "Caraway Seeds",
          image: "caraway.jpg",
          description: "Caraway description",
          notes: "Caraway notes",
          rating: 2
        }
      ])
    end
  end

  describe "POST /spices" do
    let!(:spice_params) do
      {
        title: "Caraway Seeds",
        image: "caraway.jpg",
        description: "Caraway description",
        notes: "Caraway notes",
        rating: 2
      }
    end

    it 'creates a new spice' do
      expect { post '/spices', params: spice_params }.to change(Spice, :count).by(1)
    end

    it 'returns the spice data' do
      post '/spices', params: spice_params

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        title: "Caraway Seeds",
        image: "caraway.jpg",
        description: "Caraway description",
        notes: "Caraway notes",
        rating: 2
      })
    end

    it 'returns a status code of 201 (created)' do
      post '/spices', params: spice_params

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /spices/:id" do
    let!(:spice) do
      Spice.create(
        title: "Allspice",
        image: "allspice.jpg",
        description: "Allspice description",
        notes: "Allspice notes",
        rating: 3.5
      )
    end
    
    it 'updates the spice with the matching id' do
      patch "/spices/#{spice.id}", params: { rating: 1 }
      
      expect(spice.reload.rating).to eq(1)
    end

    it 'returns the spice data' do
      patch "/spices/#{spice.id}", params: { rating: 1 }

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        title: "Allspice",
        image: "allspice.jpg",
        description: "Allspice description",
        notes: "Allspice notes",
        rating: 1
      })
    end
  end

  describe 'DELETE /spices/:id' do
    it 'deletes the spice with the matching id' do
      spice = Spice.create(
        title: "Allspice",
        image: "allspice.jpg",
        description: "Allspice description",
        notes: "Allspice notes",
        rating: 3.5
      )

      expect { delete "/spices/#{spice.id}" }.to change(Spice, :count).from(1).to(0)
    end
  end

end
