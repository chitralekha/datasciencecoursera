*Please open in raw format on git hub to read teh data easily.

1.Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The tidy data set has the average of each variable for each activity and each subject. 

2. Data Preparation. 

The data was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data in folder test and train were merged. Following steps were performed to get just std and mean variables for each subject and activity id.

-read the files from test set.

-assign the column names for activity table and subject table.

-make the features(xtest) column names readable by getting rid of extra characters. This involved getting rid of "." and "()" and 
 selecting just std and mean variables.
 
-merge all the tables of test.

-read the files from train set.

-assign the column names for activity table and subject table.

-make the features(ytest) column names readable by getting rid of extra characters.This involved getting rid of "." and "()" and 
 selecting just std and mean variables.
 
-merge all the tables of train.

-Merge the train and test data.

-Create the tidy data.

-Have the tidayData sorted by subject id and activity id.

Following the above steps, I got dataframe of 68 columns and 180 rows.

Below is the example of head(tidyData) for Subject id 1.

    subject activityId           activity tBodyAcc.mean.X tBodyAcc.mean.Y tBodyAcc.mean.Z tBodyAcc.std.X tBodyAcc.std.Y
91        1          1            WALKING       0.2773308    -0.017383819      -0.1111481    -0.28374026    0.114461337
151       1          2   WALKING_UPSTAIRS       0.2554617    -0.023953149      -0.0973020    -0.35470803   -0.002320265
121       1          3 WALKING_DOWNSTAIRS       0.2891883    -0.009918505      -0.1075662     0.03003534   -0.031935943
31        1          4            SITTING       0.2612376    -0.001308288      -0.1045442    -0.97722901   -0.922618642
61        1          5           STANDING       0.2789176    -0.016137590      -0.1106018    -0.99575990   -0.973190056
1         1          6             LAYING       0.2215982    -0.040513953      -0.1132036    -0.92805647   -0.836827406


    tBodyAcc.std.Z tGravityAcc.mean.X tGravityAcc.mean.Y tGravityAcc.mean.Z tGravityAcc.std.X tGravityAcc.std.Y
91     -0.26002790          0.9352232         -0.2821650        -0.06810286        -0.9766096        -0.9713060
151    -0.01947924          0.8933511         -0.3621534        -0.07540294        -0.9563670        -0.9528492
121    -0.23043421          0.9318744         -0.2666103        -0.06211996        -0.9505598        -0.9370187
31     -0.93958629          0.8315099          0.2044116         0.33204370        -0.9684571        -0.9355171
61     -0.97977588          0.9429520         -0.2729838         0.01349058        -0.9937630        -0.9812260
1      -0.82606140         -0.2488818          0.7055498         0.44581772        -0.8968300        -0.9077200


    tGravityAcc.std.Z tBodyAccJerk.mean.X tBodyAccJerk.mean.Y tBodyAccJerk.mean.Z tBodyAccJerk.std.X tBodyAccJerk.std.Y
91         -0.9477172          0.07404163        0.0282721096        -0.004168406        -0.11361560          0.0670025
151        -0.9123794          0.10137273        0.0194863076        -0.045562545        -0.44684389         -0.3782744
121        -0.8959397          0.05415532        0.0296504490        -0.010971973        -0.01228386         -0.1016014
31         -0.9490409          0.07748252       -0.0006191028        -0.003367792        -0.98643071         -0.9813720
61         -0.9763241          0.07537665        0.0079757309        -0.003685250        -0.99460454         -0.9856487
1          -0.8523663          0.08108653        0.0038382040         0.010834236        -0.95848211         -0.9241493


    tBodyAccJerk.std.Z tBodyGyro.mean.X tBodyGyro.mean.Y tBodyGyro.mean.Z tBodyGyro.std.X tBodyGyro.std.Y tBodyGyro.std.Z
91          -0.5026998      -0.04183096      -0.06953005       0.08494482      -0.4735355    -0.054607769      -0.3442666
151         -0.7065935       0.05054938      -0.16617002       0.05835955      -0.5448711     0.004105184      -0.5071687
121         -0.3457350      -0.03507819      -0.09093713       0.09008501      -0.4580305    -0.126349195      -0.1247025
31          -0.9879108      -0.04535006      -0.09192415       0.06293138      -0.9772113    -0.966473895      -0.9414259
61          -0.9922512      -0.02398773      -0.05939722       0.07480075      -0.9871919    -0.987734440      -0.9806456
1           -0.9548551      -0.01655309      -0.06448612       0.14868944      -0.8735439    -0.951090440      -0.9082847


    tBodyGyroJerk.mean.X tBodyGyroJerk.mean.Y tBodyGyroJerk.mean.Z tBodyGyroJerk.std.X tBodyGyroJerk.std.Y
