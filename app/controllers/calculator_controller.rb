class CalculatorController < ApplicationController

  def square
    render ({ :template => "calculations/square" })
  end
end
