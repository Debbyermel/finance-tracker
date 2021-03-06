class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :user, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
        publishable_token: 'Tpk_8d6abb700ee74b9a850af600c08a9205',
        secret_token: 'Tsk_ba15d631cd6a457591eb1684e1ec5e91',
        endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol) )
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end



