#Anyalysis of sediment organic matter
#JM 22 April 2015

#inported data
sed <- read.table("./data/CPOM_PPR_Sediment_18March2015.csv", header = T, sep = ",")
#added treatments
treat <- c(rep(c(rep("ctl", 5), rep("cpom", 5)), 2))
sed <- data.frame(sed, treat)

#subtract crucible mass
sed.mass <- sed$cruc.sed - sed$cruc.mass
ash.mass <- sed$cruc.ash - sed$cruc.mass

#OM mass
om.mass <- sed.mass - ash.mass 

#OM %
om.prc <- (om.mass / sed.mass) * 100 

#combine calculated variables
sed <- data.frame(sed, om.prc)
# remove negative percent
sed <- sed[sed$om.prc >= 0,]

#made a plot
plot(om.prc ~ treat, data = sed, subset = sediment =="surface", ylim = c(0, 60))
plot(om.prc ~ treat, data = sed, subset = sediment == "total", ylim = c(0, 20))
plot(om.prc ~ sediment, data = sed)