91           -0.08999754          -0.03984287          -0.04613093          -0.2074219          -0.3044685
151          -0.12223277          -0.04214859          -0.04071255          -0.6147865          -0.6016967
121          -0.07395920          -0.04399028          -0.02704611          -0.4870273          -0.2388248
31           -0.09367938          -0.04021181          -0.04670263          -0.9917316          -0.9895181
61           -0.09960921          -0.04406279          -0.04895055          -0.9929451          -0.9951379
1            -0.10727095          -0.04151729          -0.07405012          -0.9186085          -0.9679072


    tBodyGyroJerk.std.Z tBodyAccMag.mean tBodyAccMag.std tGravityAccMag.mean tGravityAccMag.std tBodyAccJerkMag.mean
91           -0.4042555      -0.13697118     -0.21968865         -0.13697118        -0.21968865          -0.14142881
151          -0.6063320      -0.12992763     -0.32497093         -0.12992763        -0.32497093          -0.46650345
121          -0.2687615       0.02718829      0.01988435          0.02718829         0.01988435          -0.08944748
31           -0.9879358      -0.94853679     -0.92707842         -0.94853679        -0.92707842          -0.98736420
61           -0.9921085      -0.98427821     -0.98194293         -0.98427821        -0.98194293          -0.99236779
1            -0.9577902      -0.84192915     -0.79514486         -0.84192915        -0.79514486          -0.95439626


    tBodyAccJerkMag.std tBodyGyroMag.mean tBodyGyroMag.std tBodyGyroJerkMag.mean tBodyGyroJerkMag.std fBodyAcc.mean.X
91          -0.07447175       -0.16097955       -0.1869784            -0.2987037           -0.3253249     -0.20279431
151         -0.47899162       -0.12673559       -0.1486193            -0.5948829           -0.6485530     -0.40432178
121         -0.02578772       -0.07574125       -0.2257244            -0.2954638           -0.3065106      0.03822918
31          -0.98412002       -0.93089249       -0.9345318            -0.9919763           -0.9883087     -0.97964124
61          -0.99309621       -0.97649379       -0.9786900            -0.9949668           -0.9947332     -0.99524993
1           -0.92824563       -0.87475955       -0.8190102            -0.9634610           -0.9358410     -0.93909905


    fBodyAcc.mean.Y fBodyAcc.mean.Z fBodyAcc.std.X fBodyAcc.std.Y fBodyAcc.std.Z fBodyAccJerk.mean.X fBodyAccJerk.mean.Y
91      0.089712726      -0.3315601    -0.31913472     0.05604001    -0.27968675         -0.17054696         -0.03522552
151    -0.190976721      -0.4333497    -0.33742819     0.02176951     0.08595655         -0.47987525         -0.41344459
121     0.001549908      -0.2255745     0.02433084    -0.11296374    -0.29792789         -0.02766387         -0.12866716
31     -0.944084550      -0.9591849    -0.97641231    -0.91727501    -0.93446956         -0.98659702         -0.98157947
61     -0.977070848      -0.9852971    -0.99602835    -0.97229310    -0.97793726         -0.99463080         -0.98541870
1      -0.867065205      -0.8826669    -0.92443743    -0.83362556    -0.81289156         -0.95707388         -0.92246261


    fBodyAccJerk.mean.Z fBodyAccJerk.std.X fBodyAccJerk.std.Y fBodyAccJerk.std.Z fBodyGyro.mean.X fBodyGyro.mean.Y
91           -0.4689992         -0.1335866          0.1067399         -0.5347134       -0.3390322      -0.10305942
151          -0.6854744         -0.4619070         -0.3817771         -0.7260402       -0.4926117      -0.31947461
121          -0.2883347         -0.0863279         -0.1345800         -0.4017215       -0.3524496      -0.05570225
31           -0.9860531         -0.9874930         -0.9825139         -0.9883392       -0.9761615      -0.97583859
61           -0.9907522         -0.9950738         -0.9870182         -0.9923498       -0.9863868      -0.98898446
1            -0.9480609         -0.9641607         -0.9322179         -0.9605870       -0.8502492      -0.95219149


    fBodyGyro.mean.Z fBodyGyro.std.X fBodyGyro.std.Y fBodyGyro.std.Z fBodyAccMag.mean fBodyAccMag.std
