class User < ApplicationRecord
  rolify


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #validates :pseudo, presence: true, uniqueness: { case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         mount_uploader :image, AvatarUploader

         after_create :default_role

           private
           def default_role
             self.roles << Role.where(:name => 'User').first
           end
end
