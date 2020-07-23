class BoardCase
    attr_accessor :position, :content #init boardcase avec une position sur board et un contenu
    def initialize(position)
        @content = " "
        @position = position
    end
end