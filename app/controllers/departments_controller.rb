class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "Department was successfully created"
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:notice] = "Department was updated successfully"
      redirect_to department_path(@department)
    else
      render 'edit'
    end
  end

  def delete
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end