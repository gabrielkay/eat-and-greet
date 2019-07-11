class UrlValidator < ActiveModel::Validator
  def validate(record)
    unless record.twitter_link.blank? || valid_url?(record.twitter_link)
      record.errors[:base] << 'Your twitter url was invalid. You entered: ' +
        record.twitter_link.to_s + '. Try copy and pasting the entire link to your profile'
    end
    unless record.instagram_link.blank? || valid_url?(record.instagram_link)
      record.errors[:base] << 'Your instagram url was invalid. You entered: ' +
        record.instagram_link.to_s + '. Try copy and pasting the entire link to your profile'
    end
    unless record.facebook_link.blank? || valid_url?(record.facebook_link)
      record.errors[:base] << 'Your facebook url was invalid. You entered: ' +
        record.facebook_link.to_s + '. Try copy and pasting the entire link to your profile'
    end
  end

  private

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
