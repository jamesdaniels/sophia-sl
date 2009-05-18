class SlidesController < ApplicationController
  # GET /slides
  # GET /slides.xml
  def index
    @slides = Slide.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  # GET /slides/1
  # GET /slides/1.xml
  def show
    @slide = Slide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slide }
      format.jpg  { send_file @slide.original_file_name, :type => 'image/jpeg', :disposition => 'inline' }
    end
  end

end
