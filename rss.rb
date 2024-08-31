require 'rss'
require 'open-uri'

#use this feed URL as an example: https://shopify.dev/changelog/feed.xml

class RSSReader


  def initalize
    @url = ''
    @feed = nil
  end

  def run
    welcome
    load_feed
  end

  private

  def welcome
    puts "Welcome to this simple RSS reader. Please enter your RSS feed URL now. Type E to use an example."
    input = gets.chomp
    if input == "E"
      @url = "https://shopify.dev/changelog/feed.xml"
    else
      @url = input
    end
  end

  def load_feed
    URI.open(@url) do |rss|
      @feed = RSS::Parser.parse(rss)
      puts "Title: #{@feed.channel.title}"
      puts "Updated on: #{@feed.channel.lastBuildDate}"
      display_articles
    end
    link_input
  end

  def link_input

    show_help_message = true

    loop do
      if show_help_message
        puts "Please enter a number to open the article in your browser. For other actions type 'help'."
      end

      input = gets.chomp

      case input.downcase
        when 'quit'
          puts 'Exiting Program...'
          break
        when 'new'
          run
          next #loop again to get new input
        when 'help'
          puts "Type 'quit' to exit the program or 'new' to input a new feed."
          show_help_message = false # Disable the initial help message until a valid article number is entered
        else
          article_number = input.to_i
          open_link(article_number)
          show_help_message = true # Re-enable the message after a valid action
      end
    end
  end

  def display_articles
    @feed.items.first(15).each_with_index do |item, index|
      puts "#{index + 1} #{item.title} | #{item.pubDate}"
    end
  end

  def open_link(article_number)
    if article_number > 0 && article_number <= @feed.items.size
      link = @feed.items[article_number - 1].link
      system("open '#{link}'")
    else
      puts "Invalid number. Please try again"
    end
  end

end

rss_reader = RSSReader.new
rss_reader.run
