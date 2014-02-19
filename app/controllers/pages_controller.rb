class PagesController < ApplicationController
  before_filter :authorize

  def index
    #raise $redis.hget(:current_user, @current_user.login.to_sym)
  
    if @current_user.admin?
      @pages = Page.order(:lecture_id, :category)
    else
      @pages = Page.where(:lecture_id => @current_lecture)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def download
    @page = Page.find(params[:id])
    #raise @page.file.to_yaml
    send_file(@page.file.path,
        :filename => File.basename(@page.file.path),
        :disposition => 'attachment',
        :url_based_filename => true)
  end

  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end


  def new
    @page = Page.new
    @page.user = @current_user.lastname
    @page.lecture_id = @current_lecture
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end


  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_url, notice: 'Das Dokument wurde erfolgreich eingestellt.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to pages_url, notice: 'Hat geklappt.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

end
