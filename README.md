# Integration Exercise: Java Library Wrapper

# Hammelin 

JFugue (http://www.jfugue.org/index.html) is a Java library that let's developers program a melody through using the basic notes, chords, etc. The music can be saved to a MIDI file, or played just then. 

Hammelin wraps around JFugue functionality to let JRuby users create, play and save MIDIs file using Ruby syntax and some sugar with that. 

# Using Hammelin

Hammelin gaves you easiness of play. Right now, you can use a MusicString 
to play your own music: 

    Hammelin.play("E5s A5s C6s B5s E5s B5s D6s C6i E6i G#5i E6i | A5s E5s A5s C6s B5s E5s B5s D6s C6i A5i Ri")

You could also work with notes: 

    note = Hammelin::Note.new("E5s")

And then just play it

    note.play

Hammelin also allows you to play with ranges:

    note = Hammelin::Note.new("C")
    note.upto("E5s").play

If wanted, you also have access to each note of the range:

    note.upto("E5s").each do {|note| note.play }
    note.upto("E5s").each do {|note| note.increase_octave }


Now go and make some interesting tunes :)

    Hammelin.compose do

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

## Saving your work

Just send a filename to the compose method:

    Hammelin.compose("file.mid") do

### Running on GNU/Linux? 

There was a reported bug when a missing library wasn't found by the Java VM. The file (libpuse-java.so) should be on 

    /usr/lib/jvm/java-6-openjdk/jre/lib/i386
