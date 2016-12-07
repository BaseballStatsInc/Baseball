# Example of running adjusted ops

library(Baseball)
dat = read.csv(file = "./Baseball/Data/MLB_2016_teams_batting.csv")

singles = dat$H - dat$X2B - dat$X3B - dat$HR
doubles = dat$X2B
triples = dat$X3B
hr = dat$HR
bb = dat$BB
pa = dat$PA
ab = dat$AB
r = dat$R

real_ops = adjusted_ops(singles, doubles, triples, hr, bb, pa, ab, r)
