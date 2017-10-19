FROM alpine

MAINTAINER Muhammad Romadi Siregar <mromadisiregar@gmail.com>

RUN apk update
RUN apk add --no-cache make g++ nodejs libc-dev openssl-dev ruby-dev ruby
RUN gem install dashing json bundler --no-ri --no-rdoc
RUN dashing new dashboard
WORKDIR /dashboard
RUN echo >> Gemfile
RUN echo >> Gemfile
RUN echo "gem 'json'">>Gemfile
RUN bundle install
COPY ./dockermentions.erb dashboards/dockermentions.erb
RUN rm -f config.ru
COPY ./config.ru ./
RUN rm -f ./jobs/twitter.rb
COPY ./twitter.rb ./jobs/twitter.rb
RUN apk del gcc g++ libc-dev openssl-dev ruby-dev
CMD ["dashing", "start"]
