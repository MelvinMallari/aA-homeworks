[class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1 
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    # sleep(2)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    add_random_color
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Round Succesful"
  end

  def game_over_message
    "Game over try again"
  end

  def reset_game
    system('clear')
    initialize
  end
end
]