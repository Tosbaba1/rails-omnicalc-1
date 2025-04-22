class CalculatorController < ApplicationController

  def square
    render ({ :template => "calculations/square" })
  end

  def square_results
    @number = params.fetch("number").to_f
    @square = @number ** 2

    render ({ :template => "calculations/square_results" })
  end

  def square_root
    render ({ :template => "calculations/square_root"})
  end

  def square_root_results
    @user_number = params.fetch("user_number").to_f
    @square_root = @user_number ** 0.5

    render ({ :template => "calculations/square_root_results" })
  end

  def random
    render ({ :template => "calculations/random"})
  end

  def random_results
    @user_min = params.fetch("user_min").to_f
    @user_max = params.fetch("user_max").to_f

    render ({ :template => "calculations/random_results" })
  end

  def payment
    render ({ :template => "calculations/payment"})
  end

  def payment_results
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f

    # Convert to monthly interest rate
    @monthly_rate = @apr / 100 / 12

    # Number of months
    @n = @years * 12

    # Apply formula
    @numerator = @monthly_rate * @principal
    @denominator = 1 - ((1 + @monthly_rate) ** (-@n))
    @payment = @numerator / @denominator

    render ({ :template => "calculations/payment_results"})
  end
end
