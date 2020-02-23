
# from decimal import Decimal
import re


def py_check_special_charator(string):
    regex = re.compile('[@_!#$%^&*()<>?/\|}{~:]')       # list of special charector that should be checking
    if (regex.search(string) == None):
        return 'String is accepted'
    else:
        return 'String is not accepted.'

def py_check_decimal_number(decimal):
    try:
        result = float(decimal) # convert string to decimal
        decimal_num2 = format(result, '.2f')
        return (decimal_num2)           # return <decimal value> if can convert to decimal , return an error message if can't convert to decimal
    except ValueError as err:           # returns an error message if an error cannot be processed
        return 'false'

def py_check_total_amount(expected_totalAmount, payorDisc, netAmount):
    try:
        print('expected_totalAmount = ' + expected_totalAmount)
        print('payorDisc = ' + payorDisc)
        print('netAmount = ' + netAmount)

        expected_totalAmount_float = float(expected_totalAmount)
        payorDisc_float = float(payorDisc)
        netAmount_float = float(netAmount)

        sum = payorDisc_float + netAmount_float
        print(sum)

        if expected_totalAmount_float == sum:
            return 'true'
        else:
            return 'false'
    except ValueError as err:       # returns an error message if an error cannot be processed
        return (err)

def py_compare_net_amount(grandTotalOfnetAmount, totalNetAmount):
    try:
        print('grand total of net amount = ' + grandTotalOfnetAmount)
        print('total net amount = ' + totalNetAmount)

        grandTotalOfnetAmount_float = float(grandTotalOfnetAmount)
        totalNetAmount_float = float(totalNetAmount)

        if grandTotalOfnetAmount_float == totalNetAmount_float:
            return 'true'
        else:
            return 'false'
    except ValueError as err:       # returns an error message if an error cannot be processed
        return (err)