# In order to load only the desired data (between 1/2/2007 and 2/2/2007),
# I grepped (shell) the data to determine the line numbers that corresponded to the first entry of 1/2/2007 and the last entry of 2/2/2007
# grep -n -C 1 '1/2/2007' household_power_consumption.txt | more # 2nd LineNumber
# grep -n -C 1 '3/2/2007' household_power_consumption.txt | more # 1st LineNumber
# The desired line numbers in the file were 66638 through 69517 (total 2880 entries)
load_data <- function()
{
	f_con <- file('household_power_consumption.txt')
	open(f_con)
	# Read the first line, just to get hold of column names
	col_data <- read.table(f_con, nrows = 1, sep = ';', header = TRUE)
	# As 2 lines have already been read, skip (66638 - 2 - 1) lines and read 2880 lines
	data <- read.table(f_con, skip = 66635, nrows = 2880, sep = ';')
	# Set the column names from the 1 row df to this df (just for convinience)
	colnames(data) <- colnames(col_data)
	close(f_con)
	# Remove the col_data as this is no londer needed
	remove(col_data)
	return (data)
}
