class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:alert] = "Your login credentials were incorrect"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end