#-----------------------------------------------------------------------------#
# load.R
# Type: R loading script

# AUTHOR:
# Tyler Huntington, 2017
# JBEI Sustainability Research Group
# Project: Feedstock Agnostic Biorefinery Study

# PURPOSE:
# A script to load all the raw data for the Feedstock Agnostic analysis


# SIDE-EFFECTS:

#-----------------------------------------------------------------------------#

###### OPTIONAL: CONFIGURE WORKSPACE ######

# # set working directory to this script's location
# source("GetScriptDir_fun.R")
# this.dir <- dirname(GetScriptDir())
# setwd(this.dir)

# # clear workspace
# rm(list=ls())

#-----------------------------------------------------------------------------#

# Load libraries
require(raster)


# load current US biorefinery profiles (Source: Renewable Fuels Association)
bioref_profiles.df <- 
  read.csv("../raw_data_files/current_US_biorefineries.csv", 
           header = T,
           colClasses = "character")

# export as binary data file
saveRDS(bioref_profiles.df, "../raw_binary_data/raw_biorefs.df.RDS")

# load US county boundary shapefile (Source: US Census TIGER/Line)
county_bounds.spdf <- 
  rgdal::readOGR(dsn = paste0("../raw_data_files/counties/", 
                              "cb_2016_us_county_20m.shp"),
                 layer = "cb_2016_us_county_20m")

# export as binary data file
saveRDS(county_bounds.spdf, "../raw_binary_data/raw_county_bounds.spdf.RDS")

# load US state boundary shapefile (Source: US Census TIGER/Line)
state_bounds.spdf <- 
  rgdal::readOGR(dsn = "../raw_data_files/states/cb_2016_us_state_20m.shp",
                 layer = "cb_2016_us_state_20m")

# export as binary data file
saveRDS(state_bounds.spdf, "../raw_binary_data/raw_state_bounds.spdf.RDS")

# load US national road network (primary and secondary) shapefile (Source: USDT)
roads.sldf <- 
  rgdal::readOGR(dsn = paste0("../raw_data_files/roads/",
                 "US.primary.secondary.roads.shp"),
                 layer = "US.primary.secondary.roads")

# export as binary data file
saveRDS(roads.sldf, "../raw_binary_data/raw_roads.sldf.RDS")


# load state fips key data
state_fips_key.df <- read.csv("../raw_data_files/state_fips_key.csv", 
                               header = T,
                               colClasses = "character")

# export as binary data file
saveRDS(state_fips_key.df, "../raw_binary_data/raw_state_fips_key.df.RDS")


# load billion ton study biomass data for all crops for 2018, 2030, and 2040
bt_all_crops.df <- 
  read.csv("../raw_data_files/bt_biomass_yrs_18_30_40.csv", 
           header = T,
           colClasses = "character")

# export as binary data file
saveRDS(bt_all_crops.df, "../raw_binary_data/raw_bt_all_crops_18_30_40.df.RDS")


