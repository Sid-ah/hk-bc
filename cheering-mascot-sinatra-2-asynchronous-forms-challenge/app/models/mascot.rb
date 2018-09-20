module Mascot
  DEFAULT_SIGN = "Go Team!"

  CHEER_SIGNS = { "RED HOT"         => "H-O-T!",
                  "DO IT AGAIN"     => "Go, Fight, Win",
                  "2 BITS"          => "Holler!",
                  "STOMP YOUR FEET" => "STOMP!" }

  def self.sign_for(cheer_name)
    CHEER_SIGNS[cheer_name] || DEFAULT_SIGN
  end
end
