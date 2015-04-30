module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  
  def convert_currency(amount)
    case I18n.locale
    when :en
      amount
    when :id
      amount * 10000
    end
  end
end
