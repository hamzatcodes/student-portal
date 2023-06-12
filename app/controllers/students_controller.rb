class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_student, except: [:index, :show, :new, :create]
  before_action :require_same_student, only: [:edit, :update, :destroy]

  def index
    @student = Student.all
  end

  def show
    @student = Student.find(params[:id])

    # @student = @student.courses.all
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Your profile was updated successfully"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      flash[:notice] = "Welcome to your Student Portal 👉 #{@student.name.upcase} 👈"
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def destroy
    @student.destroy
    session[:student_id] = nil if @student == current_student
    flash[:delete] = "Account deleted successfully"
    redirect_to root_path
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :age, :matric_no, :department_id, :password, :password_confirmation)
  end

  def require_same_student
    if current_student != @student
      flash[:alert] = "You are not authorized to view this page"
      redirect_to @student
    end
  end
end