class ApplicationController < ActionController::Base
  def index
    @items = Item.all # 必要に応じて、データベースからアイテムを取得
  end
end
