class PricingController < ApplicationController

  skip_before_action :authenticate
  before_action :soft_authenticate

  def index
  end
  
  private

  def soft_authenticate
    if session_record = Session.find_by_id(cookies.signed[:session_token])
      Current.session = session_record
    end
  end

end