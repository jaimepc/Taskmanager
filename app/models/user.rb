class User < ActiveRecord::Base
    
    validates :name, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
end
