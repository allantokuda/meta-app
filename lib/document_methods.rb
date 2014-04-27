module DocumentMethods
  # Written for Mongoid specifically
  def non_id_fields
    try(:fields).keys.map(&:to_sym).reject{|k| k == :_id}
  end
end
