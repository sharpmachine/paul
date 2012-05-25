  def index
    
    params[:sort] ||= "created_at" 
        
    @<%= instances_name %> = <%= class_name %>.order(sort_column + " " + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @<%= instances_name %> }
    end    
  end