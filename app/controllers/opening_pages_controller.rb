class OpeningPagesController < ApplicationController
  before_filter :authenticate

  def index
    @opening_page = OpeningPage.first
  end

  def update
    @opening_page = OpeningPage.find params[:id]
    @opening_page.update_attributes params[:opening_page]
    redirect_to opening_pages_path, notice: "Updated Opening Page"
  end
end
