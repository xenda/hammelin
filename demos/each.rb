require_relative '../lib/hammelin'

note = Hammelin::Note.new("C")
beat = note.upto("D#").map{|n| n.upto("D#")}

Hammelin.compose "iterative.mid" do
  5.times do beat.each do |note| 
    play note
   end
  end
end
