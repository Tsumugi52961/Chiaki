class Bangumi < Sequel::Model
  def validate
    super
    errors.add(:title, 'cannot be empty') and return if title.nil? || title.empty?
    errors.add(:magnet_link, 'cannot be empty') and return if magnet_link.nil? || magnet_link.empty?
    errors.add(:magnet_link, 'invalid in format') and return unless magnet_link && magnet_link[0..5] == "magnet"
  end
end

