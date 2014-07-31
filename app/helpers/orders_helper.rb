module OrdersHelper

  def calculate_charge(order)
    charge = order[:unit_count].to_i * order[:sotre_weeks].to_i
    order[:charge] = charge
  end
  
  def collapse_panel(number, title, body)
    @panel = {
      number: number,
      title: title,
      body: body
    }
  end
  
  def collapse_panel_body(path, object = nil)
    @body = {
      path: path,
      object: object
    }
  end
end
