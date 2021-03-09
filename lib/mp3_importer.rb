require 'pry'

class MP3Importer

    attr_reader :path

    @@all = []

    def initialize(path)
        @path = path
        @@all << self
    end

    def files
        @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end

    def import 
        files.each{ |filename| Song.new_by_filename(filename) }
    end
end