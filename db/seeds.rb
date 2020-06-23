# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_urls = [
  { url: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg' },
  { url: 'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg' },
  { url: 'https://images.pexels.com/photos/792381/pexels-photo-792381.jpeg' },
  { url: 'https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg' },
  { url: 'https://images.pexels.com/photos/247502/pexels-photo-247502.jpeg' },
  { url: 'https://images.pexels.com/photos/2361/nature-animal-wolf-wilderness.jpg' },
  { url: 'https://images.pexels.com/photos/158109/kodiak-brown-bear-adult-portrait-wildlife-158109.jpeg' },
  { url: 'https://images.pexels.com/photos/53425/polar-bear-arctic-wildlife-snow-53425.jpeg' },
  { url: 'https://images.pexels.com/photos/209096/pexels-photo-209096.jpeg' },
  { url: 'https://images.pexels.com/photos/128756/pexels-photo-128756.jpeg' }
]

Image.create(image_urls)
