# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Municipes', type: :request do
  let(:municipe) { create(:municipe) }
  let(:valid_attributes) { attributes_for(:municipe) }
  let(:invalid_attributes) { attributes_for(:municipe, full_name: nil) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get municipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_municipe_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_municipe_url(municipe)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new municipe' do
        expect do
          post municipes_url, params: { municipe: valid_attributes }
        end.to change(Municipe, :count).by(1)
      end

      it 'redirects to the created municipe' do
        post municipes_url, params: { municipe: valid_attributes }
        expect(response).to redirect_to(municipes_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new municipe' do
        expect do
          post municipes_url, params: { municipe: invalid_attributes }
        end.not_to change(Municipe, :count)
      end
    end
  end

  describe 'PUT /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:municipe, full_name: 'New Name') }

      it 'updates the requested municipe' do
        put municipe_url(municipe), params: { municipe: new_attributes }
        municipe.reload
        expect(municipe.full_name).to eq('New Name')
      end

      it 'redirects to the municipe' do
        put municipe_url(municipe), params: { municipe: new_attributes }
        municipe.reload
        expect(response).to redirect_to(municipes_url)
      end
    end

    context 'with invalid parameters' do
      it 'renders a unprocessable entity response' do
        put municipe_url(municipe), params: { municipe: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end
end
