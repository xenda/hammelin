require 'delegate'

module Hammelin

	class	NotesRange < DelegateClass(Array)

		def	initialize(from,to)
			@from, @to = from,to
			@notes = transverse_notes
			super(@notes)
		end

		def transverse_notes
			enum = if @from.value > @to.value
				@from.value.downto(@to.value)
			else
				@from.value.upto(@to.value)
			end
			enum.map{|value| Note.from_value(value) }
		end

		def play
			Hammelin.play map{|i| i.music_string }.join(" ")
			self
		end

		def reverse
			NotesRange.new(@to,@from)
		end

		def downto(value)
			NotesRange.new(@to,value)
		end

		alias :upto :downto

		def higher_octaves
			NotesRange.new(@from.increase_octaves, @to.increase_octaves)
		end

		def decrease_octaves
			NotesRange.new(@from.increase_octaves, @to.decrease_octaves)
		end

	end

end