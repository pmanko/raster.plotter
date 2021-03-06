## Blocks:
## Input:
## subject_code, start_labtime, end_labtime, <some label>
## Output:
## subject_code, day, start_labtime, end_labtime, <some label>
setup_block_data <- function(dataset) {
  dataset <- copy(dataset)
  dataset[,c('start_day_number', 'start_labtime', 'end_day_number', 'end_labtime'):=c(set_days(start_labtime),set_days(end_labtime))]
  dataset <- rbindlist(list(dataset[start_day_number==end_day_number], split_day_spanning_blocks(dataset[start_day_number!=end_day_number])))
  dataset[,day:=start_day_number]
  dataset
}

## Points:
## Input:
## subject_code, labtime, <some numerical value>
## Output:
## subject_code, day, labtime, <some numerical value>
setup_point_data <- function(dataset) {
  dataset <- copy(dataset)
  dataset[,c('day','labtime'):=set_days(labtime)]
  dataset
}
  