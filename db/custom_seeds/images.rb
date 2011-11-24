# -*- coding: utf-8 -*-

puts 'Imagens'

Image.create! :image => File.new('public/images/home/youtube.png')
Image.create! :image => File.new('public/images/home/slide.png')
Image.create! :image => File.new('public/images/home/question.png')
