  def create
    @<%= instance_name %> = <%= class_name %>.new(params[:<%= instance_name %>])
    if @<%= instance_name %>.save
      redirect_to <%= items_path %>, notice: "Successfully created <%= class_name.underscore.humanize.downcase %>."
    else
      render :new
    end
  end