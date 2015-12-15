class User < ActiveRecord::Base


   belongs_to :topic
   has_many :posts

  has_many :followers, class_name: 'Follow', :foreign_key => 'follower_id'
  has_many :followees, class_name: 'Follow', :foreign_key => 'followee_id'
  mount_uploader :avatar, AvatarUploader
  validates :fname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :lname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  #validates :email, presence: true, uniqueness: true, format: {with: /\A\w+\-?\w*\.\w*\-?\w*@\w*\.?guc.edu.eg\z/,message: "insert GUC email"}
  validates_inclusion_of :doctor, :in => [true, false]
  validate :dob_validation
  def dob_validation
     if !dob.nil? && dob > Date.today
     	errors.add(:dob, "can't be in the future")
     end  
   end 
   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.fname = auth.info.name.split(' ')[0]
      user.lname = auth.info.name.split(' ')[1]
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.doctor = 0
      user.save!
    end
  end
end
 