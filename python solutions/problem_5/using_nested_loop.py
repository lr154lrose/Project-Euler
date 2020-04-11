def smallest_multiple(start, end):
    found = False
    i = end
    while(not found):
        for number in range(start, end + 1):
            if(i%number == 0 and number == end):
                result = i
                found = True
            elif(i%number == 0):
                continue
            else:
                break
        i += 1
    return result

print(smallest_multiple(1, 40))
