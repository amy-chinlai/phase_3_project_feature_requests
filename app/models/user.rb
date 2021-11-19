class User < ApplicationRecord
    has_many :votes
    has_many :requests, through: :votes
    has_many :requests, foreign_key: :creator_id

    has_secure_password

    validates :email, {
        presence: true,
        uniqueness: true,
        format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/, message: "Invalid email"}
    }

    validates :password, {
        presence: true,
        length: { minimum: 7 }
    }

    ORGANIZATIONS = [
        "Daily Kos",
        "AFL-CIO",
        "Democratic National Committee",
        "Action Network Staff"
    ]
end
