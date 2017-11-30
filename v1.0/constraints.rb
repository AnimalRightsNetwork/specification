#!/bin/ruby

# Require dependencies
require '../helpers/modelspec'

# Specify data
DataSpec.new STDOUT do
  # Options: crts, primary, foreign, index, null
  # Users
  model :users do
    attr :id, :string, crts: "length: 5..25, characters: a-z0-9", primary: true
    attr :display_id, :string, crts: "equal to id except for case", null: false
    attr :email, :string, crts: "valid email", null: false, index: :unique
    attr :password_digest, :string, null: false
    attr :activation_digest, :string
    attr :admin, :boolean, crts: "default: false", null: false
    attr :timestamps, :datetime, null: false
  end

  # Organizations
  model :orgs do
    attr :id, :string, crts: "length: 4..32, characters: a-z0-9", primary: true
    attr :display_id, :string, crts: "equal to id except for case", null: false
    attr :org_type_id, :integer, foreign: true, null: false
    attr :name, :string, crts: "length: 4..48", index: :unique, null: false
    attr :logo_url, :string, null: false
    attr :cover_url, :string, null: false
    attr :video_url, :string
    attr :marker_url, :string, null: false
    attr :marker_color, :string, crts: "length: 6, characters: 0-9a-f", null: false
    attr :timestamps, :datetime, null: false
  end

  # Organization types
  model :org_types do
    attr :id, :integer, primary: true
    attr :name, :string, index: :unique, null: false
    attr :icon_url, :string, null: false
  end

  # Organization descriptions
  model :org_descriptions do
    attr :id, :integer, primary: true
    attr :org_id, :string, foreign: true, index: false, null: false
    attr :language, :string, crts: "available locale", null: false
    attr :content, :string, crts: "length: 0..5000", null: false
    index [:org_id, :language], unique: true
  end

  # Organization tags
  model :org_tags do
    attr :id, :integer, primary: true
    attr :name, :string, index: :unique, null: false
    attr :icon_url, :string, null: false
    attr :color, :string, crts: "length: 6, characters: 0-9a-f", null: false
  end

  # Organization links
  model :org_links do
    attr :id, :integer, primary: true
    attr :org_id, :string, foreign: true, index: false, null: false
    attr :link_type_id, :integer, foreign: true, index: false, null: false
    attr :url, :string, null: false
    index [:org_id, :link_type_id], unique: true
  end

  # Link types
  model :link_types do
    attr :id, :integer, primary: true
    attr :name, :string, index: :unique, null: false
    attr :icon_url, :string, null: false
  end

  # Events
  model :events do
    attr :id, :integer, primary: true
    attr :org_id, :string, foreign: true
    attr :event_type_id, :integer, foreign: true, null: false
    attr :name, :string, crts: "length: 4..64", index: true, null: false
    attr :image_url, :string
    attr :lat, :decimal, crts: "precision: 10, scale: 6"
    attr :lon, :decimal, crts: "precision: 10, scale: 6"
    attr :start_time, :datetime, index: true, null: false
    attr :end_time, :datetime
    attr :fb_url, :string
    attr :timestamps, :datetime, null: false
    index [:lat, :lon]
  end

  # Event types
  model :event_types do
    attr :id, :integer, primary: true
    attr :name, :string, index: :unique, null: false
    attr :icon_url, :string, null: false
  end

  # Event descriptions
  model :event_descriptions do
    attr :id, :integer, primary: true
    attr :event_id, :integer, foreign: true, index: false, null: false
    attr :language, :string, crts: "available locale", null: false
    attr :content, :string, crts: "length: 0..5000", null: false
    index [:event_id, :language], unique: true
  end

  # Event tags
  model :event_tags do
    attr :id, :integer, primary: true
    attr :name, :string, index: :unique, null: false
    attr :icon_url, :string, null: false
    attr :color, :string, crts: "length: 6, characters: 0-9a-f", null: false
  end
end
