require_relative '../lib/hammelin'

Hammelin.compose("nested.mid") do

  note = Hammelin::Note.new("C")
  tune = note.upto("D#")

  2.times do 
    play tune
    play tune.reverse

    2.times do 
      play tune
      play tune.increase_octave
      play tune.increase_octave(2)
    end

  end

end
