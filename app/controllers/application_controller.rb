class ApplicationController < ActionController::Base
  helper_method :current_student, :logged_in?

  def current_student
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  def require_student
    if !logged_in?
      flash[:alert] = "You are not authorized to view this page"
      redirect_to login_path
    end
  end
end
