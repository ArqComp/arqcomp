module ApplicationHelper

  def replace_css lista
    lista.collect do |e|
      e = "first-child" if e == "first"
      e = "last-child" if e == "last"
      e = "current" if e == "selected"
      e
    end
  end

end
