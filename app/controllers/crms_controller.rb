class CrmsController < ApplicationController
  before_action :set_crm, only: [:show, :edit, :update, :destroy]


  def index
    @crms = Crm.all
  end

def import
  Crm.import(params[:file])
  redirect_to root_url, notice: "crms imported."
end



  def show
  end

  def new
    @crm = Crm.new
  end


  def edit
  end

  def create
    @crm = Crm.new(crm_params)

    respond_to do |format|
      if @crm.save
        format.html { redirect_to @crm, notice: 'Crm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @crm }
      else
        format.html { render action: 'new' }
        format.json { render json: @crm.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @crm.update(crm_params)
        format.html { redirect_to @crm, notice: 'Crm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @crm.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crm.destroy
    respond_to do |format|
      format.html { redirect_to crms_url }
      format.json { head :no_content }
    end
  end

  private
    def set_crm
      @crm = Crm.find(params[:id])
    end

    def crm_params
      params.require(:crm).permit(:title, :summary, :rating)
    end
end
