module ArticlesHelper
  
  def questions(order)
    questions = Article.where({order_id: order.id, types: 0})
  end
end
