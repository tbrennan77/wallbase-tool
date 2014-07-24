class Profile < ActiveRecord::Base
  SKU_REGEX = /\A[A-Z]{1,4}-[X]{3}-[A-Z0-9]{1,4}\z/

  validates_presence_of :style_type_id, :uuid, :size
  
  belongs_to :style_type
  has_one :collection, through: :style_type, dependent: :destroy
  has_many :collection_sections, through: :collection
  has_many :profile_color_palettes, dependent: :destroy
  has_many :color_palettes, through: :profile_color_palettes, dependent: :destroy
  has_many :colors, through: :color_palettes, dependent: :destroy

  has_attached_file :profile_image
  has_attached_file :corner_image
  
  do_not_validate_attachment_file_type :corner_image
  do_not_validate_attachment_file_type :profile_image

  validates_format_of :uuid, with: SKU_REGEX, message: 'is in the wrong format. Do not mess with skus, they are powerful. They directly affect the sample cart. They should look like: CC-XXX-4'

  scope :ordered, -> { order("id") }

  def profile_image_url
    self.profile_image.blank? ? "missing.jpg" : self.profile_image.url
  end

  def corner_image_url
    self.corner_image.blank? ? "missing.jpg" : self.corner_image.url
  end

  def name
    self.uuid
  end

  def related_products
    self.collection.style_types.where("style_types.id != ?", style_type.id).order('random()').limit(5)
  end

  def color_palette_width_in_percent
    "#{100.0 / color_palettes.count.to_f}%"
  end

  def self.missing_images(type='corner')
    folder       = type == 'profile' ? 'profile_images' : 'corner_images'
    image_suffex = type == 'profile' ? 'profile' : 'image'

    missing_images = []
    Profile.all.each do |p|
      unless File.exists?(File.join(Rails.root, "app/assets/images/#{folder}/#{p.style_type.name.capitalize}-#{p.name}-#{image_suffex}.jpg"))
        missing_images << "Missing: #{p.id} :: #{p.style_type.name}".ljust(39) + "| Should be: " + "#{p.style_type.name.capitalize}-#{p.name}-#{image_suffex}.jpg".ljust(50).yellow + '*'.red
      end
    end
    length = missing_images.first.length-16
    puts ("*".red)*length
    missing_images.each {|n| puts "#{'*'.red} #{n}"}
    puts ("*".red)*length
    puts "\nTotal: \e[32m#{missing_images.count}\e[0m\n"
  end
end
