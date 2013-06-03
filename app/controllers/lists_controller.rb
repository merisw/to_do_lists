class ListsController < ApplicationController
  before_filter :find_list, :only => [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end


  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = 'List was successfully created.'
      redirect_to @list
    else
      flash[:alert] = "List was not created."
      render action: "new"
    end
  end

  def update
    if @list.update_attributes(params[:list])
      flash[:notice] = 'List was successfully updated.'
      redirect_to @list
    else
      flash[:alert] = "List was not updated."
      render action: "edit"
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = "List has been deleted."
    redirect_to list_path
  end

  private
  def find_list
    @list = List.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The list you were looking for could not be found."
    redirect_to lists_path
  end

end
