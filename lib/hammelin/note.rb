module Hammelin

  class Note
    
    include Comparable
    attr_accessor :token

    OCTAVE_JUMP = 12
    MAX_VALUE = 127
    CAPPED_VALUE = MAX_VALUE - OCTAVE_JUMP
    
    def initialize(note)
      self.token = note
    end

    def play
      Hammelin.play(music_string)
    end

    def upto(note)
      NotesRange.new(self,Note.new(note))
    end

    def downto(note)
      NotesRange.new(Note.new(note),self)
    end

    def self.from_value(value)
      Note.new("[#{value}]")
    end

    def music_string
      "[#{parse_value}]"
    end

    def increase_octaves
      Note.from_value(higher_octave)
    end

    def decrease_octaves
      Note.from_value(lower_octave)
    end

    def increase_octaves!
     self.token = increase_octaves.value
    end

    def decrease_octaves!
      self.value = decrease_octaves.value
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

    def higher_octave
      OCTAVE_JUMP + self.value unless highest_octave?
    end

    def highest_octave?
      self.value >= CAPPED_VALUE
    end

    def lowest_octave?
      self.value <= OCTAVE_JUMP
    end

    def lower_octave
      OCTAVE_JUMP + self.value unless highest_octave?
    end

  end



end