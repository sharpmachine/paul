FactoryGirl.define do 
  factory :<%= singular_name %> do
  <%- for attribute in model_attributes -%>
    <%= attribute.name %> "<%= attribute.default %>"
  <%- end -%>
  end
end