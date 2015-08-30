class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  has_many :contracts, dependent: :destroy
  accepts_nested_attributes_for :contracts
  dragonfly_accessor :image

end
