require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
    describe 'GET #index' do
        it 'returns a successful response' do
            get :index
            expect(response).to be_successful
        end
    end

    describe 'GET #show' do
        let(:product) { Product.create(name: 'New Product', price: 20 , sku: 'xyx', stock_quantity: 1) }

        it 'returns a successful response' do
            get :show, params: { id: product.id }
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        let(:valid_params) { { name: 'New Product', price: 20 , sku: 'xyx', stock_quantity: 1} }

        it 'creates a new product' do
            expect {
                post :create, params: { product: valid_params }
            }.to change(Product, :count).by(1)
        end

        it 'redirects to the product show page' do
            post :create, params: { product: valid_params }
            expect(response).to redirect_to(assigns(:product))
        end
    end

    describe 'PATCH #update' do
        let(:product) { Product.create( name: 'New Product', price: 20 , sku: 'xyx', stock_quantity: 1) }
        let(:updated_params) { { name: 'Updated Product', price: 15 } }

        it 'updates the product' do
            patch :update, params: { id: product.id, product: updated_params }
            product.reload
            expect(product.name).to eq('Updated Product')
            expect(product.price).to eq(15)
        end

        it 'redirects to the product show page' do
            patch :update, params: { id: product.id, product: updated_params }
            expect(response).to redirect_to(assigns(:product))
        end
    end

    describe 'DELETE #destroy' do
        let!(:product) { Product.create(name: 'New Product', price: 20 , sku: 'xyx', stock_quantity: 1) }

        it 'deletes the product' do
            expect {
                delete :destroy, params: { id: product.id }
            }.to change(Product, :count).by(-1)
        end

        it 'redirects to the products index page' do
            delete :destroy, params: { id: product.id }
            expect(response).to redirect_to(products_path)
        end
    end
end