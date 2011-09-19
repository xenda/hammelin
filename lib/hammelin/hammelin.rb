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
    tune.play
  rescue NoMethodError
    case tune
    when String
      Note.new(tune).play
    when Array
      NotesRange.from_array(tune).play
    end
  end

  def play_string(tune)
    player.play(tune)
    add_to_log(tune)
    player.close
  end

  # def playable_tune?(tune)
  #   return true if tune.respond_to? :play
  #   return true if tune.is_a?(Array) ? playable_tune?(tune.first) : false
  # end

  # def play_tune(tune)
  #   if tune.respond_to? :play
  #     tune.play
  #   else
  #     tune.each(&:play) if playable_tune?(tune.first)
  #   end
  # end

  def compose(filename=nil,&block)
    instance_eval &block
    save_to_file(filename) if filename
  ensure
    player.close
  end

  def player
    @player ||= Player.new
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

end
