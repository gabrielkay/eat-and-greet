class UrlValidator < ActiveModel::Validator
  def validate(record)
    unless record.twitter_link.nil? || valid_url?(record.twitter_link)
      record.errors[:base] << 'Your twitter url was invalid. You entered: ' +
        record.link.to_s + '. Try copy and pasting your profile link from your browser'
    end
    unless record.instagram_link.nil? || valid_url?(record.instagram_link)
      record.errors[:base] << 'Your instagram url was invalid. You entered: ' +
        record.link.to_s + '. Try copy and pasting your profile link from your browser'
    end
    unless record.facebook_link.nil? || valid_url?(facebook_link.link)
      record.errors[:base] << 'Your facebook url was invalid. You entered: ' +
        record.link.to_s + '. Try copy and pasting your profile link from your browser'
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
