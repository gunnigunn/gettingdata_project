# gettingdata_project
Final project for the Getting and Cleaning Data on Coursera.

The analysis is performed by the script run_analysis.R and is done in several steps

1. The data is read from files (stored in a subdirectory ./data)
2. Column names are added to both movement data and descriptive data (subject, activities).
3. The relevant data columns are found by selecting all columns containing the words "mean", "Mean", "std" or "Std"
4. The required analysis is then performed
5. The resulting data set, called avg_data, is then saved to a text file
6. A code book was then created
