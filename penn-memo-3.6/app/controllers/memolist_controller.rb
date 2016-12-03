class MemolistController < ApplicationController

  def index
    @memos = Memo.all
    @tags = Tag.all
  end
end
