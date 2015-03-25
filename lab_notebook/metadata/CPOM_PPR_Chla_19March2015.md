# Data Entry and Metadata for Water Column and Benthic Chl a from the CPOM - PPR limitation Experiment

## Spring 2015

* file created 25 March 2015 - KF

## Metadata

These data represent the measurements taken to calculate the Chl - a concentration of the water and sediment surface in the experiment testing the effect of CPOM on primary production.

The experimental details are described in `CPOM_PPR_limitation_BOD_sampling_sp2015.md` and `CPOM_PPR_limitation_BOD_setup_sp2015.md`

Briefly the BOD bottles were filled with 100 ml of sediment slurry and 200 ml of overlying water from LPP. Half of the bottles got 20, 10 mm tulip poplar leaf disks and the other received no amendment. The bottles were then placed in the greenhouse for 7 days. At the conclusion of the incubation the overlying water was filtered through a GFF to collect water column Chl and a 0.8 X 1 cm sediment core was collected from the surface sediment, diluted to 30 ml with DI water, homogenized, and then filtered onto a GFF for benthic Chl.  The filters were extracted in 90% acetone and fluorescence was determined with a Turner Trilogy using the acidification method.

## Variables

* BOD = the identifying number of the BOD bottle used in the experiment. The letters A, B, C = the replicates of the initial samples

* type = the type of sample from which the Chl was extracted. "mud" designates the benthic samples, "water" designates the water samples.

* treat = the treatment level that was applied to the BOD bottle. "CPOM" = bottles that received 20 leaf discs and "CTL" = bottles that had no leaf litter.

* water.vol = the volume of water filtered onto the GFF (ml)

* acetone.vol = the volume of 90% acetone that was used to extract the Chl (ml)

* dilut.vol = the volume of DI water that was used to dilute the sediment core before filtering the benthic samples (ml)

* RFU.pre = the raw fluorescence units before the acid was added.

* RFU.acid = the raw fluorescence units after the acid was added.

## Data Entry

    BOD <- c(8, 3, 1, 7, 4, 6, 9, 5, 2, 10, 4, 7, 1, 3, 8, 10, 2, 5, 9, 6, "A", "B", "C")
    type <- c(rep("mud", 10), rep("water", 13))
    treat <- c(rep("CPOM", 5), rep("CTL", 5), rep("CPOM", 5), rep("CTL", 5), rep("INIT", 3))
    water.vol <- c(rep(5, 10), 35, 35, 35, 35, 35, 85, 85, 85, 55, 85, 110, 110, 110)
    acetone.vol <- c(rep(10, 23))
    dilut.vol <- c(rep(30, 10), rep(NA, 13))
    RFU.pre <- c(44452, 145855.18, 57822.56, 65744.38, 36483.97, 460309.75, 72131.48, 76209.39, 129720.81, 35166.96, 44673.07, 393727.18, 49075.35, 58333.84, 42512.87, 188634.85, 369309.25, 152689.76, 12537.64, 133951.00, 63252.50, 37882.30, 41415.94)
    RFU.acid <- c(43217.30, 138847.07, 48611.52, 77914.99, 20420.15, 157147.34, 55123.29, 47230.00, 78075.16, 53956.09, 13568.16, 97982.96, 32037.59, 39399.37, 50176.45, 14634.87, 217790.32, 43371.95, 18414.40, 63397.90, 36693.05, 20234.83, 21037.17)

    chl <- data.frame(BOD, type, treat, water.vol, acetone.vol, dilut.vol, RFU.pre, RFU.acid)

    write.table(chl, "./data/CPOM_PPR_chl_19March2015.csv", row.names = F, quote = F, sep = ",")

