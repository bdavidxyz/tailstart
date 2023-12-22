class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    contract = NewUserContract.new.call(registration_params)

    if contract.success?
      @user = User.new(user_params)
      if @user.save
        session_record = @user.sessions.create!
        cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }

        send_email_verification
        redirect_to root_path, notice: "Welcome! You have signed up successfully"
      else
        raise StandardError.new "An unknown error prevented User from being created."
      end
    else
      flash[:alert] = "Error#{contract.errors.count > 1 ? "s" : ""}. Please correct registration form to continue."
      respond_to do |format|
        format.turbo_stream { render locals: { errors: contract.errors } }
      end
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :password, :terms).to_h.symbolize_keys
  end

  def user_params
    params.permit(:email, :password, :terms)
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
