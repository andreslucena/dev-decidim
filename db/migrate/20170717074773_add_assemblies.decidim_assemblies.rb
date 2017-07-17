# This migration comes from decidim_assemblies (originally 20170519132744)
# frozen_string_literal: true

#
# It adds schema information regarding participation spaces AKA "assemblies"
#
class AddAssemblies < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_assemblies do |t|
      t.jsonb :title, null: false
      t.string :slug, null: false, unique: true
      t.string :hashtag, unique: true
      t.jsonb :short_description, null: false
      t.jsonb :description, null: false
      t.string :hero_image
      t.string :banner_image

      t.datetime :published_at, index: true
      t.date :founded_on

      # TODO: Is this the same as the requested `ends_at` column to distinguish
      # between determined or undetermined duration? In the specifications they
      # talk about two separate attributes...
      t.datetime :closed_at

      t.integer :territorial_scope
      t.jsonb :custom_territorial_scope

      t.jsonb :purpose

      t.integer :initiative_agent
      t.jsonb :custom_initiative_agent

      t.integer :democratory_level
      t.jsonb :custom_democratory_level

      t.string :twitter_handler
      t.string :facebook_handler
      t.string :instagram_handler
      t.string :youtube_handler

      t.references :decidim_organization,
        foreign_key: true,
        index: { name: 'index_decidim_assemblies_on_decidim_organization_id' }

      t.timestamps
    end
  end
end
