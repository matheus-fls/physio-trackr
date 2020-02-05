require 'rails_helper'

RSpec.describe 'Measures API' do
  let!(:user) { create(:user) }
  let!(:measures) { create_list(:measure, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { measures.first.id }

  describe 'GET measures' do
    before { get "/users/#{user_id}/measures" }

    context 'when user exists' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all measures' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found msg' do
        expect(response.body).to match("Couldn't find User")
      end
    end
  end

  describe 'GET measures/:id' do
    before { get "/users/#{user_id}/measures/#{id}" }

    context 'when measure exists' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the measure' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when measure does not exist' do
      let(:id) { 0 }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found msg' do
        expect(response.body).to match("Couldn't find Measure")
      end
    end
  end

  describe 'POST measures' do
    let(:valid_attributes) { { 
      height: 100, 
      weight: 100, 
      bmi: 24, 
      bicep: 44, 
      chest: 77, 
      waist: 55,
      hips: 66,
      thigh: 33,
      calf: 22,
      user_id: 1,
      id: 1
    } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/measures", params: valid_attributes }

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when invalid request' do
      before { post "/users/#{user_id}/measures", params: {} }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure msg' do
        expect(response.body).to match("Validation failed: Height can't be blank, Weight can't be blank, Bmi can't be blank, Bicep can't be blank, Chest can't be blank, Waist can't be blank, Hips can't be blank, Thigh can't be blank, Calf can't be blank")
      end
    end
  end

  describe 'PUT users/measures' do
    let(:valid_attributes) { { weight: 99.0 } }

    before { put "/users/#{user_id}/measures/#{id}", params: valid_attributes }

    context 'measure exists' do
      it 'returns 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the weight' do
        updated_measure = Measure.find(id)
        expect(updated_measure.weight).to equal(99.0)
      end
    end

    context 'measure does not exist' do
      let(:id) { 0 }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found msg' do
        expect(response.body).to match("Couldn't find Measure")
      end
    end
  end

  describe 'DELETE users/id' do
    before { delete "/users/#{user_id}/measures/#{id}" }

    it 'returns 204' do
      expect(response).to have_http_status(204)
    end
  end
end
