class MemolistController < ApplicationController

  def index
    @memos = Memo.all
    @tags = Tag.all
    @memo = Memo.new
  end
end
