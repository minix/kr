class LikeController < ApplicationController
  def create
    current_user.like(@item)
    render :text => "1"
  end
  
  def destroy
    current_user.unlike(@item)
    render :text => "1"
  end
  
  private
  def find_likeable
    @success = false
    @element_id = "likeable_#{params[:type]}_#{params[:id]}"
    if not params[:type].in?(['Topic'])
      render :text => "-1"
      return false
    end
    
    klass = eval(params[:type])
    @item = klass.find_by_id(params[:id])
    if @item.blank?
      render :text => "-2"
      return false
    end
  end
end
