FROM ruby:3.1.2

ARG RAILS_MASTER_KEY

ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

WORKDIR /app
COPY ./src /app

RUN bundle install
RUN bundle exec rails assets:precompile

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080"]
