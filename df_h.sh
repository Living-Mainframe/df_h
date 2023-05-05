#!/bin/sh

# Print the header
printf "%-30s %10s %10s %10s %6s %s\n" "Filesystem" "Size" "Used" "Available" "Use%" "Mounted on"

# Get the output of df with provided parameters, skip the first line (header), and process each line
df "$@" | tail -n +2 | awk '{
   # Extract the available and total sizes (in 512-byte blocks) and calculate used size
   split($3, sizes, "/");
   available = sizes[1] * 512 / 1024;
   total = sizes[2] * 512 / 1024;
   used = total - available;

   # Convert the sizes to a human-readable format
   units[0]="K"; units[1]="M"; units[2]="G"; units[3]="T"; units[4]="P";
   unit="";
   for (i=4; i>=0; i--) {
	   if (total >= (1024 ** i)) {
		   total /= (1024 ** i);
		   used /= (1024 ** i);
		   available /= (1024 ** i);
		   unit = units[i];
		   break;
	   }
   }

   # Calculate usage percentage
   use_percentage = used / (used + available) * 100;
   # Print the line
   printf "%-30s %10.1f%s %10.1f%s %10.1f%s %6.1f%% %s\n", $2, total, unit, used, unit, available, unit, use_percentage, $1
}'