91       -0.25594094      -0.5166919     -0.03350816      -0.4365622      -0.12862345      -0.3980326
151      -0.45359721      -0.5658925      0.15153891      -0.5717078      -0.35239594      -0.4162601
121      -0.03186943      -0.4954225     -0.18141473      -0.2384436       0.09658453      -0.1865303
31       -0.95131554      -0.9779042     -0.96234504      -0.9439178      -0.94778292      -0.9284448
61       -0.98077312      -0.9874971     -0.98710773      -0.9823453      -0.98535636      -0.9823138
1        -0.90930272      -0.8822965     -0.95123205      -0.9165825      -0.86176765      -0.7983009


    fBodyBodyAccJerkMag.mean fBodyBodyAccJerkMag.std fBodyBodyGyroMag.mean fBodyBodyGyroMag.std fBodyBodyGyroJerkMag.mean
91               -0.05711940              -0.1034924            -0.1992526           -0.3210180                -0.3193086
151              -0.44265216              -0.5330599            -0.3259615           -0.1829855                -0.6346651
121               0.02621849              -0.1040523            -0.1857203           -0.3983504                -0.2819634
31               -0.98526213              -0.9816062            -0.9584356           -0.9321984                -0.9897975
61               -0.99254248              -0.9925360            -0.9846176           -0.9784661                -0.9948154
1                -0.93330036              -0.9218040            -0.8621902           -0.8243194                -0.9423669


    fBodyBodyGyroJerkMag.std
91                -0.3816019
151               -0.6939305
121               -0.3919199
31                -0.9870496
61                -0.9946711
1                 -0.9326607

3. Varibales information:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


4. Variable Names with description:

[1]"subject"   : Refers to subject id 1 to 30.

[2]"activityId" :  the values are 1 to 6.  

[3]"activity" : Links to activity id with 6 activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

[4]"tBodyAcc.mean.X" : Mean value of tBodyAcc in X direction. 

[5]"tBodyAcc.mean.Y" : Mean value of tBodyAcc in Y direction. 

[6]"tBodyAcc.mean.Z" : Mean value of tBodyAcc in Z direction. 

[7]"tBodyAcc.std.X": Standard deviation value of tBodyAcc in X direction.  

[8]"tBodyAcc.std.Y" : Standard deviation value of tBodyAcc in Y direction.   

[9] "tBodyAcc.std.Z": Standard deviation value of tBodyAcc in Z direction.  

[10]"tGravityAcc.mean.X": Mean value of tGravityAcc in X direction.   

[11]"tGravityAcc.mean.Y": Mean value of tGravityAcc in Y direction.    

[12]"tGravityAcc.mean.Z": Mean value of tGravityAcc in Z direction.   

[13]"tGravityAcc.std.X" : Standard deviation of tGravityAcc in X direction.   

[14]"tGravityAcc.std.Y" : Standard deviation of tGravityAcc in Y direction.   

[15]"tGravityAcc.std.Z" : Standard deviation of tGravityAcc in Z direction.   

[16]"tBodyAccJerk.mean.X": Mean value of tBodyAccJerk in X direction. 

[17]"tBodyAccJerk.mean.Y": Mean value of tBodyAccJerk in Y direction.  

[18]"tBodyAccJerk.mean.Z": Mean value of tBodyAccJerk in Z direction.  

[19]"tBodyAccJerk.std.X": Standard deviation of tBodyAccJerk in X direction. 

[20]"tBodyAccJerk.std.Y": Standard deviation of tBodyAccJerk in Y direction.  

[21]"tBodyAccJerk.std.Z": Standard deviation of tBodyAccJerk in Z direction. 

[22]"tBodyGyro.mean.X": Mean value of tBodyGyro in X direction.  

[23]"tBodyGyro.mean.Y": Mean value of tBodyGyro in Y direction. 

[24]"tBodyGyro.mean.Z": Mean value of tBodyGyro in Z direction. 

[25]"tBodyGyro.std.X": Standard deviation of tBodyGyro in X direction. 

