require 'nokogiri'
require 'open-uri'

module Scraper
  def self.fetch(url)
    response = Nokogiri::HTML(open(url))
    title = response.css('.text_title').inner_text.strip
    artist = response.css('.text_artist').inner_text.strip
    content = response.css('.lyrics > p').inner_text
    parsed_content = content.split("\n").reject {|el| el.include? "["}.reject(&:empty?)
    {title: title, artist: artist, lines: parsed_content}
  end
end

class Song
  attr_reader :lines, :title, :artist
  def initialize(url)
    scraped_data = Scraper.fetch(url)
    @title = scraped_data.fetch(:title)
    @artist = scraped_data.fetch(:artist)
    line_maker(scraped_data.fetch(:lines))
  end

  def line_maker(array_of_lines)
    @lines = array_of_lines.map { |el|  Line.new(el) }
  end
end

class Line
  def initialize(string)
    @string = string
  end
end



