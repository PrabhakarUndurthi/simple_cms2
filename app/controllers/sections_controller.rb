class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    # Create a new section, first
    # then save that new section
    # If the new section saved successfully, then 
    # give a falsh message to the user, and redirect the use to the index page.
    # if creating new section does not work,  then render the same page
    # to the user again.
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # first, find the apporiate section to perform the edit operation.
    # after that update the section, if everything goes well
    # inform to the user about what happen just.
    # and then redirect the user to the show page.
    # if it does not work, then redisply the same page again  to the user.
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

end