class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    byebug
    if params[:tag]
      @lists = List.tagged_with(params[:tag])
    elsif params[:search]
      @lists = List.tagged_with(params[:search]).order("created_at DESC")
    else
      @lists = List.all
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @tasks = @list.tasks.order(is_complete: :asc,priority: :desc, created_at: :asc)
  end

  # GET /lists/new
  def new
    @list = List.new
    @list.tasks.build
  end

  # GET /lists/1/edit
  def edit
    @list.tasks.build
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.tag_list.add(params[:list][:tag_list], parse: true)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @list.attributes = list_params
    @list.tag_list.remove(@list.tag_list)
    @list.tag_list.add(params[:list][:tag_list], parse: true)
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :type, :user_id, tag_list: [], tasks_attributes: [:id, :desc, :is_complete, :priority, {attaches: []}, :user_id, :list_id, :created_at, :updated_at, :_destroy])
    end
end
