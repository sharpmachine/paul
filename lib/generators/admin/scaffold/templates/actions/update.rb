  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    
    if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
      redirect_to <%= items_path %>, notice: "Successfully updated <%= class_name.underscore.humanize.downcase %>."
    else
      render :edit
    end
  end