# ranges of input
MIN_LOAN_AMOUNT_INCL          = 1.0
MIN_LOAN_DURATION_MONTHS_INCL = 1
MAX_LOAN_DURATION_MONTHS_INCL = (40 * 12)
MIN_LOAN_APR_PERCENT_EXCL     = 0.0
MAX_LOAN_APR_PERCENT_INCL     = 100.0

# constants
LOAN_CALC_PROMPT_STR = '=> '
MSG_GET_LOAN_AMT      = 'Please enter loan amount: '
MSG_ERR_LOAN_AMT      = 'Please enter number > ' +
                        MIN_LOAN_AMOUNT_INCL.to_s + '!'

MSG_GET_LOAN_MONTHS   = 'Please enter duration in months: '
MSG_ERR_LOAN_MONTHS   = 'Please enter whole number >= ' +
                        MIN_LOAN_DURATION_MONTHS_INCL.to_s +
                        ' and <= ' + MAX_LOAN_DURATION_MONTHS_INCL.to_s + '!'

MSG_GET_LOAN_APR_PERC = 'Please enter APR in percent: '
MSG_ERR_LOAN_APR_PERC = 'Please enter number > ' +
                        MIN_LOAN_APR_PERCENT_EXCL.to_s +
                        ' and <= ' + MAX_LOAN_APR_PERCENT_INCL.to_s + '!'

# method definitions
def lc_prompt(msg, newline=true)
  if newline
    puts LOAN_CALC_PROMPT_STR + msg
  else
    print LOAN_CALC_PROMPT_STR + msg
  end
end

def valid_float_str?(flt_str)
  flt_str.to_f.to_s == flt_str
end

def valid_int_str?(int_str)
  int_str.to_i.to_s == int_str
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

def print_welcome
  print "\n"
  lc_prompt('Welcome to the loan calculator!')
end

def print_goodbye
  print "\n"
  lc_prompt('Thank you for using the loan calculator!')
  print "\n"
end

def valid_loan_amount?(amount)
  amount >= MIN_LOAN_AMOUNT_INCL
end

def valid_loan_duration?(months)
  months >= MIN_LOAN_DURATION_MONTHS_INCL &&
    months <= MAX_LOAN_DURATION_MONTHS_INCL
end

def valid_loan_apr?(apr)
  apr >  MIN_LOAN_APR_PERCENT_EXCL &&
    apr <= MAX_LOAN_APR_PERCENT_INCL
end

def retrieve_loan_amount
  valid_amount = nil
  loop do
    lc_prompt(MSG_GET_LOAN_AMT, false)
    answer = gets.chomp
    valid_found = false
    # loan amount can be float or int, but float is prioritized
    if valid_float_str?(answer) && valid_loan_amount?(answer.to_f)
      valid_amount = answer.to_f
      valid_found = true
    elsif valid_int_str?(answer) && valid_loan_amount?(answer.to_i)
      valid_amount = answer.to_i
      valid_found = true
    else
      lc_prompt(MSG_ERR_LOAN_AMT)
    end
    break if valid_found
  end
  valid_amount
end

def retrieve_loan_apr
  valid_amount = nil
  loop do
    lc_prompt(MSG_GET_LOAN_APR_PERC, false)
    answer = gets.chomp
    valid_found = false
    # loan apr can be float or int, but float is prioritized
    if valid_float_str?(answer) && valid_loan_apr?(answer.to_f)
      valid_amount = answer.to_f
      valid_found = true
    elsif valid_int_str?(answer) && valid_loan_apr?(answer.to_i)
      valid_amount = answer.to_i
      valid_found = true
    else
      lc_prompt(MSG_ERR_LOAN_APR_PERC)
    end
    break if valid_found
  end
  valid_amount
end

def retrieve_loan_duration
  valid_duration = nil
  loop do
    lc_prompt(MSG_GET_LOAN_MONTHS, false)
    answer = gets.chomp
    valid_found = false
    # loan duration can be int only
    if valid_int_str?(answer) && valid_loan_duration?(answer.to_i)
      valid_duration = answer.to_i
      valid_found = true
    else
      lc_prompt(MSG_ERR_LOAN_MONTHS)
    end
    break if valid_found
  end
  valid_duration
end

def display_loan_input_data(amount, months, apr)
  lc_prompt("Breakdown of your eventual loan")
  puts format("\t-Loan amount:                 %.2f$",  amount)
  puts format("\t-Loan duration in months:     %.2d",   months)
  puts format("\t-APR(Annual Percentage Rate): %.2f%%", apr)
end

def display_loan_details(monthly, interest, interest_total, grand_total)
  puts format("\t-Monthly payment:             %.2f$", monthly)
  puts format("\t-Monthly interest amount:     %.2f$", interest)
  puts format("\t-Total interest amount:       %.2f$", interest_total)
  puts format("\t-Total to be repaid:          %.2f$", grand_total)
end

# start
print_welcome

# retrieve loan amount, duration and apr
amount_loan     = retrieve_loan_amount
duration_months = retrieve_loan_duration
percentage_apr  = retrieve_loan_apr

# compute loan details
amount_monthly = monthly_amount_with_apr(amount_loan,
                                         duration_months,
                                         percentage_apr)
amount_monthly_interest = monthly_interest(amount_loan,
                                           duration_months,
                                           amount_monthly)
amount_interest_total = amount_monthly_interest * duration_months
amount_grand_total    = amount_loan + amount_interest_total

# display complete loan breakdown
display_loan_input_data(amount_loan, duration_months, percentage_apr)
display_loan_details(amount_monthly,        amount_monthly_interest,
                     amount_interest_total, amount_grand_total)

# end
print_goodbye
