class User < ActiveRecord::Base
  attr_accessible :email, :gender, :mobile_number, :name, :password, :password_confirmation
  has_many :products,:dependent => :destroy
  has_many :categories,:dependent => :destroy
  validates :email,:name,:presence => true
  validates :password, :confirmation =>true,:presence => true,:on=>:create
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :normal=> "200x200>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "rails.png", :path => ":/home/gowri/Desktop/jagadishp/:style_:basename.:extension"
  # validates :avatar, :attachment_presence => true
  # validates_with AttachmentPresenceValidator, :attributes => :avatar
  #validates_attachment :avatar, :content_type => [ 'image/gif', 'image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg' ]
  #validates_attachment :avatar, :presence => true,:content_type => { :content_type => "image/jpg" },:size => { :in => 0..30.kilobytes }
  #validates_attachment_content_type :avatar, :content_type => [ 'image/gif','image/jpg' ]
  validates_attachment :avatar,:size => { :in => 0..20.kilobytes }
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg)/ ,:message=>"Should be jpg/jpeg/gif only "


  def password=(pwd)  
    if pwd.present?        
      write_attribute(:password,encrypt_password(pwd))
    end  
  end 

  def password_confirmation=(pwd)
    if pwd.present?      
      write_attribute(:password_confirmation,encrypt_password(pwd))
    end
  end

  def self.check_password(mail=nil,pwd=nil)
    if mail.present? and pwd.present?
      user = User.first(:conditions=>["email = ?",mail])
      if user.present?
        result_pwd = user.decrpt_password(user.password)
        if result_pwd == pwd
          return user
        end      
      end
    end
    return nil
  end 

  def decrpt_password(pwd=nil)    
    decrypt_pwd = ""
    if pwd.present?      
      arr = pwd.split('1$1')
      arr.each_with_index do |pass,index|
        if index==0
          decrypt_pwd += pass[3].chr().to_s
        else
          decrypt_pwd += pass[2].chr().to_s
        end
      end
    end
    return decrypt_pwd
  end

  private

  def encrypt_password(pwd=nil)
    if pwd.present?      
      encrypt_pwd=[]
      pwd.split(//).collect do |x|
        encrypt_pwd << "123#{x}321"
      end
      return encrypt_pwd.join("$")
    end
    return nil
  end


end
