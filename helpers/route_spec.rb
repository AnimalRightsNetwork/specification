#!/bin/ruby

# Require dependencies
require 'cgi'

# Helper
def h text
  CGI.escapeHTML text.to_s
end

# Route specification
class RouteSpec
  def initialize file, options={}, &block
    # Open file
    @file = file.kind_of?(IO) ? file : File.open(file, 'w')

    # Print html head
    if options[:document]
      @file.puts <<-END.gsub(/^[ ]{8}/, '')
        <!DOCTYPE html>
        <html>
        <head>
          <title>Route Spec</title>
          <meta charset="utf8" />
          <style>
            td { border: 1px solid black; }
          </style>
        </head>
        <body>
      END
    end

    # Call data specification block on self
    @paths = []
    self.instance_eval &block

    # Print overview
    @file.puts <<-END.gsub(/^[ ]{6}/, '')
      # Paths
      # Overview
      <table>
        <tr><td><b>Method</b></td><td><b>Path</b></td><td><b>Comment</b></td></tr>
    END
    @paths.each do |p|
      @file.puts "  #{p.index_row}"
    end
    @file.puts "</table>"

    # Print details
    @file.puts
    @paths.each do |p|
      @file.puts p.detail_section
    end

    # Print html foot
    if options[:document]
      @file.puts <<-END.gsub(/^[ ]{8}/, '')
          </body>
        </html>
      END
    end

    # Close file
    @file.close
  end

  # Shortcut methods
  def get (*args) add_route :get, *args end
  def post (*args) add_route :post, *args end
  def put (*args) add_route :put, *args end
  def patch (*args) add_route :patch, *args end
  def delete (*args) add_route :delete, *args end

  def add_route *args
    @paths << RoutePath.new(*args)
  end

  class RoutePath
    def initialize method, path, comment, description
      @@id ||= 0
      @id = @@id
      @method = method
      @path = path
      @comment = comment
      @description = description

      @@id += 1
    end

    def index_row
      %Q(<tr><td>#{h @method.upcase}</td><td><a href="#user-content-#{@id}">#{h @path}</a></td><td>#{h @comment}</td></tr>)
    end

    def detail_section
      <<-END.gsub(/^[ ]{8}/, '')
        <h2 id="#{@id}">#{h @method.upcase} #{h @path} (#{h @comment})</h2>

        #{@description.gsub(/[ ]{#{@description.scan(/^([ ]*)[^\s]/).flatten.min.length}}/, '')}
      END
    end
  end
end
