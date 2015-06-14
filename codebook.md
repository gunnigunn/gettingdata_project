# Codebook

The result of the analysis performed in *run_analysis.R* is stored in text file called avg_data.txt.

This is a aggregation of data described fully at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Three changes have been made on the data so that it differs from the description above

1. The measurements have been aggregated by taking the mean of all measurements corresponding to a (subject, activity) pair.
2. Column *subject* containing the id of the subject from which the measurements came, has been added to the movement data
3. Column *activity* containing a text description of the activity that corresponds to that row's measurements, has been added to the movement data
