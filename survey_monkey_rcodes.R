##============================================================================##
##    Making .RData file for AITI survey monkey
##    Individual Surveys from each households
##    Collecting data for ict digital skills

# The survey is saved in xlsx form, so used readxl
# Install packages if not yet installed
# Survey packages is also installed - survey designs
install.packages(c("readxl", "survey"))

# Run if needed
library(readxl)
library(survey)

# Exerting excel data into R
# Calling it Digital Skills Data
# Before doing this, make sure the excel is in the file!
digital_skills <- read_excel("Brunei ICT Survey 2024.xlsx")

# To see if its the correct data sets
head(digital_skills)


# Creating survey design object using the survey package
# Which one do we use as a cluster?
# Cluster - grouped data (urban rural?)
# Strata - grouped data to improve representatives
# The reason of using nest is because there're still some errors/missings in data
design_ds <- svydesign(ids = ~HH, strata = ~GEN , data = digital_skills,
                       nest = TRUE)


# calculating the mean of ??
svymean(~Gender, design_ds)