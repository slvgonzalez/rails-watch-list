class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new # needed to instantiate the simple_for
  end

  def create
    @list = List.new(params[:list])
    @list.save
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
