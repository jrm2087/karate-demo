function fn() {

  config = {
    urlBase: 'https://swapi.dev',
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('ssl', true)
  return config;
}