#Anyalsis of cPOM
#JM 22 April 2015

#imported data
cpom <- read.table("./data/cpom_PPR_leafOM_18March2015.csv", header = T, sep = ",")

#subtract crucible mass
cpom.mass <- cruc.cpom - cruc.mass
ash.mass <- cruc.ash - cruc.mass

#OM mass
om.mass.all <- cpom.mass - ash.mass
om.mass <- om.mass.all / cpom$leaf.disk

#OM %
om.prc <- (om.mass / (cpom.mass/cpom$leaf.disk)) * 100 

#combine calculated variables
cpom <- data.frame(cpom, om.prc)

#summary
summary(cpom$om.prc)
hist(cpom$om.prc)
boxplot(cpom$om.prc)