[26]"tBodyGyro.std.Y": Standard deviation of tBodyGyro in Y direction. 

[27]"tBodyGyro.std.Z": Standard deviation of tBodyGyro in Z direction.  

[28]"tBodyGyroJerk.mean.X": Mean value of tBodyGyroJerk in X direction. 

[29]"tBodyGyroJerk.mean.Y": Mean value of tBodyGyroJerk in Y direction. 

[30]"tBodyGyroJerk.mean.Z": Mean value of tBodyGyroJerk in Z direction. 

[31]"tBodyGyroJerk.std.X": Standard deviation of tBodyGyroJerk in X direction. 

[32]"tBodyGyroJerk.std.Y": Standard deviation of tBodyGyroJerk in Y direction. 

[33]"tBodyGyroJerk.std.Z": Standard deviation of tBodyGyroJerk in Z direction. 

[34]"tBodyAccMag.mean": Mean value of tBodyAccMag.  

[35]"tBodyAccMag.std": Standard deviation of tBodyAccMag.  

[36]"tGravityAccMag.mean": Mean value of tGravityAccMag.  

[37]"tGravityAccMag.std": Standard deviation of tGravityAccMag.  

[38]"tBodyAccJerkMag.mean": Mean value of tBodyAccJerkMag. 

[39]"tBodyAccJerkMag.std":Standard deviation of tBodyAccJerkMag.  

[40]"tBodyGyroMag.mean": Mean value of tBodyGyroMag.   

[41]"tBodyGyroMag.std": Standard deviation of tBodyGyroMag. 

[42]"tBodyGyroJerkMag.mean": Mean value of tBodyGyroJerkMag. 

[43]"tBodyGyroJerkMag.std": Standard deviation of tBodyGyroJerkMag.

[44]"fBodyAcc.mean.X": Mean value of fBodyAcc in X direction.  

[45]"fBodyAcc.mean.Y": Mean value of fBodyAcc in Y direction.  

[46]"fBodyAcc.mean.Z": Mean value of fBodyAcc in Z direction.   

[47]"fBodyAcc.std.X": Standard deviation of fBodyAcc in X direction.  

[48]"fBodyAcc.std.Y": Standard deviation of fBodyAcc in Y direction. 

[49]"fBodyAcc.std.Z": Standard deviation of fBodyAcc in Z direction.   

[50]"fBodyAccJerk.mean.X": Mean value of fBodyAccJerk in X direction.  

[51]"fBodyAccJerk.mean.Y": Mean value of fBodyAccJerk in Y direction.  

[52]"fBodyAccJerk.mean.Z": Mean value of fBodyAccJerk in Z direction. 

[53]"fBodyAccJerk.std.X": Standard deviation of fBodyAccJerk in X direction.  

[54]"fBodyAccJerk.std.Y": Standard deviation of fBodyAccJerk in Y direction.   

[55]"fBodyAccJerk.std.Z": Standard deviation of fBodyAccJerk in Z direction. 

[56]"fBodyGyro.mean.X": Mean value of fBodyGyro in X direction. 

[57]"fBodyGyro.mean.Y": Mean value of fBodyGyro in Y direction.  

[58]"fBodyGyro.mean.Z": Mean value of fBodyGyro in Z direction.  

[59]"fBodyGyro.std.X": Standard deviation of fBodyGyro in X direction.  

[60]"fBodyGyro.std.Y": Standard deviation of fBodyGyro in Y direction.  

[61]"fBodyGyro.std.Z": Standard deviation of fBodyGyro in Z direction.  

[62]"fBodyAccMag.mean": Mean value of fBodyAccMag. 

[63]"fBodyAccMag.std": Standard deviation of fBodyAccMag.

[64]"fBodyBodyAccJerkMag.mean": Mean value of fBodyBodyAccJerkMag. 

[65]"fBodyBodyAccJerkMag.std": Standard deviation of fBodyBodyAccJerkMag. 

[66]"fBodyBodyGyroMag.mean": Mean value of fBodyBodyGyroMag. 

[67]"fBodyBodyGyroMag.std": Standard deviation of fBodyBodyGyroMag. 

[68]"fBodyBodyGyroJerkMag.mean": Mean value of fBodyBodyGyroJerkMag.

[69]"fBodyBodyGyroJerkMag.std": Standard deviation of "fBodyBodyGyroJerkMag. 