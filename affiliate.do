set more offcapture log closeclearset scheme lean2/*insheet using "data\Affiliate Billing Agreement Effort %.csv", names casedrop if Employee=="Overall Result"rename v12 percentdestring percent, replaceg FullName=FirstName + " " + LastNameorder Employee FirstName LastName FullNamedrop if EmployeeID==""log using "logs\codebook_broad_affiliates_$S_DATE.log", replacecodebook, all mv detail tabulate(10)log closesave data\AFFILIATE, replace*/log using "logs\affiliates_$S_DATE", replaceuse data\AFFILIATEcountbysort Employee Grant*: sum percentcollapse (sum) percent, by (Employee Fiscalyear Postingperiod)bysort Employee: sum percentclear