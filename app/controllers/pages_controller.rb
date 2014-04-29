class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default"})
  end

  def create
    # Create a new page, first
    # then save that new page
    # If the new page saved successfully, then 
    # give a flash message to the user, and redirect the use to the index page.
    # if creating new page  does not work,  then render the same page
    # to the user again.
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # first, find the apporiate section to perform the edit operation.
    # after that update the section, if everything goes well
    # inform to the user about what happen just.
    # and then redirect the user to the show page.
    # if it does not work, then redisply the same page again  to the user.
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy

    # find the apporopriate section to perform the delete opearion.
    # then delete that section.

    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def page_params
      params.require(:page).permit(:subject_id, :name, :permalink, :position,:action,:visible)
    end
end


