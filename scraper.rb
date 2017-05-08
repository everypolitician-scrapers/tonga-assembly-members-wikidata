#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new( "Category:Members of the Legislative Assembly of Tonga", 'en').member_titles |
        WikiData::Category.new( "Category:Speakers of the Legislative Assembly of Tonga", 'en').member_titles |
        WikiData::Category.new( "Category:Prime Ministers of Tonga", 'en').member_titles

query = <<EOS
  SELECT DISTINCT ?item
  WHERE
  {
    BIND(wd:Q21328621 AS ?membership)
    BIND(wd:Q28861051 AS ?term)

    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 ?membership .
    ?position_statement pq:P2937 ?term .
  }
EOS
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { en: names })

