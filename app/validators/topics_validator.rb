class TopicsValidator < ActiveModel::Validator
  def validate(record)
    if !record.topics.nil?
      record.errors[:base] << 'You can not submit more than 5 topics' unless record.topics.count(",") < 5
    end
  end
end
