require_relative '../lib/hammelin'

Hammelin.compose("file.mid") do

  note = Hammelin::Note.new("C")

  2.times do 
    tune = note.upto("D#")
    play tune
    play tune.reverse

    2.times do 
      play tune
      play tune.increase_octave
      play tune.increase_octave(2)
    end

  end

end