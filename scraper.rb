#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new( "Category:Members of the Legislative Assembly of Tonga", 'en').member_titles |
        WikiData::Category.new( "Category:Speakers of the Legislative Assembly of Tonga", 'en').member_titles |
        WikiData::Category.new( "Category:Prime Ministers of Tonga", 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })

