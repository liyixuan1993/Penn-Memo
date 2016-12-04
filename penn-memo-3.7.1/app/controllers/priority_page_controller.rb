class PriorityPageController < ApplicationController
  def index
    @memos = Memo.all
  end
end
