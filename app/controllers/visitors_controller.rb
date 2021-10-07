class VisitorsController < ApplicationController



def getotp
   if @user = User.find_by(phone: params["phone"])
        @user.otp_required_for_login = true
        @user.otp_secret = User.generate_otp_secret  
        @otp = @user.current_otp
        @user.save
        session[:otp_login] = @user.id
        puts "The OTP is ........."+@otp.to_s
        flash[:success] = "The OTP is Your console"
    else
       flash[:danger] = "Your not Register user"
    end
  end
end
