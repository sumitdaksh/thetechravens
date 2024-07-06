require 'rails_helper'


RSpec.describe Product, type: :model do
  it 'is valid with valid attributes' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: 100)).to be_valid
  end

  it 'is not valid without a name' do
    expect(Product.new(name: nil, sku: '12345', price: 10.99, stock_quantity: 100)).to_not be_valid
  end

  it 'is not valid without a unique SKU' do
    Product.create(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: 100)
    expect(Product.new(name: 'Another Product', sku: '12345', price: 20.99, stock_quantity: 50)).to_not be_valid
  end

  it 'is not valid without a price' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: nil, stock_quantity: 100)).to_not be_valid
  end

  it 'is not valid without a stock quantity' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: nil)).to_not be_valid
  end

  it 'is not valid with a stock quantity less than 0' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: -1)).to_not be_valid
  end

  it 'is valid with a stock quantity of 0' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: 0)).to be_valid
  end

  it 'is valid with a stock quantity greater than 0' do 
    expect(Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: 1)).to be_valid
  end

  it 'is valid with a price of 0' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 0, stock_quantity: 100)).to be_valid
  end

  it 'is valid with a price greater than 0' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: 0.01, stock_quantity: 100)).to be_valid
  end

  it 'name is a string' do
    product = Product.new(name: 'Test Product', sku: '12345', price: 10.99, stock_quantity: 100)
    expect(product.name).to be_a(String)
  end

  it 'is not valid price is less than 0' do
    expect(Product.new(name: 'Test Product', sku: '12345', price: -1, stock_quantity: 100)).to_not be_valid
  end

end