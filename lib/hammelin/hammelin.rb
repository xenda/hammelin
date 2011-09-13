require 'java'

require_relative '../../bin/jfugue-4.0.3.jar'

java_import org.jfugue.Player
java_import org.jfugue.Pattern
java_import org.jfugue.Rhythm
java_import org.jfugue.MusicStringParser

module Hammelin

	extend self

	PADDING = " "

	@logged_music_string = ""

	def play(tune)
		if tune.respond_to? :play
			tune.play
		else
			player.play(tune)
			add_to_log(tune)
			player.close
		end
	end

	def save_tune(filename,&block)
		instance_eval &block
		save_to_file(filename)
	end

	private

	def add_to_log(tune)
		logged_music_string << tune + PADDING
	end

	def logged_music_string
		@logged_music_string
	end

	def save_to_file(filename)
		file = java.io.File.new(filename)
		player.save_midi(logged_music_string,file)
	end

	def player
		@player ||= Player.new
	end

end
