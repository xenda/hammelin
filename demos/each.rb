require_relative '../lib/hammelin'

note = Hammelin::Note.new("C")
beat = note.upto("D#").map{|n| n.upto("D#")}
5.times { Hammelin.play beat }
