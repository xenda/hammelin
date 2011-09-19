module Hammelin

  class Note
    
    include Comparable
    attr_accessor :token

    OCTAVE_JUMP  = 12
    MAX_VALUE    = 127
    CAPPED_VALUE = MAX_VALUE - OCTAVE_JUMP
    
    def initialize(note)
      self.token = note
    end

    def play
      Hammelin.play_string (music_string)
    end

    def upto(note)
      NotesRange.from_range(self,Note.new(note))
    end

    def downto(note)
      NotesRange.from_range(Note.new(note),self)
    end

    def self.from_value(value)
      Note.new("[#{value}]")
    end

    def music_string
      "[#{parse_value}]"
    end

    def increase_octave(times)
      Note.from_value(higher_octave(times))
    end

    def decrease_octave(times)
      Note.from_value(lower_octave(times))
    end

    def increase_octave!(times)
      value = increase_octave(times).value
      self.token = "[#{value}]"
    end

    def decrease_octave!(times)
      value = decrease_octave(times).value
      self.token = "[#{value}]"
    end

    def value
      parse_value
    end

    def <=>(other)
      self.value <=> other.value
    end

    private

    def parse_value
      MusicStringParser.get_note(self.token).get_value
    end

    def higher_octave(times=1)
      highest_octave? ? value : OCTAVE_JUMP*times + self.value 
    end

    def lower_octave(times=1)
      lowest_octave? ? value : OCTAVE_JUMP*times + self.value 
    end

    def highest_octave?
      self.value + OCTAVE_JUMP >= CAPPED_VALUE
    end

    def lowest_octave?
      self.value - OCTAVE_JUMP <= OCTAVE_JUMP
    end

  end
  
end