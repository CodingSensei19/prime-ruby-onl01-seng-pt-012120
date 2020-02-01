def primemr?
     primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
     return primes.include? self if self <= primes.last
     return false unless primes.reduce(:*).gcd(self) == 1
     wits = WITNESS_RANGES.find {|range, wits| range > self} # [range, [wit_prms]] or nil
     witnesses = wits && wits[1] || primes
     miller_rabin_test(witnesses)
   end

   private
   # Returns true if +self+ passes Miller-Rabin Test on witness +b+
   def miller_rabin_test(witnesses)     # use witness list to test with
     neg_one_mod = n = d = self - 1
     d >>= 1  while d.even?
     witnesses.each do |b|
       s = d
       y = b.to_bn.mod_exp(d, self)     # y = (b**d) mod self
       until s == n || y == 1 || y == neg_one_mod
         y = y.mod_exp(2, self)         # y = (y**2) mod self
         s <<= 1
       end
       return false unless y == neg_one_mod || s.odd?
     end
     true
   end
