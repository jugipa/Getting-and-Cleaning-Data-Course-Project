# DATA DICTIONARY - 2006 HOUSING

## DATA DICTIONARY
###

#### activity	1  
    Activity Code  
1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

#### subject  2  
    An identifier of the subject who carried out the experiment (30 volunteers)  
1 .. 30

#### variable  3  
    An identifier of the subject who carried out the experiment (30 volunteers)

"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"          
"tBodyAcc-mean()-Z"  
"tBodyAcc-std()-X"

    "tBodyAcc-std()-Y"  
    "tBodyAcc-std()-Z"           
    "tGravityAcc-mean()-X"  
    "tGravityAcc-mean()-Y"       
    "tGravityAcc-mean()-Z"  
    "tGravityAcc-std()-X"  
   [11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
   [13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
   [15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
   [17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
   [19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
   [21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
   [23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
   [25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
   [27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
   [29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
   [31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
   [33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
   [35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
   [37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
   [39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
   [41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
   [43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
   [45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
   [47] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
   [49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
   [51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
   [53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
   [55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
   [57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
   [59] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
   [61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
   [63] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
   [65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

#### average  4  
    An identifier of the subject who carried out the experiment (30 volunteers)  
1 .. 30


# Markdown example

This is a simple example of a Markdown document.

Use a blank link between paragraphs.
You can use a bit of **bold** or _italics_. Use backticks to indicate
`code` that will be rendered in monospace.

Here's a list:

- an item in the list
- another item
- yet another item

You can include blocks of code using three backticks:

```
x <- rnorm(100)
y <- 2*x + rnorm(100)
```

Or you could indent four spaces:

    mean(x)
    sd(x)

It'll figure out numbered lists, too:

1. First item
2. Second item

And it's easy to create links, like to
the [Markdown](http://daringfireball.net/projects/markdown/)
page.

