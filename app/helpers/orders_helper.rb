module OrdersHelper

  def filtered_order(order)
    #unit_count
    c_cnt = order[:unit_count][:carrier].to_i
    r_cnt = order[:unit_count][:regular].to_i
    h_cnt = order[:unit_count][:hard].to_i
    order[:unit_count] = c_cnt + r_cnt + h_cnt
    
    #pickup_datetime
    year = order[:pickup_datetime][:year]
    month = order[:pickup_datetime][:month]
    day = order[:pickup_datetime][:day]
    hour = order[:pickup_datetime][:hour]
    order[:pickup_datetime] = Time.new(year, month, day, hour)
    
    #delivery_datetime
    year = order[:delivery_datetime][:year]
    month = order[:delivery_datetime][:month]
    day = order[:delivery_datetime][:day]
    hour = order[:delivery_datetime][:hour]
    order[:delivery_datetime] = Time.new(year, month, day, hour)
    
    #charge
    secs = order[:delivery_datetime] - order[:pickup_datetime]
    days = secs / 60 / 60 / 24
    order[:store_weeks] = (days / 7).ceil
    order[:store_weeks] = 1 if order[:store_weeks] == 0
    order[:charge] = charge(
      9900, order[:unit_count], order[:store_weeks], 14900)
    order
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
  
  ######################################
  private
    def charge(unit_charge, unit_count, store_weeks, delivery_charge)
      charge = unit_charge * unit_count * store_weeks
      count_discount = Math.log2(unit_count ** 9).ceil / 100.0
      weeks_discount = (Math.log2(store_weeks) / 100.0).round(3)
      charge = charge * (1 - count_discount) * (1 - weeks_discount)
      charge += delivery_charge
      charge.round(-2)
    end
end
