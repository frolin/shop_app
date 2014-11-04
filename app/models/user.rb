class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_attached_file :avatar,
                    :styles => {
                        :tiny => "25x25#",
                        :thumbnail => "100x100#",
                        :small  => "180>>",
                        :medium => "300x300>" },

                        :default_url => "/images/missing.jpeg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
