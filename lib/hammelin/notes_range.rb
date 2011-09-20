require 'delegate'

module Hammelin

  class NotesRange < DelegateClass(Array)

    def initialize(array)
      super(array)
    end

    def self.from_range(from,to)
      NotesRange.new(transverse_notes(from,to))
    end

    def self.from_array(array)
      #notes_range = array.inject([]) {|notes,notes_range| notes += notes_range }
      NotesRange.new(array)
    end

    def play
      Hammelin.play_string music_string
      self
    end

    # downto and upto are just some sintactic sugar for expanding the range to 
    # a new value. It will create a new NotesRange object with the last Note 
    # and then will figure out how to get to the newest one. 
    def downto(value)
      NotesRange.from_range(last,value)
    end

    alias :upto :downto

    def increase_octave(times=1)
      notes = map {|note| note.increase_octave(times)}

      NotesRange.new(notes)
    end

    def decrease_octave(times=1)
      notes = map {|note| note.decrease_octave(times)}

      NotesRange.new(notes)      
    end

    def music_string
      map{|i| i.music_string }.join(" ")
    end

    private

    def self.transverse_notes(from,to)
      enum = if from > to
        from.value.downto(to.value)
      else
        from.value.upto(to.value)
      end
      enum.map{|value| Note.from_value(value) }
    end

  end

end