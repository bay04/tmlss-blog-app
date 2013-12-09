<% up_name = class_name.capitalize %><% down_name = class_name.downcase %>class <%= up_name %>sController < ApplicationController
  before_action :set_<%= down_name %>, only: [:show, :edit, :update, :destroy]

  # GET /<%= down_name %>s
  # GET /<%= down_name %>s.json
  def index
    @<%= down_name %>s = <%= up_name %>.all
  end

  # GET /<%= down_name %>s/1
  # GET /<%= down_name %>s/1.json
  def show
  end

  # GET /<%= down_name %>s/new
  def new
    @<%= down_name %> = <%= up_name %>.new
  end

  # GET /<%= down_name %>s/1/edit
  def edit
  end

  # <%= down_name %> /<%= down_name %>s
  # <%= down_name %> /<%= down_name %>s.json
  def create
    @<%= down_name %> = <%= up_name %>.new(<%= down_name %>_params)

    respond_to do |format|
      if @<%= down_name %>.save
        format.html { redirect_to @<%= down_name %>, notice: '<%= down_name %> was successfully created.' }
        format.json { render action: 'show', status: :created, location: @<%= down_name %> }
      else
        format.html { render action: 'new' }
        format.json { render json: @<%= down_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /<%= down_name %>s/1
  # PATCH/PUT /<%= down_name %>s/1.json
  def update
    respond_to do |format|
      if @<%= down_name %>.update(<%= down_name %>_params)
        format.html { redirect_to @<%= down_name %>, notice: '<%= down_name %> was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @<%= down_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /<%= down_name %>s/1
  # DELETE /<%= down_name %>s/1.json
  def destroy
    @<%= down_name %>.destroy
    respond_to do |format|
      format.html { redirect_to <%= down_name %>s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= down_name %>
      @<%= down_name %> = <%= down_name %>.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def <%= down_name %>_params
      params.require(:<%= down_name %>).permit()
    end
end