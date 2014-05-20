class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    c1, c2 = player1[1], player2[1]
    validate_choice(c1)
    validate_choice(c2)
    case c1
      when 'R'
        return c2 == 'P' ? player2 : player1
      when 'P'
        return c2 == 'S' ? player2 : player1
      when 'S'
        return c2 == 'R' ? player2 : player1
    end
  end

  def self.tournament_winner(tournament)
    first = tournament.first
    last = tournament.last

    #base case
    return winner(first,last) if tournament.flatten.length == 4

    #recursive case
    winner_left = tournament_winner(first)
    winner_right = tournament_winner(last)
    return winner(winner_left,winner_right)

  end

  def self.validate_choice(choice)
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless !!(choice =~ /[RPS]/ )
  end

end
