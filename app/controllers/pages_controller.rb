class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "You have successfully created a page."
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    if @page = Page.find(params[:id])
      flash[:notice] = "You have sucessfully updated a page."
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    if page = Page.find(params[:id]).destroy
      flash[:notice] = "You have successfully destroyed the page"
      redirect_to(:action => 'index')
    end
  end

  private
    def page_params
      params.require(:page).permit(
        :position, 
        :name,
        :visible,
        :permalink, 
        :subject_id
      )
    end
end
