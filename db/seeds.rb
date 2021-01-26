movies = [
  {
    title: 'Up',
    director: 'Pete Docter',
    year: '2009',
    image: 'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg',
    description: 'Carl, an old widower, goes off on an adventure in his flying house in search of Paradise Falls, his wife\'s dream destination.'
  },
  {
    title: 'Interstellar',
    director: 'Christopher Nolan',
    year: '2014',
    image: 'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg',
    description: 'In the future, where Earth is becoming uninhabitable, farmer and ex-NASA pilot Cooper is asked to pilot a spacecraft along with a team of researchers to find a new planet for humans.'
  },
  {
    title: 'Titanic',
    director: 'James Cameron',
    year: '1997',
    image: 'https://upload.wikimedia.org/wikipedia/en/1/19/Titanic_%28Official_Film_Poster%29.png',
    description: 'Seventeen-year-old Rose hails from an aristocratic family and is set to be married. When she boards the Titanic, she meets Jack Dawson, an artist, and falls in love with him.'
  }
  ]

Movie.create!(movies.map { |movie| { title: movie[:title], director: movie[:director], year: movie[:year], image: movie[:image], description: movie[:description] } })
