class User < ActiveRecord::Base
    has_many :tasks
    validates :name, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
end
