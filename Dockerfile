FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /reading-list
WORKDIR /reading-list
COPY Gemfile /reading-list/Gemfile
COPY Gemfile.lock /reading-list/Gemfile.lock
RUN bundle install
COPY . /reading-list

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
