# frozen_string_literal: true

config = {
  host: ENV.fetch('ELASTICSEARCH_HOST', 'localhost:9200')
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
