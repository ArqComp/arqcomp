# -*- coding: utf-8 -*-

puts 'Categorias'

StudyCategory.create!(
  :name => 'Conteúdos',
  :image_id => Image.find_by_image_name('slide.png').id
)
StudyCategory.create!(
  :name => 'Vídeos',
  :image_id => Image.find_by_image_name('youtube.png').id
)