module SystemSpecHelpers
  def within_login_form(&block)
    within("#login-form", visible: true, &block)
  end

  def within_navigation(&block)
    within("#navigation", visible: true, &block)
  end

end
