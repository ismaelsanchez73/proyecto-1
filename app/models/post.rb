class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  # Validaciones
  validates :description, presence: true, length: { minimum: 10 } # Asegúrate de que haya una descripción y que tenga al menos 10 caracteres
  validates :image, presence: true # Asegúrate de que haya una imagen
  validate :image_content_type # Validación personalizada para el tipo de contenido de la imagen

  private

  def image_content_type
    if image.attached? && !image.content_type.in?(%('image/png image/jpg image/jpeg'))
      errors.add(:image, 'must be a JPEG or PNG')
    end
  end
end