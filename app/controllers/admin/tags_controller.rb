class Admin::TagsController < Admin::BaseController

  authorize_resource :class => "Tag"
  
  def new
    @tag = Tag.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @tag = Tag.new(params[:tag])   

    respond_to do |format|
      if @tag.save
        format.js
      else
        format.js { render action: "error" }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.js
    end
  end
end