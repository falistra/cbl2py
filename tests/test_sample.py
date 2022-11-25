# content of test_sample.py
def inc(x):
    return x + 1

def dataValueClause():
    return True

def dataRecordAreaClause():
    return False

def Ztest_answer():
    n = 0
    match n:
        case n if n < 0:
            print("Number is negative")
        case n if n == 0:
            print("Number is zero")
        case n if n > 0:
            print("Number is positive")    
