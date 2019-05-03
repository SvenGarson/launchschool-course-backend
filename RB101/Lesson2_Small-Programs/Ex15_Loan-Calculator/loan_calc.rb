# constants
LOAN_CALC_PROMPT_STR = '=> '
MSG_GET_LOAN_AMT    = "Please enter loan amount: "
MSG_GET_MONTH_AMT   = "Please enter duration in months: "
MSG_ERR_MONTH_AMT   = "Please enter number like '36' or '3'"
MSG_GET_APR_PERC    = "Please enter APR in percentage: "
MSG_ERR_APR_PERC    = "Please enter percentage like '5' or '8.6'"
MSG_ERR_VALID_FLOAT = "Please enter number like '5.25' or '7', not '.57'"
MSG_ERR_VALID_INT   = "Please enter positive number like '5' or '1350'"
MSG_ERR_VALID_FLOAT_OR_INT = "Please enter number like '5' or '12.85'"

# method definitions
def lc_prompt(msg)
  puts LOAN_CALC_PROMPT_STR + msg
end

def valid_float_str?(flt_str)
  # returns false if flt_str has no integer
  # part before the fractional part
  # also treat non-positive numbers as invalid
  (flt_str.to_f.to_s == flt_str) && (flt_str.to_f > 0.0)
end

def valid_int_str?(int_str)
  # also treat non-positive numbers as invalid
  (int_str.to_i.to_s == int_str) && (int_str.to_i > 0)
end

def get_valid_float(msg, msg_err = nil)
  # result to be returned
  inp_flt = nil
  # prompt msg and error until valid float entered
  loop do
    lc_prompt(msg)
    inp_flt = gets.chomp
    # check input for validity
    if valid_float_str?(inp_flt)
      break
    elsif msg_err
      lc_prompt(msg_err)
    else
      lc_prompt(MSG_ERR_VALID_FLOAT)
    end
  end
  # explicitly cast and return the valid float
  inp_flt.to_f
end

def get_valid_int(msg, msg_err = nil)
  # result to be returned
  inp_int = nil
  # prompt msg and error until valid float entered
  loop do
    lc_prompt(msg)
    inp_int = gets.chomp
    # check input for validity
    if valid_int_str?(inp_int)
      break
    elsif msg_err
      lc_prompt(msg_err)
    else
      lc_prompt(MSG_ERR_VALID_INT)
    end
  end
  # explicitly cast and return the valid int
  inp_int.to_i
end

def get_valid_number_float(msg, msg_err = nil)
  # result to be returned
  inp_num = nil
  # prompt msg and error until valid float entered
  loop do
    lc_prompt(msg)
    inp_num = gets.chomp
    # check input for validity
    if valid_int_str?(inp_num) || valid_float_str?(inp_num)
      break
    elsif msg_err
      lc_prompt(msg_err)
    else
      lc_prompt(MSG_ERR_VALID_FLOAT_OR_INT)
    end
  end
  # explicitly cast and return the valid float
  inp_num.to_f
end

def monthly_interest(amt_loan, dur_months, monthly_payment_apr)
  # compute monthly payment without interest
  monthly_no_interest = amt_loan.to_f / dur_months.to_f
  # compute and return the amount of interest paid per month
  monthly_payment_apr - monthly_no_interest
end

def monthly_amount_with_apr(amt_loan, dur_months, perc_apr)
  # convert percentage to scalar
  perc_apr_scal = perc_apr / 100.0
  # convert annual (APR) to monthly (MPR) percentage rate
  perc_mpr_scal = perc_apr_scal / 12.0
  # return monthly payment amount
  amt_loan * (perc_mpr_scal / (1 - (1 + perc_mpr_scal)**-dur_months))
end

# greeting and prompt for loan information
print "\n"
lc_prompt("Welcome to the loan calculator")

# loan amount
amount_loan = get_valid_number_float(MSG_GET_LOAN_AMT)
# duration in months
duration_months = get_valid_int(MSG_GET_MONTH_AMT,
                                MSG_ERR_MONTH_AMT)
# annual percentage rate in percent
percentage_apr = get_valid_number_float(MSG_GET_APR_PERC,
                                        MSG_ERR_APR_PERC)

# compute loan details
amount_monthly = monthly_amount_with_apr(amount_loan,
                                         duration_months,
                                         percentage_apr)
amount_monthly_interest = monthly_interest(amount_loan,
                                           duration_months,
                                           amount_monthly)
amount_interest_total = amount_monthly_interest * duration_months
amount_grand_total = amount_loan + amount_interest_total

# display complete loan breakdown
lc_prompt("Breakdown of your eventual loan")
puts format("\t-Loan amount:                   %.2f$", amount_loan)
puts format("\t-Loan duration in months:       %.2d", duration_months)
puts format("\t-APR(Annual Percentage Rate):   %.2f%%", percentage_apr)
puts format("\t-Monthly payment:               %.2f$", amount_monthly)
puts format("\t-Monthly interest amount:       %.2f$", amount_monthly_interest)
puts format("\t-Total interest amount:         %.2f$", amount_interest_total)
puts format("\t-Total to be repaid:            %.2f$", amount_grand_total)

# program done
print "\n"
lc_prompt("Thank you for using the loan calculator")
print "\n"
