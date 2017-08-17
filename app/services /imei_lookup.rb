class ImeiLookup
  def lookup (cnic)
    Customer.where(cnic: cnic).pluck(:imei)
  end
end
