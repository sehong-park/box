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
  
  def collapse_panel_body(path, object)
    @body = {
      path: path,
      object: object
    }
  end
  
  def units
    @units = {
      carrier: { name: "캐리어", src: "http://goo.gl/fYejCs" },
      regular: { name: "종이박스", src: "http://goo.gl/wH8z0E" },
      hard: { name: "하드박스", src: "http://goo.gl/NOC18R" }
    }
  end
  
end
