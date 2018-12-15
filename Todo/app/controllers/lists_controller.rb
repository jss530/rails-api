class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = List.all
    json_response(@lists)
  end

#use create! This way, the model will raise an exception ActiveRecord::RecordInvalid
  def create
    @list = List.create!(list_params)
    json_response(@list, :created)
  end

  def show
    json_response(@list)
  end

  def update
    @list.update(list_params)
    head :no_content
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:title, :created_by)
  end

#callback method to find a list by id. In the case where the record does not exist, ActiveRecord will throw an exception

  def set_list
    @list = List.find(params[:id])
  end
end
