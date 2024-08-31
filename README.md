# Ruby RSS Reader

A simple RSS reader built with Ruby that allows users to fetch and display RSS feeds from a given URL. This project demonstrates basic usage of Ruby's RSS and open-uri libraries.

## Installation

To get started with the Ruby RSS Reader, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/jeffreyhaga/ruby_rss_feed.git
   cd ruby-rss-feed
   ```

## Usage

- Run `ruby ruby_rss_feed.rb` in your terminal to run the program.
- When you run the RSS Reader, you’ll be prompted to enter an RSS feed URL.
  - You can also type `'E'` to use an example RSS feed (e.g., the Shopify changelog feed).
- The program will fetch the RSS feed, display the title and last update date, and list the first 15 articles.
- You can open any article in your browser by typing its number.
- Type `'help'` for additional options such as quitting the program or entering a new feed URL.

## Features

- Fetches and parses RSS feeds from a provided URL.
- Displays the title, publication date, and a list of the latest 10 articles.
- Opens selected articles in the user’s default browser.
- Simple command-line interface with helpful prompts.

## License

This project is licensed under the MIT License.
