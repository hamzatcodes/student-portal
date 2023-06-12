class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "course was successfully created"
      redirect_to department_path(@course.department)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "course was updated successfully"
      redirect_to department_path(@course.department)
    else
      render 'edit'
    end
  end

  def delete
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :department_id)
  end
end