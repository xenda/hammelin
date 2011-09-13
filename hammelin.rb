require_relative 'lib/hammelin'

Hammelin.save_tune("file.mid") do

  note = Hammelin::Note.new("C")
  2.times do 
   note.upto("D#").play.reverse.play.higher_octaves.play.higher_octaves.play.higher_octaves.play
  end

end