require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET static_pages#about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET static_pages#dictionaries" do
    it "returns http success" do
      get :dictionaries
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #treatments_search" do
    it "returns http success" do
      get :treatments_search
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #units_search" do
    it "returns http success" do
      get :units_search
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #species_search" do
    it "returns http success" do
      get :species_search
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #diseases_search" do
    it "returns http success" do
      get :diseases_search
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help_page" do
    it "returns http success" do
      get :help_page
      expect(response).to have_http_status(:success)
    end
  end

end
