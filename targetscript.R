targets <- read.csv(file = '/pfs/targets/target_raw.csv')

# Rename columns to match target schema
names(targets)[names(targets) == "Type.of.target"] <- "target_type"
names(targets)[names(targets) == "Base.year"] <- "baseline_year"
names(targets)[names(targets) == "Target.year"] <- "target_year"
names(targets)[names(targets) == "Target.year.absolute.emissions..metric.tonnes.CO2e."] <- "target_value"
targets$target_unit = rep(c("metric tonnes"),times=nrow(targets))
names(targets)[names(targets) == "Estimated.business.as.usual.absolute.emissions.in.target.year..metric.tonnes.CO2e."] <- "bau_value"
names(targets)[names(targets) == "Percentage.of.target.achieved.so.far"] <- "percent_achieved"
targets$data_source = rep(c("CDP"),times=nrow(targets))
is_net_zero <- as.list(targets["target_value"]==0)
targets$is_net_zero <- is_net_zero
names(targets)[names(targets) == "Last.update"] <- "last_updated"
targets <- subset(targets, select=c("target_type", "baseline_year", "target_year", "target_value", "target_unit", "bau_value", "percent_achieved", "data_source", "target_value", "is_net_zero", "last_updated"))

print(names(targets))
targets <- apply(targets,2,as.character)
write.csv(targets,"/pfs/out/targets_clean.csv", row.names = FALSE)