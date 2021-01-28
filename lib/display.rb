# frozen_string_literal: true

module Display
  HOR = "\u2550"
  VERT = "\u2551"
  T_UP = "\u2569"
  TOP_LEFT = "\u2554"
  TOP_RIGHT = "\u2557"
  TRI_UP_LEFT = "\u25e4"
  TRI_BOT_LEFT = "\u25e3"
  ROPE_HANGER = "\u2564"
  SPACE = ' '

  ROPE_VERT = "\u250b"
  NOOSE = "\u257d"
  #   HEAD = "\u2639"
  HEAD = "\u25ef"
  BODY = "\u254e"
  RIGHT_LIMB = "\u005c"
  LEFT_LIMB = "\u002f"

  BOTTOM_ROW = HOR * 2 + T_UP + HOR * 9 + SPACE * 2
  TOP_ROW = SPACE * 2 + TOP_LEFT + HOR * 4 + ROPE_HANGER + HOR + SPACE * 5
  EMPTY_ROW = SPACE * 2 + VERT + SPACE * 11

  # Gallows should be 10 rows high, 14 columns wide, 9 turns total
  # two blank rows until legs start
  def empty_gallows
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = EMPTY_ROW
    row4 = EMPTY_ROW
    row3 = EMPTY_ROW
    row2 = EMPTY_ROW
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess1
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = EMPTY_ROW
    row4 = EMPTY_ROW
    row3 = EMPTY_ROW
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess2
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = EMPTY_ROW
    row4 = EMPTY_ROW
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess3
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = EMPTY_ROW
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess4
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = SPACE * 2 + VERT + SPACE * 4 + BODY + SPACE * 6
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess5
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + BODY + SPACE * 6
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess6
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = EMPTY_ROW
    row5 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + BODY + RIGHT_LIMB + SPACE * 5
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess7
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = EMPTY_ROW
    row6 = SPACE * 2 + VERT + SPACE * 4 + BODY + SPACE * 6
    row5 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + BODY + RIGHT_LIMB + SPACE * 5
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess8
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + SPACE + SPACE * 6
    row6 = SPACE * 2 + VERT + SPACE * 4 + BODY + SPACE * 6
    row5 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + BODY + RIGHT_LIMB + SPACE * 5
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def guess9
    row9 = BOTTOM_ROW
    row8 = EMPTY_ROW
    row7 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + SPACE + RIGHT_LIMB + SPACE * 5
    row6 = SPACE * 2 + VERT + SPACE * 4 + BODY + SPACE * 6
    row5 = SPACE * 2 + VERT + SPACE * 3 + LEFT_LIMB + BODY + RIGHT_LIMB + SPACE * 5
    row4 = SPACE * 2 + VERT + SPACE * 4 + HEAD + SPACE * 6
    row3 = SPACE * 2 + VERT + SPACE * 4 + NOOSE + SPACE * 6
    row2 = SPACE * 2 + VERT + SPACE * 4 + ROPE_VERT + SPACE * 6
    row1 = TOP_ROW
    [row1, row2, row3, row4, row5, row6, row7, row8, row9].join("\n")
  end

  def get_display(turn)
    displays = [empty_gallows, guess1, guess2, guess3, guess4, guess5, guess6,
                guess7, guess8, guess9]
    displays[turn]
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def title
    <<~HEREDOC
      ██╗░░██╗░█████╗░███╗░░██╗░██████╗░███╗░░░███╗░█████╗░███╗░░██╗
      ██║░░██║██╔══██╗████╗░██║██╔════╝░████╗░████║██╔══██╗████╗░██║
      ███████║███████║██╔██╗██║██║░░██╗░██╔████╔██║███████║██╔██╗██║
      ██╔══██║██╔══██║██║╚████║██║░░╚██╗██║╚██╔╝██║██╔══██║██║╚████║
      ██║░░██║██║░░██║██║░╚███║╚██████╔╝██║░╚═╝░██║██║░░██║██║░╚███║
      ╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝

      Welcome to Hangman!

      [1] Play a new game
      [2] Play against another person
      [3] Load a saved game
      [4] Exit

    HEREDOC
  end
end
