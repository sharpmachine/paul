  def show
    @<%= instance_name %> = <%= class_name %>.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @<%= instance_name %> }
    end
  end