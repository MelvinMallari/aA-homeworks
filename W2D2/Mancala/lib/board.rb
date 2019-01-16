require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |i|
      next if (i == 6 || i == 13)
      self.cups[i] +=  [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    start_pos -= 1 if start_pos <= 6
    raise "Invalid starting cup" if 0 < start_pos || start_pos > 12
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    amount_stones = self.cups[start_pos].length
    self.cups[start_pos] = []
    curr_cup_idx = start_pos

    if current_player_name == @player1
      while amount_stones > 0
        curr_cup_idx = (curr_cup_idx + 1) % cups.length
        # Skip p1 collector cup 
        curr_cup_idx = (curr_cup_idx + 1) % cups.length if curr_cup_idx == 13
        self.cups[curr_cup_idx] += [:stone]
        amount_stones -= 1
      end
    else
      while amount_stones > 0
        curr_cup_idx = (curr_cup_idx + 1) % cups.length
        # Skip p2 collector cup 
        curr_cup_idx = (curr_cup_idx + 1) % cups.length if curr_cup_idx == 6
        self.cups[curr_cup_idx] += [:stone]
        amount_stones -= 1
      end
    end
    self.render
    self.next_turn(curr_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif self.cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..-1].all?(&:empty?)
  end

  def winner
    return :draw if cups[13].count == cups[6].count
    if cups[13].count > cups[6].count
      @player2
    else cups[6].count < cups[13].count
      @player1
    end
  end
end
