### Prepping QOG Data ###
library(readr)
df <- read_csv("images/full_data/qog_std_cs_jan22.csv")

library(tidyverse)

# ti_cpi - Corruption Perception index
# vdem_academ - Academic Freedom index 
# wdi_fertility - Fertility rate
# wdi_afp - Armed forces personnel as percent of labor force
# bl_asymf - Average years in school 
# wdi_expedu - Ed spending as a percentage of GDP 
# wdi_elprodcoal - Percent of energy from coal 
# wef_iu - Percent of population on internet
# wdi_foodins - Percent severe food insecurity 
# ht_colonial - Colonized status 
# lp_legor - legal orgin 
# cai_foetal - Foetal impairment is accepted as grounds for legal abortion
# cai_mental - Threat to mental health grounds for legal abortion
# cai_physical - Threat to physical health grounds for legal abortion 
# ccp_initiat - Legalistive initiative in the constitution
# ccp_market - Reference to capitalism in the constitution 
# h_j - Independent judiciary
# wdi_homicides - homicides per 100,000 people
# ccp_strike - Right to strike in the consitution 
# wdi_lfpr - Labor force particiption
# br_pvote - Proportional voting 
# br_elect - Election typology 
# van_part - Participation
# bmr_demdur - Years of current regime 
# fh_polity2 - Level of Democracy (Freedom House)
# vdem_polyarchy - Electoral democracy
# mad_gdppc - GDP per capital
# top_top1_income_share - top 1 percent income
# wef_sp - Scientific publiciations H index

df <- df |> select(cname, ccode, ti_cpi, vdem_academ, wdi_fertility, wdi_afp, bl_asymf, wdi_expedu, wdi_elprodcoal, wef_iu, wdi_foodins, ht_colonial, lp_legor, cai_foetal, cai_mental, cai_physical, ccp_initiat, ccp_market, h_j, wdi_homicides, ccp_strike, wdi_lfpr, br_pvote, br_pvote, br_elect, van_part, bmr_demdur, fh_polity2, vdem_polyarchy, mad_gdppc, top_top1_income_share, wef_sp) 

write_csv(df, "images/country_data.csv")
