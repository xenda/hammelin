require 'delegate'

module Hammelin

  class NotesRange < DelegateClass(Array)

    def initialize(from,to)
      @from, @to = from,to
      super(transverse_notes)
    end

    def play
      Hammelin.play music_string
      self
    end

    def reverse
      NotesRange.new(@to,@from)
    end

    # downto and upto are just some sintactic sugar for expanding the range to 
    # a new value. It will create a new NotesRange object with the last Note 
    # and then will figure out how to get to the newest one. 
    def downto(value)
      NotesRange.new(@to,value)
    end

    alias :upto :downto

    def increase_octave(times=1)
      NotesRange.new(@from.increase_octave(times), @to.increase_octave(times))
    end

    def decrease_octave(times=1)
      NotesRange.new(@from.decrease_octave(times), @to.decrease_octave(times))
    end

    def music_string
      map{|i| i.music_string }.join(" ")
    end

    private

    def transverse_notes
      enum = if @from > @to
        @from.value.downto(@to.value)
      else
        @from.value.upto(@to.value)
      end
      enum.map{|value| Note.from_value(value) }
    end

  end

end