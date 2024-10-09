# This program is a solution to the "Minimum Operation" problem on CodeChef. The problem is to find the minimum number of operations
# required to make all the elements of an array equal. An operation is defined as replacing an element with the greatest common divisor
# of the element and a prime number.
#
# The algorithm works as follows:
# 1. First, we calculate the greatest common divisor (gcd) of all the elements of the array.
# 2. Then, we calculate the prime factorization of the gcd.
# 3. If the gcd is greater than 1, we know that there is at least one prime factor that is not present in the array. We add this prime
#    factor to the array and then calculate the gcd again.
# 4. We repeat step 3 until the gcd is 1.
# 5. Finally, we output the number of operations required to make all the elements of the array equal.

require 'set'

# The maximum value of n in the problem is 10^6, so we set nax to 10^6 + 1.
nax = 10**6 + 1

# pr is an array of prime numbers, and lpf is an array of least prime factors.
pr = []
lpf = Array.new(nax, 0)

# is_prime is an array of boolean values indicating whether a number is prime or not.
is_prime = Array.new(nax, true)
is_prime[0] = is_prime[1] = false

# We calculate the prime numbers using the Sieve of Eratosthenes algorithm.
i = 2
while i < nax
    if is_prime[i]
        pr << i
        lpf[i] = i
        j = i * i
        while j < nax
            is_prime[j] = false
            lpf[j] = i
            j += i
        end
    end
    i += 1
end

# We read the number of test cases from the input.
t = gets.chomp.to_i

# We loop through each test case.
ii = 1
while ii <= t
    # We read the size of the array and the value of x from the input.
    n, x = gets.chomp.split.map(&:to_i)

    # We read the array from the input.
    a = gets.chomp.split.map(&:to_i)

    # We calculate the greatest common divisor of the array.
    g = a.inject(0, :gcd)

    # If the greatest common divisor is 1, we know that there is no prime factor that is not present in the array, so we output 0.
    if g == 1
        puts 0
        ii += 1
        next
    end

    # We calculate the prime factorization of the greatest common divisor.
    p = Set.new
    a.each do |t|
        while t > 1
            f = lpf[t]
            p.add(f)
            while t % f == 0
                t /= f
            end
        end
    end

    # We calculate the prime factorization of the greatest common divisor of the array.
    gp = Set.new
    while g > 1
        f = lpf[g]
        gp.add(f)
        while g % f == 0
            g /= f
        end
    end

    # If the greatest common divisor is greater than 1, we know that there is at least one prime factor that is not present in the
    # array. We add this prime factor to the array and then calculate the gcd again.
    if !gp.empty? && gp.min <= x
        puts 1
        puts gp.min
    else
        # If there is no prime factor that is not present in the array, we know that the minimum number of operations required is 2.
        # We output 2 and the two prime factors that are not present in the array.
        ok = false
        pp = pr.bsearch_index { |y| y > x }
        pp ||= pr.size
        (pp - 1).downto(0) do |i|
            if !p.include?(pr[i])
                puts 1
                puts pr[i]
                ok = true
                break
            end
        end
        if ok
            ii += 1
            next
        end
        puts "2\n2 3"
    end

    ii += 1
end
