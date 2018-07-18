class Today

  def initialize(thisday = Time.new.strftime('%d-%m-%Y'))
    @thisday = thisday
  end

  def date_today
    return @thisday
  end

end
