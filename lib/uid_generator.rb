module UidGenerator
  def set_uid
    self.uid = SecureRandom.uuid
  end
end