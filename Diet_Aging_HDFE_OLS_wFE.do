/// Diet and aging paper HDFE and OLS regressions: 
clear
cd "C:\Users\zhuch\diet_aging"

***********************************************************************************
***********************************************************************************
***********************************************************************************

*****
use diet_data.dta, clear
*****
		
////////////////////////////////////////////////////
///                    1. HDFE                   ///
////////////////////////////////////////////////////

local aaa "cookedvegetableintakeinstance0 saladrawvegetableintakeinstance0 freshfruitintakeinstance0 driedfruitintakeinstance0 breadintakeinstance0 cerealintakeinstance0 oilyfishintakeinstance0 nonoilyfishintakeinstance0 processedmeatintakeinstance0 poultryintakeinstance0 beefintakeinstance0 lambmuttonintakeinstance0 porkintakeinstance0 cheeseintakeinstance0 milkintake hotdrink coffeeintakeinstance0 teaintakeinstance0"
	
foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' `aaa' male college age bmi Townsend_deprivation_index pca1-pca10, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' lowcarb3 highcarb3 highprotein lowfat1 highfat keto male college age bmi Townsend_deprivation_index pca1-pca10 if missing_nutrient==0, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' avg_protein avg_carbohydrate avg_fat male college age bmi Townsend_deprivation_index pca1-pca10 if missing_nutrient==0, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' HEI_score male college age bmi Townsend_deprivation_index pca1-pca10 if missing_nutrient==0, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}

foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' DASH_score male college age bmi Townsend_deprivation_index pca1-pca10 if missing_nutrient==0, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}

foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reghdfe `var' Food_Diversity_score male college age bmi Townsend_deprivation_index pca1-pca10 if missing_nutrient==0, absorb(occupation ethnic_cat region_cat ethnic_cat#region_cat) vce(cluster local_authority_code)
	outreg2 using diet_habit_reghdfe.xml, dec(4) append
}



////////////////////////////////////////////////////
///                    2. OLS                    ///
////////////////////////////////////////////////////

local aaa "cookedvegetableintakeinstance0 saladrawvegetableintakeinstance0 freshfruitintakeinstance0 driedfruitintakeinstance0 breadintakeinstance0 cerealintakeinstance0 oilyfishintakeinstance0 nonoilyfishintakeinstance0 processedmeatintakeinstance0 poultryintakeinstance0 beefintakeinstance0 lambmuttonintakeinstance0 porkintakeinstance0 cheeseintakeinstance0 milkintake hotdrink coffeeintakeinstance0 teaintakeinstance0"
foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' `aaa' male college age bmi Townsend_deprivation_index pca1-pca10 i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_cat, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' lowcarb3 highcarb3 highprotein lowfat1 highfat keto male college age bmi Townsend_deprivation_index pca1-pca10 i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_ca if missing_nutrient==0, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' avg_protein avg_carbohydrate avg_fat male college age bmi Townsend_deprivation_index pca1-pca10 i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_ca if missing_nutrient==0, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}


foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' HEI_score male college age bmi Townsend_deprivation_index pca1-pca10  i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_ca if missing_nutrient==0, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}

foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' DASH_score male college age bmi Townsend_deprivation_index pca1-pca10 i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_ca if missing_nutrient==0, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}

foreach var of varlist zadjustedtsloginstance0 age_pheno grey_matter_volume white_matter_volume {
	reg `var' Food_Diversity_score male college age bmi Townsend_deprivation_index pca1-pca10 i.occupation_cat i.ethnic_cat i.region_cat ethnic_cat##region_ca if missing_nutrient==0, vce(cluster local_authority_code)
	outreg2 using diet_habit_ols.xml, dec(4) append
}



