class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #個人のプロフィールにおけるバリデーション=========================       
  validates :name, presence: true
  validates :nickname, presence: true
  validates :introduction, {presence: true, length: {maximum: 250}}
  validates :sex, inclusion: {in: [true, false]}
  #country, は除く
  
  #=================================================================
  
end
