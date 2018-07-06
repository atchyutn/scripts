#savings calculator program for macbook

#This program calculates the amount to be saved each week based on the week number(week number * Dollar value)

require 'active_support/all'

sum = 0

weeks = Array(1...52)

weeks.each do |w|
  amt = w*65
  puts "Amount to be paid in #{w} week ₹#{amt} before " + (Date.today + w.weeks).to_s
  puts "---------Month END---------" if w % 4 == 0
  sum = sum + amt
end
puts "***********************************"
puts "***********************************"
puts "Total amount save per year ₹#{sum}"
puts "***********************************"
puts "***********************************"

=begin

Output: 

Amount to be paid in 1 week ₹65 before 2018-07-13
Amount to be paid in 2 week ₹130 before 2018-07-20
Amount to be paid in 3 week ₹195 before 2018-07-27
Amount to be paid in 4 week ₹260 before 2018-08-03
---------Month END---------
Amount to be paid in 5 week ₹325 before 2018-08-10
Amount to be paid in 6 week ₹390 before 2018-08-17
Amount to be paid in 7 week ₹455 before 2018-08-24
Amount to be paid in 8 week ₹520 before 2018-08-31
---------Month END---------
Amount to be paid in 9 week ₹585 before 2018-09-07
Amount to be paid in 10 week ₹650 before 2018-09-14
Amount to be paid in 11 week ₹715 before 2018-09-21
Amount to be paid in 12 week ₹780 before 2018-09-28
---------Month END---------
Amount to be paid in 13 week ₹845 before 2018-10-05
Amount to be paid in 14 week ₹910 before 2018-10-12
Amount to be paid in 15 week ₹975 before 2018-10-19
Amount to be paid in 16 week ₹1040 before 2018-10-26
---------Month END---------
Amount to be paid in 17 week ₹1105 before 2018-11-02
Amount to be paid in 18 week ₹1170 before 2018-11-09
Amount to be paid in 19 week ₹1235 before 2018-11-16
Amount to be paid in 20 week ₹1300 before 2018-11-23
---------Month END---------
Amount to be paid in 21 week ₹1365 before 2018-11-30
Amount to be paid in 22 week ₹1430 before 2018-12-07
Amount to be paid in 23 week ₹1495 before 2018-12-14
Amount to be paid in 24 week ₹1560 before 2018-12-21
---------Month END---------
Amount to be paid in 25 week ₹1625 before 2018-12-28
Amount to be paid in 26 week ₹1690 before 2019-01-04
Amount to be paid in 27 week ₹1755 before 2019-01-11
Amount to be paid in 28 week ₹1820 before 2019-01-18
---------Month END---------
Amount to be paid in 29 week ₹1885 before 2019-01-25
Amount to be paid in 30 week ₹1950 before 2019-02-01
Amount to be paid in 31 week ₹2015 before 2019-02-08
Amount to be paid in 32 week ₹2080 before 2019-02-15
---------Month END---------
Amount to be paid in 33 week ₹2145 before 2019-02-22
Amount to be paid in 34 week ₹2210 before 2019-03-01
Amount to be paid in 35 week ₹2275 before 2019-03-08
Amount to be paid in 36 week ₹2340 before 2019-03-15
---------Month END---------
Amount to be paid in 37 week ₹2405 before 2019-03-22
Amount to be paid in 38 week ₹2470 before 2019-03-29
Amount to be paid in 39 week ₹2535 before 2019-04-05
Amount to be paid in 40 week ₹2600 before 2019-04-12
---------Month END---------
Amount to be paid in 41 week ₹2665 before 2019-04-19
Amount to be paid in 42 week ₹2730 before 2019-04-26
Amount to be paid in 43 week ₹2795 before 2019-05-03
Amount to be paid in 44 week ₹2860 before 2019-05-10
---------Month END---------
Amount to be paid in 45 week ₹2925 before 2019-05-17
Amount to be paid in 46 week ₹2990 before 2019-05-24
Amount to be paid in 47 week ₹3055 before 2019-05-31
Amount to be paid in 48 week ₹3120 before 2019-06-07
---------Month END---------
Amount to be paid in 49 week ₹3185 before 2019-06-14
Amount to be paid in 50 week ₹3250 before 2019-06-21
Amount to be paid in 51 week ₹3315 before 2019-06-28
***********************************
***********************************
Total amount save per year ₹86190
***********************************
***********************************

=end