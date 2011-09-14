require_relative 'lib/hammelin'

Hammelin.save_tune("file.mid") do

  note = Hammelin::Note.new("C")
  2.times do 
    tune = note.upto("D#").play
    tune = tune.reverse

    2.times do 
      tune.play
      tune = tune.higher_octaves
    end
  end

end