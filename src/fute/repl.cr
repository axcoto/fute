module Fute
  class Repl
    def self.run(prompt : String)
      loop do
        print prompt

        cmd = Command.new gets
        # TODO: Run this in a fiber
        cmd.process

        puts cmd.outcome if cmd.outcome.not_nil!

        break if cmd.exit?
      end
    end
  end
end
