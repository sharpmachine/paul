class ErrorsController < ApplicationController
  skip_authorization_check
  
  def routing
    render :template => "errors/404", :status => 404
  end
  
  def test
    raise "This is a test of the error reporting system"
  end
end