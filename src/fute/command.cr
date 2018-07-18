module Fute
  class Command
    getter outcome : String?
    getter cmd : String?
    getter full_cmd : String

    CMD_QUIT  = "quit"
    CMD_INDEX = "index"
    CMD_QUERY = "query"
    CMD_NOPS  = "noops"
    CMD_UNKNOW = "unknow"

    def initialize(full_cmd : Nil)
      @full_cmd = @cmd = CMD_NOPS
    end

    def initialize(full_cmd : String)
      @full_cmd = full_cmd
      if @full_cmd[0..4] == CMD_INDEX
        @cmd = CMD_INDEX
      elsif @full_cmd[0..4] == CMD_QUERY
        @cmd = CMD_QUERY
      elsif @full_cmd == CMD_QUIT
        @cmd = CMD_QUIT
      else
        @outcome = "unknow command: " + @full_cmd
        @cmd = CMD_UNKNOW
      end
    end

    def process : Nil
    end

    def exit? : Bool
      @cmd == CMD_QUIT
    end
  end
end
