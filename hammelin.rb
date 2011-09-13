require_relative 'lib/hammelin'

Hammelin.save_tune("file.mid") do

  note = Hammelin::Note.new("C")
  2.times do 
   start = note.upto("D#").play.reverse.play.higher_octaves.play
   keep_it_going = start.higher_octaves.play.higher_octaves.play
  end

end