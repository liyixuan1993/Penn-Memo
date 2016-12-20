class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.all
    @tags = Tag.all
    @unreads = Unread.all
    if params[:search]
      @memos = Memo.order(:created_at).search(params[:search])
    # else
    #   @memos = Memo.all.order("created_at DESC")
    end

  end

  # GET /memos/1
  # GET /memos/1.json
  def show
    @memo = Memo.find(params[:id])
    @response = Response.new(:memo => @memo)
    @unread = Unread.new(:memo => @memo)
  end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  def memolist
    @memos = Memo.all
  end

  # GET /memos/1/edit
  def edit
  end

  def sort
    @memos = Memo.where(:tag_id => params[:field])
    if params[:search]
      @memos = Memo.order(:created_at).reverse_order.where(:tag_id => params[:field]).search(params[:search])
    end
  end

  def priority
    @memos = Memo.where(:tag_id => params[:field])
    @pys = @memos.where(:priority => true)
end



  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(memo_params)

    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo = Memo.find(params[:id])
    @memo.delete
    Unread.where(:memo_id => @memo.id).destroy_all
    Response.where(:memo_id => @memo.id).destroy_all
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def unreadToRead
      @memo = Memo.find(params[:id])
      val = params[:id]
      if (@memo.priority == true)

        if(Unread.where(:user_id => current_user.id, :memo_id => @memo_id, :notification => true).count  == 0)

          @unread = @memo.unreads.create(:user_id => current_user.id, :memo_id => @memo.id, :notification => true)
        end
      end

      redirect_to memo_path
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = Memo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_params
      params.require(:memo).permit(:title, :author, :date, :content, :image, :priority, :tag_id)
    end

end
