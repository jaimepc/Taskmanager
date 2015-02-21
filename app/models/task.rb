class Task < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :user_id, presence: true
    validates :name, length: { minimum: 6 }
end
