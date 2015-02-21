class Task < ActiveRecord::Base
    validates :name, presence: true
    validates :user_id, presence: true
    validates :name, length: { minimum: 6 }
end
