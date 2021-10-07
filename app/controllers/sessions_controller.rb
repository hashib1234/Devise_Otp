class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    puts params.inspect
    @user_id = session[:otp_login]
    @user = User.find_by(id: @user_id, phone: params[:phone])
    @otp = params[:user]["otp_attempt"]

    if @user.validate_and_consume_otp!(@otp)
      @user.otp_required_for_login = false
      @user.last_sign_in_at = Time.now
      @user.save
      sign_in_and_redirect @user, event: :authentication
    else 

      flash[:alert] = "This OTP is incorrect and Phone"
      redirect_to new_user_session_path
    end
  end
  
end