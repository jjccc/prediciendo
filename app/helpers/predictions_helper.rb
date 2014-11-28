module PredictionsHelper

  def sort_url(order_by)
    is_order_by_creation?(order_by) ? predictions_path(:sort => "due_date") : predictions_path
  end
  
  def sort_text(order_by)
    is_order_by_creation?(order_by) ? "Ordenar por vencimiento" : "Ordenar por creación"
  end
  
  private
  
  def is_order_by_creation?(order_by)
    order_by.nil? || order_by == "creation_date"
  end
  
end
