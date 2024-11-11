# Usa una imagen base de Ruby
FROM ruby:3.0

# Instala dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Instala Bundler y Rails
RUN gem install bundler rails

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo Gemfile y Gemfile.lock
COPY Gemfile* ./

# Instala las gemas
RUN bundle install

# Copia toda la aplicación al contenedor
COPY . .

# Exponer el puerto de Rails
EXPOSE 3000

# Comando para iniciar el servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
