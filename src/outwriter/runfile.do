// OUTWRITER TESTING

qui do "/Users/bbdaniels/GitHub/stata/src/outwriter/outwriter.ado"

sysuse auto.dta, clear
reg price i.foreign##c.mpg
	est sto reg1
reg price i.foreign##c.mpg##i.rep78
	est sto reg2
	estadd scalar h = 4

outwriter reg1 reg2 using "/users/bbdaniels/desktop/test.xlsx" , stats(N r2 h) replace // colnames("Test" "HEY") rownames("1" "2" "3")
outwriter reg1 reg2 using "/users/bbdaniels/desktop/test.csv" , stats(N r2 h) replace // colnames("Test" "HEY") rownames("1" "2" "3")

mat a = [1,3\2,4]

outwriter a using "/users/bbdaniels/desktop/testmat.xlsx" , replace
outwriter a using "/users/bbdaniels/desktop/testmat.csv" , replace
outwriter a using "/users/bbdaniels/desktop/testmat.xls" , replace
