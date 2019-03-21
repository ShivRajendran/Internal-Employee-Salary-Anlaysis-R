setwd("-----------------")
df=read.csv("---------.csv",stringsAsFactors = F)

#find average salaries per position and create our empty final data frame to append data into
agg=aggregate(df$Annual.Salary~df$Job.Title.Description,df,mean)
Empnames=data.frame(Name=c(),Tenure=c(),AnnualS=c(),AggS=c())

#Loop trough the csv file and for each employee place their positions average salary in new column which will be named AGG
#and create full name columns
for(i in 1:nrow(df)){
  ename=paste(df[i,]$First.Name,df[i,]$Last.Name)
  jtitle=df[i,]$Job.Title.Description
  emsal=df[i,]$Annual.Salary
  for(ii in 1:nrow(agg)){
    if(jtitle==agg[ii,]$`df$Job.Title.Description`){
      if(emsal<agg[ii,]$`df$Annual.Salary` & agg[ii,]$`df$Annual.Salary`-emsal>3000){
        Empnames=rbind(Empnames,data.frame(ename,df[i,]$Tenure,df[i,]$Annual.Salary,agg[ii,]$`df$Annual.Salary`))
        break
      }
    }
  }
}

#create a new column calculating the difference between the employees salary and the average salary of employees in their same position
Empnames$Diff=Empnames$agg.ii.....df.Annual.Salary.-Empnames$df.i....Annual.Salary
names(Empnames)=c("Name","Tenure","Annual","Agg","Diff")

#we want to find desrepencies where employees are being underpaid in their position, so we only want to consider higher levels of tenure
#and salary differences that exceed 5000
Empnames=Empnames[Empnames$Tenure>=6,]
Empnames=Empnames[!(Empnames$Tenure<10 & Empnames$Diff<5000),]


write.csv(Empnames,file="PersonsOfInterest.csv")
