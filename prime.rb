def prime?
  return self >= 2 if self <= 3
  return true if self == 5
  return false unless 30.gcd(self) == 1
  (7..Integer.sqrt(self)).step(30) do |p|
    return false if
      self%(p)    == 0 || self%(p+4)  == 0 || self%(p+6)  == 0 || self%(p+10) == 0 ||
      self%(p+12) == 0 || self%(p+16) == 0 || self%(p+22) == 0 || self%(p+24) == 0
  end
  true
end

# Iterates the given block over all prime numbers.
#
# See +Prime+#each for more details.
def Integer.each_prime(ubound, &block) # :yields: prime
  Prime.each(ubound, &block)
end
end
