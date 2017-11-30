#!/bin/ruby

# Data specification
class DataSpec
  def initialize file, options={}, &block
    # Open file
    @file = file.kind_of?(IO) ? file : File.open(file, 'w')

    # Print html head
    if options[:document]
      @file.puts <<-END.gsub(/^[ ]{8}/, '')
        <!DOCTYPE html>
        <html>
        <head>
          <title>Model Spec</title>
          <meta charset="utf8" />
          <style>
            td { border: 1px solid black; }
          </style>
        </head>
        <body>
      END
    end

    # Call data specification block on self
    self.instance_eval &block

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

  def model name, &block
    ModelSpec.new name, @file, &block
  end

  # Model specification
  class ModelSpec
    # Attribute after multi index error
    class AttrAfterIndexException < Exception
    end

    def initialize name, file, &block
      @file = file
      @multiindex = false

      # Print table head
      @file.puts <<-END.gsub(/^[ ]{8}/, '')
        <table>
          <tr><td colspan="5"><b>#{name}</b></td></tr>
          <tr>
            <td><b></b></td>
            <td><b>Name</b></td>
            <td><b>Constraints</b></td>
            <td><b>NULL</b></td>
            <td><b>Idx</b></td>
          </tr>
      END

      # Call model specification on self
      self.instance_eval &block

      # Print table foot
      @file.puts "</table>"
    end

    def attr name, type, options={}
      # Assert before multi line
      raise AttrAfterIndexException.new if @multiindex

      # Apply defaults
      options = {
        primary: false,
        foreign: false,
        crts: '',
        null: !options[:primary],
        idx: false
      }.merge(options)

      # Print table row
      @file.puts <<-END.gsub(/^[ ]{6}/, '')
        <tr>
          <td>#{options[:primary] ? 'PK' : (options[:foreign] ? 'FK' : '')}</td>
          <td>#{name} (#{type})</td>
          <td>#{options[:crts]}</td>
          <td>#{options[:null] ? '✓' : '×'}</td>
          <td>#{(options[:index] == :unique) ? 'U' : options[:index] ? '✓' : ''}</td>
        </tr>
      END
    end

    def index attrs, options={}
      unless @multiindex
        @file.puts <<-END.gsub(/^[ ]{8}/, '')
          <tr>
            <td colspan="5"><b>Multi indices</b></td>
          </tr>
        END
        @multiindex = true
      end
      @file.puts <<-END.gsub(/^[ ]{6}/, '')
        <tr>
          <td colspan="4">#{attrs.join(', ')}</td>
          <td>#{options[:unique] ? 'U' : ''}</td>
        </tr>
      END
    end
  end
end
