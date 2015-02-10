class SectionsController < ApplicationController
  
  layout false

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section was successfully saved."
      redirect_to(:action => 'index')
    else
      render('new')
    end 
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section was successfully updated."
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end 
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    if section = Section.find(params[:id]).destroy
      flash[:notice] = "Section was successfully destroyed."
      redirect_to(:action => 'index')
    end
    
  end

  private
    def section_params
      params.require(:section).permit(
        :name, 
        :position, 
        :visible, 
        :content_type, 
        :content, 
        :page_id
      )
      
    end
end
