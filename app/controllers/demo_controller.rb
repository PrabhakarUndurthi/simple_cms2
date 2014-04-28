class DemoController < ApplicationController

	layout false

  def index

  end

 


  def hello

  	@array = [1,2,3,4,5,6]
  	@names = ["Mark","Prabhakar", "steve"]
    @id = params['id']
  	@page = params[:page]
  	


  end



  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end


  def facebook
    redirect_to('http://facebook.com')
  end



end

