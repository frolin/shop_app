class Product < ActiveRecord::Base
 belongs_to :category

 has_many :product_items

 before_destroy :ensure_not_refernced_by_any_product_item
 attr_accessor :delete_image

 after_destroy { image.clear if delete_image == '0' }

  validates :title, :description,  :price, presence: true
  validates :title , uniqueness: true

  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  has_attached_file :image,
                    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
                    :url => "/system/:attachment/:id/:basename_:style.:extension",
                    :styles => {
                        :thumb    => ['100x100#',  :jpg, :quality => 70],
                        :preview  => ['420x380#',  :jpg, :quality => 70],
                        :large    => ['600>',      :jpg, :quality => 70],
                        :rectangle => ['1200x400#',  :jpg, :quality => 70],
                        :retina   => ['1200>',     :jpg, :quality => 30]
                    },
                    :convert_options => {
                        :thumb    => '-set colorspace sRGB -strip',
                        :preview  => '-set colorspace sRGB -strip',
                        :large    => '-set colorspace sRGB -strip',
                        :rectangle    => '-set colorspace sRGB -strip',
                        :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
                    }

  validates_attachment :image,
                       :presence => true,
                       :size => { :in => 0..50.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/,  message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'}



def self.latest
  Product.order(:updated_at).last

end

 private

 def ensure_not_referenced_by_any_product_item
    if products.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
 end


end
