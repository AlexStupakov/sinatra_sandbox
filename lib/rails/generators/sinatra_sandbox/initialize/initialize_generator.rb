# encoding: utf-8

module SinatraSandbox
  module Generators
    class InitializeGenerator < Rails::Generators::Base
      desc 'Creates a sinatra_sandbox gem migration'

      def self.source_root
        @_sinatra_sandbox_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_migration
        version = Time.now.utc.strftime("%Y%m%d%H%M%S")
        migration_file_name = "#{version}_create_songs.rb"

        template 'create_songs_migration.rb', File.join('db/migrate', migration_file_name)
      end
    end
  end
end