const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

String getImageUrl(String path) {
  return '$imageBaseUrl$path';
}
