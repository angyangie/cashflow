class PlaidapiController < ApplicationController

  # def add_account
  #   #1 generate a public token for the user
  #   public_token = PublicToken.find_or_create_by(token: params[:public_token])

  #   #2 save public token to user's cashflow account
  #   save_public_token(public_token)

  #   #3 Exchange the Link public_token for a Plaid API access token
  #   exchange_token_response = Argyle.plaid_client.exchange_token(public_token.token)

  #   #4 Initialize a Plaid user
  #   @plaid_user = Argyle.plaid_client.set_user(exchange_token_response.access_token, ['connect'])

  #   #5 pass data for parsing
  #   @user = User.find(session[:user_id])

  #   Transaction.create_accounts(@plaid_user.accounts, public_token, @user.id)
  #   Transaction.create_transactions(@plaid_user.transactions)
  #   redirect_to @user
  # end

  # def update
  #   @user = User.find(session[:user_id])
  #   @user.public_tokens.each do |t|
  #     if exchange_token_response = Argyle.plaid_client.exchange_token(t.token)
  #       updated_response = HTTParty.post('https://tartan.plaid.com/connect/get', :body => {"client_id" => ENV["CLIENT_ID"], "secret" => ENV["SECRET"], "access_token" => exchange_token_response.access_token})
  #       user_obj = Hashie::Mash.new(updated_response)
  #       Transaction.update_accounts(user_obj.accounts, t)
  #       Transaction.update_transactions(user_obj.transactions, @user)
  #     end
  #   end
  #   redirect_to @user
  # end

  # private
  # def save_public_token(token)
  #   cashflow_current_user = User.find_by(id: session[:user_id])
  #   cashflow_current_user.public_tokens << token
  # end
end
